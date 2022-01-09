Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDABFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E4D401DD;
	Sun,  9 Jan 2022 15:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78CCPwbCQMsT; Sun,  9 Jan 2022 15:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3BB6402E5;
	Sun,  9 Jan 2022 15:01:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 471861BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35E85605E0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hi27Sr2TR05x for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:00:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D472A607B0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:00:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o3so21883801wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 07:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzUoiUoytlG154/ciIFQp5j7kWzYX1pn4npn95qTdls=;
 b=jMAWF+xpWnkpFdJvECHBDwfA/377jtn1ujt/JIuoRd+pp+tsbcIQ9MHO1I7GxGY92R
 dheVdr4BSsF+sZUtctelH7byvRQQ4cESzOko1NG9uhu5lk2Vwa6J/eierUJ8pIaOrfnp
 qcX33jRZbkH4N4hiK7+WUEznvWk7sTacUJXJqDpVUq4qF9S/RwVtCA/UUZ314dnPSgZZ
 BkWjtdO4XBRXNu+YVTJxkZ9ND8Y+ENS51vz8FyYs9rs3wIzYknsmqiaRj6j9GVxVkmwd
 95AlogaV3NxZvA167wnWcVHBamTAC0WeHsOyjYVsgku24WTJfXRK6eIk0r2oPkdtd87j
 7AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzUoiUoytlG154/ciIFQp5j7kWzYX1pn4npn95qTdls=;
 b=CzLSk6Vy+aXu24+Z4yTlwexzKgc/inuWhKUI13IgiQh3eDx7lCaTXs6MFMFgyXEQtN
 1WN3PfPcl//k55d31tlUhOwkq2hoxmkjpWNQjwvQOMVR/Si29nIYAZGp8x8NxNGwt63W
 7zygg/4nNxhsrw0hvnkShQl5bmRUGGuQy0RkP0IBg+b5hVislQ3UFVI+KiNDMGrZubKF
 8wg7YdcXTGf1ahnC0PNKaAOEJm5upPNoT4jnbYkUQeBynlzU/14BLQ0KWWywJdONmXnk
 m8JXDYtLJrHoSrsRjNP1uDQJe4YriBYTnV2ItkYvJIGnyPO/KHI9WqwvDsq895ZuhJOi
 hD/g==
X-Gm-Message-State: AOAM533602ra1dt+2LsUqxya3VWwJJEsmPTmYfoIKSHeksvFLBwJt88l
 nA5+SlrG66oia+rDk2NrepADNn41fbbevw==
X-Google-Smtp-Source: ABdhPJz8R2z6xkZPOlr2BDDJK/UKDo0nR0O4xJKPXmRmqIaGoZhxaeprp6qY9slgG3ZQOiacPfRIxw==
X-Received: by 2002:a5d:4acf:: with SMTP id y15mr17265627wrs.692.1641740417118; 
 Sun, 09 Jan 2022 07:00:17 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id j26sm4781562wms.46.2022.01.09.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 07:00:16 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 16:00:12 +0100
Message-Id: <20220109150012.1907226-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220109150012.1907226-1-romain.naour@smile.fr>
References: <20220109150012.1907226-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/telegraf: new package
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Install the telegraf default configuration and the systemd service files
provided by the project [1].

[1] https://github.com/influxdata/telegraf/blob/v1.21.2/scripts/deb/post-install.sh

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Telegraf also provide an SysVinit script but I didn't tested it.
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/telegraf/Config.in     | 19 +++++++++++++++++++
 package/telegraf/telegraf.hash |  3 +++
 package/telegraf/telegraf.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/telegraf/Config.in
 create mode 100644 package/telegraf/telegraf.hash
 create mode 100644 package/telegraf/telegraf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ed65c74319..ab4d5ba446 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2462,6 +2462,7 @@ F:	package/solarus/
 F:	package/stress-ng/
 F:	package/supertux/
 F:	package/supertuxkart/
+F:	package/telegraf/
 F:	package/terminology/
 F:	package/tk/
 F:	package/upower/
diff --git a/package/Config.in b/package/Config.in
index 2d3ca6a3b6..d77c843465 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2595,6 +2595,7 @@ menu "System tools"
 	source "package/systemd-bootchart/Config.in"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
+	source "package/telegraf/Config.in"
 	source "package/thermald/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
diff --git a/package/telegraf/Config.in b/package/telegraf/Config.in
new file mode 100644
index 0000000000..c95145f386
--- /dev/null
+++ b/package/telegraf/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_TELEGRAF
+	bool "telegraf"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # logrotate
+	depends on BR2_USE_WCHAR # logrotate
+	select BR2_PACKAGE_LOGROTATE # runtime
+	help
+	  Telegraf is the open source server agent to help you
+	  collect metrics from your stacks, sensors and systems.
+
+	  https://www.influxdata.com/time-series-platform/telegraf
+
+comment "telegraf needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/telegraf/telegraf.hash b/package/telegraf/telegraf.hash
new file mode 100644
index 0000000000..0547621ea4
--- /dev/null
+++ b/package/telegraf/telegraf.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  bdd33f9248872dca282f8649713dedf7fc0eafd8876664031fb37a0350059ab6  v1.21.2.tar.gz
+sha256  29d6b3c9c5671e8375a42bf4c5d4e85e05efd314ef363a56bb1728621e9cad5a  LICENSE
diff --git a/package/telegraf/telegraf.mk b/package/telegraf/telegraf.mk
new file mode 100644
index 0000000000..42b19a11e9
--- /dev/null
+++ b/package/telegraf/telegraf.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# telegraf
+#
+################################################################################
+
+TELEGRAF_VERSION = 1.21.2
+TELEGRAF_SITE = https://github.com/influxdata/telegraf/archive
+TELEGRAF_SOURCE = v$(TELEGRAF_VERSION).tar.gz
+TELEGRAF_LICENSE = MIT
+TELEGRAF_LICENSE_FILES = LICENSE
+
+TELEGRAF_LDFLAGS = -X main.version=$(TELEGRAF_VERSION)
+TELEGRAF_BUILD_TARGETS = cmd/telegraf
+
+define TELEGRAF_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/etc/telegraf/telegraf.d
+	$(INSTALL) -D -m 644 $(@D)/etc/telegraf.conf $(TARGET_DIR)/etc/telegraf.conf
+	mkdir -p $(TARGET_DIR)/etc/logrotate.d
+	$(INSTALL) -D -m 644 $(@D)/etc/logrotate.d/telegraf $(TARGET_DIR)/etc/logrotate.d/telegraf
+	mkdir -p $(TARGET_DIR)/etc/default
+	touch $(TARGET_DIR)/etc/default/telegraf
+endef
+
+TELEGRAF_POST_INSTALL_TARGET_HOOKS += TELEGRAF_INSTALL_TARGET_FIXUP
+
+define TELEGRAF_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/scripts/telegraf.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/telegraf.service
+endef
+
+$(eval $(golang-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
