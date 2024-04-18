Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023A2C4345F
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 22:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D100F60A52;
	Thu, 18 Apr 2024 22:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bd-SV9JJzh3d; Thu, 18 Apr 2024 22:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF79560A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF79560A5E;
	Thu, 18 Apr 2024 22:26:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB6511BF3A6
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 22:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB60F60A5E
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 22:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OC4-8gluH1QU for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 22:26:55 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=gsmecher@threespeedlogic.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6E2A60A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E2A60A52
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6E2A60A52
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 22:26:54 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6ecec796323so1476173b3a.3
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 15:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713479214; x=1714084014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OHQbZI0gujHcQYxBSsvu7XZRzWaUr1r62TMv0Z6yqAQ=;
 b=bl/BfJsIMbOLDoR4JFzqxCyReZR/rBKINVw1Y8Kl0byYm8HOTUDM2gVMgTLOs6t+rB
 n7/k4jSPJ59HHu6TKO6bZrkQCN7GbAHnEKP2tHNXSoVYrhhGOR/M1ArXXIZZdH+IR3AZ
 630hTFBhpQp7fGEgTKKK4yrHvxIpbdhi8hwifOS1+oLSnJsXAvGp8gxOVIahX/o6J8Ds
 geeB8jf3+IbeLPqUtT4acmsqcFyTVeug7l4Ry7tTFiwM8kRqZbR7HVZsaQ009MXx3RWh
 GKuHm1hBz38RI52zMUW0fBA4RGbwQ56DgdWmAkDd7vF/U9nZalVkh0hUovkdRmlV5OUg
 YVVQ==
X-Gm-Message-State: AOJu0YwC6d4QIb1qc2yu/KOnA7GO1kYh37rnco+N3HrNBUnPX2r6voP9
 JdMKXbBUjmzIBFtGpa4lWcaA/OEW1LXa5wa+djrZBilBinkDOAet1aNyfHSm2zkPlOZfKfFDOG3
 W540=
X-Google-Smtp-Source: AGHT+IH/+7od8ah759iE2ZmPzG/jugdTmbj4at/Vfrd0byTcLxti6YHmXVHDqkWVzRAH4Fws1u8n3g==
X-Received: by 2002:a05:6a00:3d04:b0:6ea:c4e5:a252 with SMTP id
 lo4-20020a056a003d0400b006eac4e5a252mr557676pfb.5.1713479213296; 
 Thu, 18 Apr 2024 15:26:53 -0700 (PDT)
Received: from boron.threespeedlogic.com (d172-218-135-26.bchsia.telus.net.
 [172.218.135.26]) by smtp.gmail.com with ESMTPSA id
 g22-20020a056a000b9600b006edf7be92c2sm1993782pfj.72.2024.04.18.15.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 15:26:52 -0700 (PDT)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Thu, 18 Apr 2024 15:26:08 -0700
Message-Id: <20240418222607.1487698-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20230601.gappssmtp.com; s=20230601; t=1713479214;
 x=1714084014; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OHQbZI0gujHcQYxBSsvu7XZRzWaUr1r62TMv0Z6yqAQ=;
 b=JYwRO0+jTdxuTBkfViaOxS8vDH3zHaC8EifP90kpXRPcLT80Bh84dsHwMEhpjE2vpc
 v04yC8tXFuusNohdb8GGlsmHfr6JaZbSDtvzFCljoLSTbWO5ct7kr/oGYM0Dp89T7cgI
 BmLSDYgR4W2GZb1AVfVnj9thVSKYPbdYuTmqTEFe+G105FpLjhULK0xFUmksNt0kNUnf
 boAdn8B3zSURdzNzaAB2RhVlH6f+6UGEGxT9672NPFS5g3oK0yczFgBhTyWkhsGzJTAX
 6WJtjAeOpiqoXUiH6t3bmEGYVvznnUDzw6Nh1AdnAK7ktd4KIGrKXpAYToherbo076j/
 j9Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=threespeedlogic.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=threespeedlogic-com.20230601.gappssmtp.com
 header.i=@threespeedlogic-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JYwRO0+j
Subject: [Buildroot] [RFC PATCH 1/1] jupyterlab: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

JupyterLab is a "web-based interactive development environment for
notebooks, code, and data. Its flexible interface allows users to
configure and arrange workflows in data science, scientific computing,
computational journalism, and machine learning." [1]

Why BuildRoot? JupyterLab makes a great
interactive front-end for embedded instrumentation:
they replace web-based interfaces, encourage open scriptability, and
bridge the gap between interactive and scripted use-cases. High-end lab
gear (think: oscilloscopes) generally comes with some of these ingredients
but it's usually vendor-specific, often half-hearted, and usually
inherit its ergonomics from IEEE-488 (no thanks).

For example: JupyterLab is already used in Xilinx's PYNQ framework [2],
which uses Yocto as a distribution builder.

