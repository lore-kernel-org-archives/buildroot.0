Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94026C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D781429BA;
	Fri,  7 Jan 2022 22:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpzQLP5TX5so; Fri,  7 Jan 2022 22:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5387A429F7;
	Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32ABE1BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20FA9429B7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmC9J-15yrLl for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:26:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40CCE429AD
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:26:20 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id 9so5699056ill.9
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h0kU0u5O3PAJ2cSBzGCWwZVj3+0bJOuBcS5snYR0PVU=;
 b=hK0fRkTBfo5XucRj/+wZKXV5aNWGBsIu+yujkHC0LRDJGjD345pQM7/Kz2XXkQSmFi
 joAVGytYS0T5fRVSytaaknE9L99JLfUUW/f0RxT6/+cU4+l3hmtwBhuXas9tuHH2Ihoe
 H4EL1OYnsIgKSM8WeemaXF0ch5Qs0zkK6VenWSRk0cqgrdmxshQUe7Na6sA5ZC5eOB2f
 yFOc1ycaHt5NTkpI5o0RDqKWLx9v9oqqfjnzvTpx2/XqMQwX1wIZGAp9wiOasNyqP0Jh
 L8TYE+wyKssYdn9HbLKuzL8NMBZuGUhpf90pWnG3DM2tRAWN9bI7WTB0KnD8sqB/JGpV
 TKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h0kU0u5O3PAJ2cSBzGCWwZVj3+0bJOuBcS5snYR0PVU=;
 b=jSAhzyXbd3DjiED5lBrm5cl4GNIZptmpjczQNFUK8RYnxmrkadytq7tKQvi5pO/QLa
 TPgJWwC2M6gcuIeuFDqb66BjaLRqEzDvk6YvJnH029qdJnIz+Jts0pNY0PQr1EkktEtE
 cRPv2eZXUIU2sBSbuQGkeWdcgWHWUV7mmw5tJHwV34Zt4pFvB7VyaFiA86244V+7rBuo
 70C1WrUsxUt1T9MVBDNLsE9mI80p2dseUZxxq9QLDvzTRS6Asov/Cq2ybXXUnhoDLv+x
 lO8hGNjEMIVkZ5gyhmy9gMYEu5R6isZAquZmvspEcLP1/kKSBqPUJfltHjC/niiu5kWJ
 o4kw==
X-Gm-Message-State: AOAM533K6T+LnIx2rMelFLf6nfpd0yxRDirCd2u+JeGLaAJHBt6wJ7SM
 WUrrry1lSSqaD/d6reRo48ZncmhNAvo=
X-Google-Smtp-Source: ABdhPJwyiyMF1nWBPyHB2L1heOLevhFcc77RtCBknE9qhhA51uXaZZdtEqgYyWXoTbqMlULD0/OFPg==
X-Received: by 2002:a05:6e02:18c5:: with SMTP id
 s5mr31878648ilu.101.1641594379108; 
 Fri, 07 Jan 2022 14:26:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k12sm3596453ioc.50.2022.01.07.14.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:26:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:26:09 -0700
Message-Id: <20220107222613.4124764-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/serd: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/serd/Config.in |  8 ++++++++
 package/serd/serd.hash |  4 ++++
 package/serd/serd.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/serd/Config.in
 create mode 100644 package/serd/serd.hash
 create mode 100644 package/serd/serd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d5c01f795..d99d7798db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1299,6 +1299,7 @@ F:	package/python-tinycss2/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
+F:	package/serd/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index e9ee4d2ef1..18ae22f227 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1704,6 +1704,7 @@ menu "JSON/XML"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
+	source "package/serd/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/serd/Config.in b/package/serd/Config.in
new file mode 100644
index 0000000000..7633a979e2
--- /dev/null
+++ b/package/serd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SERD
+	bool "serd"
+	help
+	  Serd is a lightweight C library for RDF syntax which
+	  supports reading and writing Turtle, TriG, NTriples, and
+	  NQuads.
+
+	  https://drobilla.net/software/serd.html
diff --git a/package/serd/serd.hash b/package/serd/serd.hash
new file mode 100644
index 0000000000..d64a2aa271
--- /dev/null
+++ b/package/serd/serd.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# http://download.drobilla.net/serd-0.30.10.tar.bz2.sig
+sha256  affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf  serd-0.30.10.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
new file mode 100644
index 0000000000..85b16f6866
--- /dev/null
+++ b/package/serd/serd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# serd
+#
+################################################################################
+
+SERD_VERSION = 0.30.10
+SERD_SITE = https://download.drobilla.net
+SERD_SOURCE = serd-$(SERD_VERSION).tar.bz2
+SERD_LICENSE = ISC
+SERD_LICENSE_FILES = COPYING
+SERD_INSTALL_STAGING = YES
+
+SERD_CONF_OPTS += --largefile --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SERD_CONF_OPTS += --static --no-shared --static-progs
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