[1]: https://jupyter.org
[2]: http://www.pynq.io

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
 package/Config.in                             | 21 ++++++++
 package/jupyter-client/Config.in              |  6 +++
 package/jupyter-client/jupyter-client.mk      | 15 ++++++
 package/jupyter-core/Config.in                |  6 +++
 package/jupyter-core/jupyter-core.mk          | 13 +++++
 package/jupyter-events/Config.in              |  6 +++
 package/jupyter-events/jupyter-events.mk      | 13 +++++
 package/jupyter-ipython-kernel/Config.in      |  8 +++
 .../jupyter-ipython-kernel.mk                 | 19 +++++++
 package/jupyter-nbclient/Config.in            |  6 +++
 package/jupyter-nbclient/jupyter-nbclient.mk  | 13 +++++
 package/jupyter-nbconvert/0001-certs.patch    | 23 ++++++++
 package/jupyter-nbconvert/Config.in           |  6 +++
 .../jupyter-nbconvert/jupyter-nbconvert.mk    | 14 +++++
 package/jupyter-nbformat/Config.in            |  6 +++
 package/jupyter-nbformat/jupyter-nbformat.mk  | 14 +++++
 package/jupyter-notebook-shim/Config.in       |  6 +++
 .../jupyter-notebook-shim.mk                  | 14 +++++
 .../jupyter-server/0001-dependencies.patch    | 14 +++++
 package/jupyter-server/Config.in              |  7 +++
 package/jupyter-server/jupyter-server.mk      | 14 +++++
 package/jupyterlab-pygments/Config.in         |  6 +++
 .../jupyterlab-pygments.mk                    | 14 +++++
 package/jupyterlab-server/Config.in           |  6 +++
 .../jupyterlab-server/jupyterlab-server.mk    | 13 +++++
 package/jupyterlab/0001-dependencies.patch    | 14 +++++
 package/jupyterlab/Config.in                  | 52 +++++++++++++++++++
 package/jupyterlab/jupyterlab.mk              | 18 +++++++
 package/python-bleach/Config.in               |  7 +++
 package/python-bleach/python-bleach.mk        | 14 +++++
 package/python-comm/Config.in                 |  7 +++
 package/python-comm/python-comm.mk            | 14 +++++
 package/python-fastjsonschema/Config.in       |  6 +++
 .../python-fastjsonschema.mk                  | 13 +++++
 .../python-hatch-jupyter-builder.mk           | 14 +++++
 .../python-hatch-nodejs-version.mk            | 15 ++++++
 package/python-json-logger/Config.in          |  7 +++
 .../python-json-logger/python-json-logger.mk  | 13 +++++
 package/python-json5/Config.in                |  6 +++
 package/python-json5/python-json5.mk          | 14 +++++
 .../python-matplotlib/0001-dependencies.patch | 19 +++++++
 package/python-overrides/Config.in            |  7 +++
 package/python-overrides/python-overrides.mk  | 14 +++++
 package/python-platformdirs/Config.in         |  6 +++
 .../python-platformdirs.mk                    | 19 +++++++
 package/python-prometheus-client/Config.in    |  6 +++
 .../python-prometheus-client.mk               | 13 +++++
 package/python-send2trash/Config.in           |  7 +++
 .../python-send2trash/python-send2trash.mk    | 14 +++++
 49 files changed, 602 insertions(+)
 create mode 100644 package/jupyter-client/Config.in
 create mode 100644 package/jupyter-client/jupyter-client.mk
 create mode 100644 package/jupyter-core/Config.in
 create mode 100644 package/jupyter-core/jupyter-core.mk
 create mode 100644 package/jupyter-events/Config.in
 create mode 100644 package/jupyter-events/jupyter-events.mk
 create mode 100644 package/jupyter-ipython-kernel/Config.in
 create mode 100644 package/jupyter-ipython-kernel/jupyter-ipython-kernel.mk
 create mode 100644 package/jupyter-nbclient/Config.in
 create mode 100644 package/jupyter-nbclient/jupyter-nbclient.mk
 create mode 100644 package/jupyter-nbconvert/0001-certs.patch
 create mode 100644 package/jupyter-nbconvert/Config.in
 create mode 100644 package/jupyter-nbconvert/jupyter-nbconvert.mk
 create mode 100644 package/jupyter-nbformat/Config.in
 create mode 100644 package/jupyter-nbformat/jupyter-nbformat.mk
 create mode 100644 package/jupyter-notebook-shim/Config.in
 create mode 100644 package/jupyter-notebook-shim/jupyter-notebook-shim.mk
 create mode 100644 package/jupyter-server/0001-dependencies.patch
 create mode 100644 package/jupyter-server/Config.in
 create mode 100644 package/jupyter-server/jupyter-server.mk
 create mode 100644 package/jupyterlab-pygments/Config.in
 create mode 100644 package/jupyterlab-pygments/jupyterlab-pygments.mk
 create mode 100644 package/jupyterlab-server/Config.in
 create mode 100644 package/jupyterlab-server/jupyterlab-server.mk
 create mode 100644 package/jupyterlab/0001-dependencies.patch
 create mode 100644 package/jupyterlab/Config.in
 create mode 100644 package/jupyterlab/jupyterlab.mk
 create mode 100644 package/python-bleach/Config.in
 create mode 100644 package/python-bleach/python-bleach.mk
 create mode 100644 package/python-comm/Config.in
 create mode 100644 package/python-comm/python-comm.mk
 create mode 100644 package/python-fastjsonschema/Config.in
 create mode 100644 package/python-fastjsonschema/python-fastjsonschema.mk
 create mode 100644 package/python-hatch-jupyter-builder/python-hatch-jupyter-builder.mk
 create mode 100644 package/python-hatch-nodejs-version/python-hatch-nodejs-version.mk
 create mode 100644 package/python-json-logger/Config.in
 create mode 100644 package/python-json-logger/python-json-logger.mk
 create mode 100644 package/python-json5/Config.in
 create mode 100644 package/python-json5/python-json5.mk
 create mode 100644 package/python-matplotlib/0001-dependencies.patch
 create mode 100644 package/python-overrides/Config.in
 create mode 100644 package/python-overrides/python-overrides.mk
 create mode 100644 package/python-platformdirs/Config.in
 create mode 100644 package/python-platformdirs/python-platformdirs.mk
 create mode 100644 package/python-prometheus-client/Config.in
 create mode 100644 package/python-prometheus-client/python-prometheus-client.mk
 create mode 100644 package/python-send2trash/Config.in
 create mode 100644 package/python-send2trash/python-send2trash.mk

diff --git a/package/Config.in b/package/Config.in
index 1935077f0f..2fe7b75ba2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -698,6 +698,18 @@ endif
 	source "package/haserl/Config.in"
 	source "package/janet/Config.in"
 	source "package/jimtcl/Config.in"
+	source "package/jupyter-client/Config.in"
+	source "package/jupyter-core/Config.in"
+	source "package/jupyter-events/Config.in"
+	source "package/jupyter-ipython-kernel/Config.in"
+	source "package/jupyter-nbclient/Config.in"
+	source "package/jupyter-nbconvert/Config.in"
+	source "package/jupyter-nbformat/Config.in"
+	source "package/jupyter-notebook-shim/Config.in"
+	source "package/jupyter-server/Config.in"
+	source "package/jupyterlab/Config.in"
+	source "package/jupyterlab-pygments/Config.in"
+	source "package/jupyterlab-server/Config.in"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
 	source "package/luajit/Config.in"
@@ -1013,6 +1025,7 @@ menu "External python modules"
 	source "package/python-bidict/Config.in"
 	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
+	source "package/python-bleach/Config.in"
 	source "package/python-bleak/Config.in"
 	source "package/python-blinker/Config.in"
 	source "package/python-bluezero/Config.in"
@@ -1042,6 +1055,7 @@ menu "External python modules"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
+	source "package/python-comm/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
 	source "package/python-construct/Config.in"
@@ -1090,6 +1104,7 @@ menu "External python modules"
 	source "package/python-falcon/Config.in"
 	source "package/python-fastapi/Config.in"
 	source "package/python-fastapi-sessions/Config.in"
+	source "package/python-fastjsonschema/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
@@ -1159,7 +1174,9 @@ menu "External python modules"
 	source "package/python-jeepney/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jmespath/Config.in"
+	source "package/python-json-logger/Config.in"
 	source "package/python-json-schema-validator/Config.in"
+	source "package/python-json5/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-jsonschema-specifications/Config.in"
@@ -1215,6 +1232,7 @@ menu "External python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
+	source "package/python-overrides/Config.in"
 	source "package/python-orjson/Config.in"
 	source "package/python-outcome/Config.in"
 	source "package/python-packaging/Config.in"
@@ -1233,11 +1251,13 @@ menu "External python modules"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
+	source "package/python-platformdirs/Config.in"
 	source "package/python-pluggy/Config.in"
 	source "package/python-ply/Config.in"
 	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
+	source "package/python-prometheus-client/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
@@ -1337,6 +1357,7 @@ menu "External python modules"
 	source "package/python-segno/Config.in"
 	source "package/python-selenium/Config.in"
 	source "package/python-semver/Config.in"
+	source "package/python-send2trash/Config.in"
 	source "package/python-sentry-sdk/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-serial-asyncio/Config.in"
diff --git a/package/jupyter-client/Config.in b/package/jupyter-client/Config.in
new file mode 100644
index 0000000000..1086780aed
--- /dev/null
+++ b/package/jupyter-client/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTER_CLIENT
+	bool "jupyter-client"
+	help
+	  Jupyter Client
+
+	  https://github.com/jupyter-client/jupyter_client
diff --git a/package/jupyter-client/jupyter-client.mk b/package/jupyter-client/jupyter-client.mk
new file mode 100644
index 0000000000..1946585929
--- /dev/null
+++ b/package/jupyter-client/jupyter-client.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# jupyter-client
+#
+################################################################################
+
+JUPYTER_CLIENT_VERSION = v8.2.0
+JUPYTER_CLIENT_SITE = $(call github,jupyter,jupyter_client,$(JUPYTER_CLIENT_VERSION))
+JUPYTER_CLIENT_SETUP_TYPE = pep517
+JUPYTER_CLIENT_LICENSE = BSD-3-Clause
+JUPYTER_CLIENT_LICENSE_FILES = LICENSE
+JUPYTER_CLIENT_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/jupyter-core/Config.in b/package/jupyter-core/Config.in
new file mode 100644
index 0000000000..1d8a534a18
--- /dev/null
+++ b/package/jupyter-core/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTER_CORE
+	bool "jupyter-core"
+	help
+	  Jupyter Core
+
+	  https://github.com/jupyter/jupyter_core
diff --git a/package/jupyter-core/jupyter-core.mk b/package/jupyter-core/jupyter-core.mk
new file mode 100644
index 0000000000..4b9e7a5bdb
--- /dev/null
+++ b/package/jupyter-core/jupyter-core.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# jupyter-core
+#
+################################################################################
+
+JUPYTER_CORE_VERSION = v5.3.0
+JUPYTER_CORE_SITE = $(call github,jupyter,jupyter_core,$(JUPYTER_CORE_VERSION))
+JUPYTER_CORE_SETUP_TYPE = pep517
+JUPYTER_CORE_LICENSE = BSD-3-Clause
+JUPYTER_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/jupyter-events/Config.in b/package/jupyter-events/Config.in
new file mode 100644
index 0000000000..f5b0496b33
--- /dev/null
+++ b/package/jupyter-events/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTER_EVENTS
+	bool "jupyter-events"
+	help
+	  Jupyter Events
+
+	  https://github.com/jupyter/jupyter_events
diff --git a/package/jupyter-events/jupyter-events.mk b/package/jupyter-events/jupyter-events.mk
new file mode 100644
index 0000000000..32ae5a774f
--- /dev/null
+++ b/package/jupyter-events/jupyter-events.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# jupyter-events
+#
+################################################################################
+
+JUPYTER_EVENTS_VERSION = v0.9.0
+JUPYTER_EVENTS_SITE = $(call github,jupyter,jupyter_events,$(JUPYTER_EVENTS_VERSION))
+JUPYTER_EVENTS_SETUP_TYPE = pep517
+JUPYTER_EVENTS_LICENSE = BSD-3-Clause
+JUPYTER_EVENTS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/jupyter-ipython-kernel/Config.in b/package/jupyter-ipython-kernel/Config.in
new file mode 100644
index 0000000000..6be3d401c9
--- /dev/null
+++ b/package/jupyter-ipython-kernel/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_JUPYTER_IPYTHON_KERNEL
+	bool "jupyter-ipython-kernel"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	help
+	  Jupyter IPython Kernel
+
+	  https://github.com/ipython/ipykernel
diff --git a/package/jupyter-ipython-kernel/jupyter-ipython-kernel.mk b/package/jupyter-ipython-kernel/jupyter-ipython-kernel.mk
new file mode 100644
index 0000000000..4b73577e7f
--- /dev/null
+++ b/package/jupyter-ipython-kernel/jupyter-ipython-kernel.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# jupyter-ipython-kernel
+#
+################################################################################
+
+JUPYTER_IPYTHON_KERNEL_VERSION = v6.29.0
+JUPYTER_IPYTHON_KERNEL_SITE = $(call github,ipython,ipykernel,$(JUPYTER_IPYTHON_KERNEL_VERSION))
+JUPYTER_IPYTHON_KERNEL_SETUP_TYPE = setuptools
+JUPYTER_IPYTHON_KERNEL_LICENSE = BSD-3-Clause
+JUPYTER_IPYTHON_KERNEL_LICENSE_FILES = LICENSE
+
+define JUPYTER_IPYTHON_KERNEL_INSTALL_EXTRAS
+	cp -dpf $(@D)/ipykernel_launcher.py $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+endef
+
+JUPYTER_IPYTHON_KERNEL_POST_INSTALL_TARGET_HOOKS += JUPYTER_IPYTHON_KERNEL_INSTALL_EXTRAS
+
+$(eval $(python-package))
diff --git a/package/jupyter-nbclient/Config.in b/package/jupyter-nbclient/Config.in
new file mode 100644
index 0000000000..5087a318c3
--- /dev/null
+++ b/package/jupyter-nbclient/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTER_NBCLIENT
+	bool "jupyter-nbclient"
+	help
+	  Jupyter Notebook Client
+
+	  https://github.com/jupyter/nbclient
diff --git a/package/jupyter-nbclient/jupyter-nbclient.mk b/package/jupyter-nbclient/jupyter-nbclient.mk
new file mode 100644
index 0000000000..302b226f3e
--- /dev/null
+++ b/package/jupyter-nbclient/jupyter-nbclient.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# jupyter-nbclient
+#
+################################################################################
+
+JUPYTER_NBCLIENT_VERSION = v0.7.4
+JUPYTER_NBCLIENT_SITE = $(call github,jupyter,nbclient,$(JUPYTER_NBCLIENT_VERSION))
+JUPYTER_NBCLIENT_SETUP_TYPE = pep517
+JUPYTER_NBCLIENT_LICENSE = BSD-3-Clause
+JUPYTER_NBCLIENT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/jupyter-nbconvert/0001-certs.patch b/package/jupyter-nbconvert/0001-certs.patch
new file mode 100644
index 0000000000..a9d00f3483
--- /dev/null
+++ b/package/jupyter-nbconvert/0001-certs.patch
@@ -0,0 +1,23 @@
+Use certifi Python package for CA certificates
+
+Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
+Upstream: N/A (system certificates manage this outside buildroot)
+--- nbconvert-7.3.1/hatch_build.py	2023-04-10 09:58:09.000000000 -0400
++++ nbconvert-7.3.1/hatch_build_new.py	2024-03-11 13:14:03.900065615 -0400
+@@ -1,6 +1,7 @@
+ """Custom build script for hatch backend"""
+ import os
+ import sys
++import certifi
+ from urllib.request import urlopen
+ 
+ from hatchling.builders.hooks.plugin.interface import BuildHookInterface
+@@ -47,7 +48,7 @@
+         os.makedirs(directory)
+     print("Downloading CSS: %s" % url)
+     try:
+-        css = urlopen(url).read()  # noqa
++        css = urlopen(url, cafile=certifi.where()).read()  # noqa
+     except Exception as e:
+         msg = f"Failed to download css from {url}: {e}"
+         print(msg, file=sys.stderr)
diff --git a/package/jupyter-nbconvert/Config.in b/package/jupyter-nbconvert/Config.in
new file mode 100644
index 0000000000..dca7cf0686
--- /dev/null
+++ b/package/jupyter-nbconvert/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTER_NBCONVERT
+	bool "jupyter-nbconvert"
+	help
+	  Jupyter Notebook Convert
+
+	  https://github.com/jupyter/nbconvert
diff --git a/package/jupyter-nbconvert/jupyter-nbconvert.mk b/package/jupyter-nbconvert/jupyter-nbconvert.mk
new file mode 100644
index 0000000000..cbaa1c2315
--- /dev/null
+++ b/package/jupyter-nbconvert/jupyter-nbconvert.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# jupyter-nbconvert
+#
+################################################################################
+
+JUPYTER_NBCONVERT_VERSION = v7.3.1
+JUPYTER_NBCONVERT_SITE = $(call github,jupyter,nbconvert,$(JUPYTER_NBCONVERT_VERSION))
+JUPYTER_NBCONVERT_SETUP_TYPE = pep517
+JUPYTER_NBCONVERT_LICENSE = BSD-3-Clause
+JUPYTER_NBCONVERT_LICENSE_FILES = LICENSE
+JUPYTER_NBCONVERT_DEPENDENCIES = host-openssl host-python-certifi
+
+$(eval $(python-package))
diff --git a/package/jupyter-nbformat/Config.in b/package/jupyter-nbformat/Config.in
new file mode 100644
index 0000000000..78a8b66749
--- /dev/null
+++ b/package/jupyter-nbformat/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTER_NBFORMAT
+	bool "jupyter-nbformat"
+	help
+	  Jupyter Notebook Format
+
+	  https://github.com/jupyter/nbformat
diff --git a/package/jupyter-nbformat/jupyter-nbformat.mk b/package/jupyter-nbformat/jupyter-nbformat.mk
new file mode 100644
index 0000000000..ed52724369
--- /dev/null
+++ b/package/jupyter-nbformat/jupyter-nbformat.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# jupyter-nbformat
+#
+################################################################################
+
+JUPYTER_NBFORMAT_VERSION = v5.8.0
+JUPYTER_NBFORMAT_SITE = $(call github,jupyter,nbformat,$(JUPYTER_NBFORMAT_VERSION))
+JUPYTER_NBFORMAT_SETUP_TYPE = pep517
+JUPYTER_NBFORMAT_LICENSE = BSD-3-Clause
+JUPYTER_NBFORMAT_LICENSE_FILES = LICENSE
+JUPYTER_NBFORMAT_DEPENDENCIES = host-python-hatch-nodejs-version
+
+$(eval $(python-package))
diff --git a/package/jupyter-notebook-shim/Config.in b/package/jupyter-notebook-shim/Config.in
new file mode 100644
index 0000000000..b2e6266fab
--- /dev/null
+++ b/package/jupyter-notebook-shim/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTER_NOTEBOOK_SHIM
+	bool "jupyter-notebook-shim"
+	help
+	  Jupyter Notebook Shim
+
+	  https://pypi.org/project/notebook-shim/
diff --git a/package/jupyter-notebook-shim/jupyter-notebook-shim.mk b/package/jupyter-notebook-shim/jupyter-notebook-shim.mk
new file mode 100644
index 0000000000..ab3009ea4c
--- /dev/null
+++ b/package/jupyter-notebook-shim/jupyter-notebook-shim.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# jupyter-notebook-shim
+#
+################################################################################
+
+JUPYTER_NOTEBOOK_SHIM_VERSION = 0.2.3
+JUPYTER_NOTEBOOK_SHIM_SOURCE = notebook_shim-$(JUPYTER_NOTEBOOK_SHIM_VERSION).tar.gz
+JUPYTER_NOTEBOOK_SHIM_SITE = https://files.pythonhosted.org/packages/ea/10/6c6c7adc0d61e72cfc4055d0671bbd12bdc6ffea86892e903bd2398b9019
+JUPYTER_NOTEBOOK_SHIM_SETUP_TYPE = pep517
+JUPYTER_NOTEBOOK_SHIM_LICENSE = BSD-3-Clause
+JUPYTER_NOTEBOOK_SHIM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/jupyter-server/0001-dependencies.patch b/package/jupyter-server/0001-dependencies.patch
new file mode 100644
index 0000000000..61da5ba7c6
--- /dev/null
+++ b/package/jupyter-server/0001-dependencies.patch
@@ -0,0 +1,14 @@
+jupyter_server: Remove hatch-jupyter-builder dependency
+
+Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
+Upstream: N/A (needed to break buildroot-specific host/target dependency loop)
+--- jupyter_server-2.12.5/pyproject.toml	2024-01-16 09:57:59.000000000 -0500
++++ jupyter_server-2.12.5/pyproject_new.toml	2024-03-11 14:20:27.318247718 -0400
+@@ -129,7 +129,6 @@
+ artifacts = ["jupyter_server/static/style"]
+ 
+ [tool.hatch.build.hooks.jupyter-builder]
+-dependencies = ["hatch-jupyter-builder>=0.8.1"]
+ build-function = "hatch_jupyter_builder.npm_builder"
+ ensured-targets = [
+   "jupyter_server/static/style/bootstrap.min.css",
diff --git a/package/jupyter-server/Config.in b/package/jupyter-server/Config.in
new file mode 100644
index 0000000000..85b8a3f13a
--- /dev/null
+++ b/package/jupyter-server/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JUPYTER_SERVER
+	bool "jupyter-server"
+	select BR2_PACKAGE_PYTHON_OVERRIDES
+	help
+	  Jupyter Server
+
+	  https://github.com/jupyter-server/jupyter_server
diff --git a/package/jupyter-server/jupyter-server.mk b/package/jupyter-server/jupyter-server.mk
new file mode 100644
index 0000000000..35aea174da
--- /dev/null
+++ b/package/jupyter-server/jupyter-server.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# jupyter-server
+#
+################################################################################
+
+JUPYTER_SERVER_VERSION = v2.12.5
+JUPYTER_SERVER_SITE = $(call github,jupyter-server,jupyter_server,$(JUPYTER_SERVER_VERSION))
+JUPYTER_SERVER_SETUP_TYPE = pep517
+JUPYTER_SERVER_LICENSE = BSD-3-Clause
+JUPYTER_SERVER_LICENSE_FILES = LICENSE
+JUPYTER_SERVER_DEPENDENCIES = host-python-hatch-jupyter-builder python-overrides
+
+$(eval $(python-package))
diff --git a/package/jupyterlab-pygments/Config.in b/package/jupyterlab-pygments/Config.in
new file mode 100644
index 0000000000..40a840e7f2
--- /dev/null
+++ b/package/jupyterlab-pygments/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTERLAB_PYGMENTS
+	bool "jupyterlab-pygments"
+	help
+	  Jupyterlab Pygments theme
+
+	  https://jupyter.org
diff --git a/package/jupyterlab-pygments/jupyterlab-pygments.mk b/package/jupyterlab-pygments/jupyterlab-pygments.mk
new file mode 100644
index 0000000000..7b88612485
--- /dev/null
+++ b/package/jupyterlab-pygments/jupyterlab-pygments.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# jupyterlab-pygments
+#
+################################################################################
+
+JUPYTERLAB_PYGMENTS_VERSION = 0.3.0
+JUPYTERLAB_PYGMENTS_SITE = $(call github,jupyterlab,jupyterlab_pygments,$(JUPYTERLAB_PYGMENTS_VERSION))
+JUPYTERLAB_PYGMENTS_LICENSE = BSD-3-Clause
+JUPYTERLAB_PYGMENTS_LICENSE_FILES = LICENSE
+JUPYTERLAB_PYGMENTS_DEPENDENCIES = host-python-platformdirs jupyterlab
+JUPYTERLAB_PYGMENTS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/package/jupyterlab-server/Config.in b/package/jupyterlab-server/Config.in
new file mode 100644
index 0000000000..89f1a82544
--- /dev/null
+++ b/package/jupyterlab-server/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JUPYTERLAB_SERVER
+	bool "jupyterlab-server"
+	help
+	  Jupyterlab Server
+
+	  https://jupyter.org
diff --git a/package/jupyterlab-server/jupyterlab-server.mk b/package/jupyterlab-server/jupyterlab-server.mk
new file mode 100644
index 0000000000..b4a5eb2570
--- /dev/null
+++ b/package/jupyterlab-server/jupyterlab-server.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# jupyterlab-server
+#
+################################################################################
+
+JUPYTERLAB_SERVER_VERSION = v2.22.1
+JUPYTERLAB_SERVER_SITE = $(call github,jupyterlab,jupyterlab_server,$(JUPYTERLAB_SERVER_VERSION))
+JUPYTERLAB_SERVER_SETUP_TYPE = pep517
+JUPYTERLAB_SERVER_LICENSE = BSD-3-Clause
+JUPYTERLAB_SERVER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/jupyterlab/0001-dependencies.patch b/package/jupyterlab/0001-dependencies.patch
new file mode 100644
index 0000000000..1e3b36dd9f
--- /dev/null
+++ b/package/jupyterlab/0001-dependencies.patch
@@ -0,0 +1,14 @@
+jupyterlab: Remove hatch-jupyter-builder dependency
+
+Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
+Upstream: N/A (needed to break buildroot-specific host/target dependency loop)
+--- jupyterlab-4.0.12/pyproject.toml	2024-01-30 09:17:41.000000000 -0500
++++ jupyterlab-4.0.12/pyproject_new.toml	2024-03-11 14:17:16.914647903 -0400
+@@ -187,7 +187,6 @@
+ ]
+ 
+ [tool.hatch.build.hooks.jupyter-builder]
+-dependencies = ["hatch-jupyter-builder>=0.3.2"]
+ build-function = "buildapi.builder"
+ ensured-targets = [
+     "jupyterlab/static/package.json",
diff --git a/package/jupyterlab/Config.in b/package/jupyterlab/Config.in
new file mode 100644
index 0000000000..9a91dc7a31
--- /dev/null
+++ b/package/jupyterlab/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_JUPYTERLAB
+	bool "jupyterlab"
+	select BR2_PACKAGE_LIBARGON2
+	select BR2_PACKAGE_JUPYTERLAB_SERVER
+	select BR2_PACKAGE_JUPYTERLAB_PYGMENTS
+	select BR2_PACKAGE_JUPYTER_CLIENT
+	select BR2_PACKAGE_JUPYTER_CORE
+	select BR2_PACKAGE_JUPYTER_EVENTS
+	select BR2_PACKAGE_JUPYTER_IPYTHON_KERNEL
+	select BR2_PACKAGE_JUPYTER_NBCLIENT
+	select BR2_PACKAGE_JUPYTER_NBCONVERT
+	select BR2_PACKAGE_JUPYTER_NBFORMAT
+	select BR2_PACKAGE_JUPYTER_NOTEBOOK_SHIM
+	select BR2_PACKAGE_JUPYTER_SERVER
+	select BR2_PACKAGE_PYTHON_ANYIO
+	select BR2_PACKAGE_PYTHON_ARGON2_CFFI
+	select BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS
+	select BR2_PACKAGE_PYTHON_ASTTOKENS
+	select BR2_PACKAGE_PYTHON_ASYNC_LRU
+	select BR2_PACKAGE_PYTHON_BABEL
+	select BR2_PACKAGE_PYTHON_BLEACH
+	select BR2_PACKAGE_PYTHON_DATEUTIL
+	select BR2_PACKAGE_PYTHON_DEFUSEDXML
+	select BR2_PACKAGE_PYTHON_EXECUTING
+	select BR2_PACKAGE_PYTHON_COMM
+	select BR2_PACKAGE_PYTHON_FASTJSONSCHEMA
+	select BR2_PACKAGE_PYTHON_IPYTHON
+	select BR2_PACKAGE_PYTHON_JINJA2
+	select BR2_PACKAGE_PYTHON_JSON5
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA
+	select BR2_PACKAGE_PYTHON_JSON_LOGGER
+	select BR2_PACKAGE_PYTHON_MATPLOTLIB
+	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE
+	select BR2_PACKAGE_PYTHON_PACKAGING
+	select BR2_PACKAGE_PYTHON_PLATFORMDIRS
+	select BR2_PACKAGE_PYTHON_PROMETHEUS_CLIENT
+	select BR2_PACKAGE_PYTHON_PSUTIL
+	select BR2_PACKAGE_PYTHON_PYYAML
+	select BR2_PACKAGE_PYTHON_PYZMQ
+	select BR2_PACKAGE_PYTHON_REQUESTS
+	select BR2_PACKAGE_PYTHON_SEND2TRASH
+	select BR2_PACKAGE_PYTHON_SNIFFIO
+	select BR2_PACKAGE_PYTHON_STACK_DATA
+	select BR2_PACKAGE_PYTHON_TORNADO
+	select BR2_PACKAGE_PYTHON_TRAITLETS
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS
+	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
+	select BR2_PACKAGE_PYTHON3_SQLITE
+	help
+	  Jupyterlab
+
+	  https://jupyter.org
diff --git a/package/jupyterlab/jupyterlab.mk b/package/jupyterlab/jupyterlab.mk
new file mode 100644
index 0000000000..690697e62a
--- /dev/null
+++ b/package/jupyterlab/jupyterlab.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# jupyterlab
+#
+################################################################################
+
+JUPYTERLAB_VERSION = v4.0.12
+JUPYTERLAB_SITE = $(call github,jupyterlab,jupyterlab,$(JUPYTERLAB_VERSION))
+JUPYTERLAB_SETUP_TYPE = pep517
+JUPYTERLAB_LICENSE = MIT
+JUPYTERLAB_LICENSE_FILES = LICENSE
+JUPYTERLAB_DEPENDENCIES = \
+	host-python-hatch-jupyter-builder \
+	host-python-hatchling \
+	jupyter-core \
+	jupyterlab-server
+
+$(eval $(python-package))
diff --git a/package/python-bleach/Config.in b/package/python-bleach/Config.in
new file mode 100644
index 0000000000..83a32b9ae7
--- /dev/null
+++ b/package/python-bleach/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BLEACH
+	bool "python-bleach"
+	help
+	  Bleach is an allowed-list-based HTML sanitizing library that
+	  escapes or strips markup and attributes.
+
+	  https://pypi.org/project/bleach
diff --git a/package/python-bleach/python-bleach.mk b/package/python-bleach/python-bleach.mk
new file mode 100644
index 0000000000..6ffdc9e4f8
--- /dev/null
+++ b/package/python-bleach/python-bleach.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bleach
+#
+################################################################################
+
+PYTHON_BLEACH_VERSION = 6.0.0
+PYTHON_BLEACH_SOURCE = bleach-$(PYTHON_BLEACH_VERSION).tar.gz
+PYTHON_BLEACH_SITE = https://files.pythonhosted.org/packages/7e/e6/d5f220ca638f6a25557a611860482cb6e54b2d97f0332966b1b005742e1f
+PYTHON_BLEACH_SETUP_TYPE = setuptools
+PYTHON_BLEACH_LICENSE = Mozilla
+PYTHON_BLEACH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/python-comm/Config.in b/package/python-comm/Config.in
new file mode 100644
index 0000000000..8aa68143df
--- /dev/null
+++ b/package/python-comm/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_COMM
+	bool "python-comm"
+	help
+	  Provides a way to register a Kernel Comm implementation, as
+	  per the Jupyter kernel protocol.
+
+	  https://pypi.org/project/comm/
diff --git a/package/python-comm/python-comm.mk b/package/python-comm/python-comm.mk
new file mode 100644
index 0000000000..c2231043bd
--- /dev/null
+++ b/package/python-comm/python-comm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-comm
+#
+################################################################################
+
+PYTHON_COMM_VERSION = 0.1.3
+PYTHON_COMM_SOURCE = comm-$(PYTHON_COMM_VERSION).tar.gz
+PYTHON_COMM_SITE = https://files.pythonhosted.org/packages/d6/1a/9937a10f8fd6d9f0f72fa0ab520cec7e50c534b215f8fd2d28e0f0a7f9a7
+PYTHON_COMM_SETUP_TYPE = pep517
+PYTHON_COMM_LICENSE = BSD-3-Clause
+PYTHON_COMM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/python-fastjsonschema/Config.in b/package/python-fastjsonschema/Config.in
new file mode 100644
index 0000000000..00278c5b82
--- /dev/null
+++ b/package/python-fastjsonschema/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_FASTJSONSCHEMA
+	bool "python-fastjsonschema"
+	help
+	  Python fastjsonschema
+
+	  https://github.com/horejsek/python-fastjsonschema
diff --git a/package/python-fastjsonschema/python-fastjsonschema.mk b/package/python-fastjsonschema/python-fastjsonschema.mk
new file mode 100644
index 0000000000..289c768911
--- /dev/null
+++ b/package/python-fastjsonschema/python-fastjsonschema.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-fastjsonschema
+#
+################################################################################
+
+PYTHON_FASTJSONSCHEMA_VERSION = v2.16.3
+PYTHON_FASTJSONSCHEMA_SITE = $(call github,horejsek,python-fastjsonschema,$(PYTHON_FASTJSONSCHEMA_VERSION))
+PYTHON_FASTJSONSCHEMA_SETUP_TYPE = setuptools
+PYTHON_FASTJSONSCHEMA_LICENSE = BSD-3-Clause
+PYTHON_FASTJSONSCHEMA_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/python-hatch-jupyter-builder/python-hatch-jupyter-builder.mk b/package/python-hatch-jupyter-builder/python-hatch-jupyter-builder.mk
new file mode 100644
index 0000000000..27dede22fe
--- /dev/null
+++ b/package/python-hatch-jupyter-builder/python-hatch-jupyter-builder.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hatch-jupyter-builder
+#
+################################################################################
+
+PYTHON_HATCH_JUPYTER_BUILDER_VERSION = v0.8.3
+PYTHON_HATCH_JUPYTER_BUILDER_SITE = $(call github,jupyterlab,hatch-jupyter-builder,$(PYTHON_HATCH_JUPYTER_BUILDER_VERSION))
+PYTHON_HATCH_JUPYTER_BUILDER_LICENSE = BSD-3-Clause
+PYTHON_HATCH_JUPYTER_BUILDER_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCH_JUPYTER_BUILDER_SETUP_TYPE = setuptools
+HOST_PYTHON_HATCH_JUPYTER_BUILDER_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+
+$(eval $(host-python-package))
diff --git a/package/python-hatch-nodejs-version/python-hatch-nodejs-version.mk b/package/python-hatch-nodejs-version/python-hatch-nodejs-version.mk
new file mode 100644
index 0000000000..ab2372b2a0
--- /dev/null
+++ b/package/python-hatch-nodejs-version/python-hatch-nodejs-version.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-hatch-nodejs-version
+#
+################################################################################
+
+PYTHON_HATCH_NODEJS_VERSION_VERSION = 0.3.1
+PYTHON_HATCH_NODEJS_VERSION_SOURCE = hatch_nodejs_version-$(PYTHON_HATCH_NODEJS_VERSION_VERSION).tar.gz
+PYTHON_HATCH_NODEJS_VERSION_SITE = https://files.pythonhosted.org/packages/1a/f7/e563b874c1ebd181e002b56801562516408fa1ff12bbba4f803faa4f433b
+PYTHON_HATCH_NODEJS_VERSION_LICENSE = MIT
+PYTHON_HATCH_NODEJS_VERSION_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCH_NODEJS_VERSION_SETUP_TYPE = pep517
+HOST_PYTHON_HATCH_NODEJS_VERSION_DEPENDENCIES = host-python-hatchling
+
+$(eval $(host-python-package))
diff --git a/package/python-json-logger/Config.in b/package/python-json-logger/Config.in
new file mode 100644
index 0000000000..7bfce46261
--- /dev/null
+++ b/package/python-json-logger/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_JSON_LOGGER
+	bool "python-json-logger"
+	help
+	  Allow standard python logging to output log data as json
+	  objects.
+
+	  https://pypi.org/project/python-json-logger/
diff --git a/package/python-json-logger/python-json-logger.mk b/package/python-json-logger/python-json-logger.mk
new file mode 100644
index 0000000000..afbd44e2f3
--- /dev/null
+++ b/package/python-json-logger/python-json-logger.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-json-logger
+#
+################################################################################
+
+PYTHON_JSON_LOGGER_VERSION = 2.0.7
+PYTHON_JSON_LOGGER_SITE = https://files.pythonhosted.org/packages/4f/da/95963cebfc578dabd323d7263958dfb68898617912bb09327dd30e9c8d13
+PYTHON_JSON_LOGGER_LICENSE = BSD-2-Clause
+PYTHON_JSON_LOGGER_LICENSE_FILES = LICENSE
+PYTHON_JSON_LOGGER_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/package/python-json5/Config.in b/package/python-json5/Config.in
new file mode 100644
index 0000000000..bba8715d84
--- /dev/null
+++ b/package/python-json5/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_JSON5
+	bool "python-json5"
+	help
+	  A Python implementation of the JSON5 data format.
+
+	  https://pypi.org/project/json5
diff --git a/package/python-json5/python-json5.mk b/package/python-json5/python-json5.mk
new file mode 100644
index 0000000000..07c44350c2
--- /dev/null
+++ b/package/python-json5/python-json5.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-json5
+#
+################################################################################
+
+PYTHON_JSON5_VERSION = 0.9.11
+PYTHON_JSON5_SOURCE = json5-$(PYTHON_JSON5_VERSION).tar.gz
+PYTHON_JSON5_SITE = https://files.pythonhosted.org/packages/da/8b/26535688697b6129c0ccec7806162db0d01c9bc8b8994ab1e87c32ef9648
+PYTHON_JSON5_LICENSE = Apache
+PYTHON_JSON5_LICENSE_FILES = LICENSE
+PYTHON_JSON5_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/package/python-matplotlib/0001-dependencies.patch b/package/python-matplotlib/0001-dependencies.patch
new file mode 100644
index 0000000000..ed72892ba6
--- /dev/null
+++ b/package/python-matplotlib/0001-dependencies.patch
@@ -0,0 +1,19 @@
+Disable dependency on numpy at package level (satisfied by buildroot)
+
+Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
+Upstream: N/A
+--- python-matplotlib-3.4.3/setup.py	2024-03-11 17:19:07.569386025 -0400
++++ python-matplotlib-3.4.3/setup_new.py	2024-03-11 17:19:46.297258324 -0400
+@@ -300,12 +300,10 @@
+     python_requires='>={}'.format('.'.join(str(n) for n in py_min_version)),
+     setup_requires=[
+         "certifi>=2020.06.20",
+-        "numpy>=1.16",
+     ],
+     install_requires=[
+         "cycler>=0.10",
+         "kiwisolver>=1.0.1",
+-        "numpy>=1.16",
+         "pillow>=6.2.0",
+         "pyparsing>=2.2.1",
+         "python-dateutil>=2.7",
diff --git a/package/python-overrides/Config.in b/package/python-overrides/Config.in
new file mode 100644
index 0000000000..165872978f
--- /dev/null
+++ b/package/python-overrides/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_OVERRIDES
+	bool "python-overrides"
+	help
+	  A decorator to automatically detect mismatch when overriding a
+	  method.
+
+	  https://pypi.org/project/overrides
diff --git a/package/python-overrides/python-overrides.mk b/package/python-overrides/python-overrides.mk
new file mode 100644
index 0000000000..0a10a65b35
--- /dev/null
+++ b/package/python-overrides/python-overrides.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-overrides
+#
+################################################################################
+
+PYTHON_OVERRIDES_VERSION = 7.7.0
+PYTHON_OVERRIDES_SOURCE = overrides-$(PYTHON_OVERRIDES_VERSION).tar.gz
+PYTHON_OVERRIDES_SITE = https://files.pythonhosted.org/packages/36/86/b585f53236dec60aba864e050778b25045f857e17f6e5ea0ae95fe80edd2
+PYTHON_OVERRIDES_SETUP_TYPE = setuptools
+PYTHON_OVERRIDES_LICENSE = Mozilla
+PYTHON_OVERRIDES_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/python-platformdirs/Config.in b/package/python-platformdirs/Config.in
new file mode 100644
index 0000000000..625b93b923
--- /dev/null
+++ b/package/python-platformdirs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PLATFORMDIRS
+	bool "python-platformdirs"
+	help
+	  Python Platformdirs
+
+	  https://github.com/platformdirs/platformdirs
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
new file mode 100644
index 0000000000..e570f1e361
--- /dev/null
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-platformdirs
+#
+################################################################################
+
+PYTHON_PLATFORMDIRS_VERSION = 3.5.0
+PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/91/17/3836ffe140abb245726d0e21c5b9b984e2569e7027c20d12e969ec69bd8a
+PYTHON_PLATFORMDIRS_SETUP_TYPE = pep517
+PYTHON_PLATFORMDIRS_LICENSE = MIT
+PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
+PYTHON_PLATFORMDIRS_DEPENDENCIES = \
+	host-python-hatch-vcs \
+	host-python-hatchling \
+	host-python-setuptools-scm
+
+$(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-prometheus-client/Config.in b/package/python-prometheus-client/Config.in
new file mode 100644
index 0000000000..4d192620b5
--- /dev/null
+++ b/package/python-prometheus-client/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PROMETHEUS_CLIENT
+	bool "python-prometheus-client"
+	help
+	  Prometheus Client
+
+	  https://github.com/prometheus/client_python
diff --git a/package/python-prometheus-client/python-prometheus-client.mk b/package/python-prometheus-client/python-prometheus-client.mk
new file mode 100644
index 0000000000..a3650b9331
--- /dev/null
+++ b/package/python-prometheus-client/python-prometheus-client.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-prometheus-client
+#
+################################################################################
+
+PYTHON_PROMETHEUS_CLIENT_VERSION = v0.16.0
+PYTHON_PROMETHEUS_CLIENT_SITE = $(call github,prometheus,client_python,$(PYTHON_PROMETHEUS_CLIENT_VERSION))
+PYTHON_PROMETHEUS_CLIENT_SETUP_TYPE = setuptools
+PYTHON_PROMETHEUS_CLIENT_LICENSE = Apache
+PYTHON_PROMETHEUS_CLIENT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/package/python-send2trash/Config.in b/package/python-send2trash/Config.in
new file mode 100644
index 0000000000..70aa56ddc3
--- /dev/null
+++ b/package/python-send2trash/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SEND2TRASH
+	bool "python-send2trash"
+	help
+	  Send2Trash is a small package that sends files to the Trash
+	  (or Recycle Bin) natively and on all platforms.
+
+	  https://pypi.org/project/send2trash
diff --git a/package/python-send2trash/python-send2trash.mk b/package/python-send2trash/python-send2trash.mk
new file mode 100644
index 0000000000..3bca24c253
--- /dev/null
+++ b/package/python-send2trash/python-send2trash.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-send2trash
+#
+################################################################################
+
+PYTHON_SEND2TRASH_VERSION = 1.8.2
+PYTHON_SEND2TRASH_SOURCE = Send2Trash-$(PYTHON_SEND2TRASH_VERSION).tar.gz
+PYTHON_SEND2TRASH_SITE = https://files.pythonhosted.org/packages/4a/d2/d4b4d8b1564752b4e593c6d007426172b6574df5a7c07322feba010f5551
+PYTHON_SEND2TRASH_LICENSE = BSD-3-Clause
+PYTHON_SEND2TRASH_LICENSE_FILES = LICENSE
+PYTHON_SEND2TRASH_SETUP_TYPE = pep517
+
+$(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
