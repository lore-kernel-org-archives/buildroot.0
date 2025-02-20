Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC26C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 19:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CADD41326;
	Thu, 20 Feb 2025 19:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEWjjavbA_i8; Thu, 20 Feb 2025 19:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D5D41319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D5D41319;
	Thu, 20 Feb 2025 19:50:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17E9CCF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0E4C60818
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koNNLypmS9XJ for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 19:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFF816078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFF816078F
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFF816078F
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:50:54 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BCA7A352088C; Thu, 20 Feb 2025 20:50:52 +0100 (CET)
Date: Thu, 20 Feb 2025 20:50:52 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z7eHnHmXwR4Cai6Z@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1740081052; bh=mbx+EcYwBLLze6iVKo5fwtL+9iy6v4InrUrJzs1Fhtk=;
 h=Date:From:To:Subject:From;
 b=KFuW/ZBDuELB55wgBX9fhGxf0Jo9FHbkCe4btkwKtcrecsAnL4RMOd2b3pWXLvO8G
 0uFCTdX7JXUMFxJj70KRjzQPHvVSWilqIFVfi5lG78Hjg3dU6pAWKOhn2mR1pZDpKF
 6PS3RISvGjLXsVuHocUYXPTndDhKB8PgtGQ5DOxkbLQvs2CQa/vqgOLBU+nuV4dIlC
 uflyy3ViEL+w92+i/gN7sWK4tRgdf88VSUybMnhuXxOB2bozopjeKe7frw30tX+GO0
 Q1WtLiIqT2sf9jodYqh3NoRkCt/Gb+KyaedKdqWzCFSw8hIv0Q3oDwcHO/hL8iN3d6
 YGOQD/qqm/7Kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=KFuW/ZBD
Subject: [Buildroot] [PATCH] package/asterisk: update to 22.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a changelog see here:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22.2.0.md

Changes made by the package maintainer:
- add systemd service file
- run asterisk as non-root user asterisk
- build pjsip as bundled source code, but download it like
  sound files
- remove unused configure options

See here for the reason behind using the bundled pjsip:
https://github.com/asterisk/asterisk/issues/671

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash    |  4 +++-
 package/asterisk/asterisk.mk      | 28 +++++++++++++------------
 package/asterisk/asterisk.service | 34 +++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 14 deletions(-)
 create mode 100644 package/asterisk/asterisk.service

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 8c8ebddc47..ecc9ac98b1 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,6 +1,8 @@
 # Locally computed
-sha256  94647b3f887f7dc91df51a4f88dfc3a07cc279bef86b8d05aa72f0c49d187571  asterisk-20.11.1.tar.gz
+sha256  6e811aee648beda28c23a0922031b6dbb0ff34a20b4327c8505e74b56d69a3bd  asterisk-22.2.0.tar.gz
 
+# Locally computed
+sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
 sha1  721c512feaea102700d5bdce952fdc0bb29dc640  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index ec67632ef4..bee066ea7c 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.11.1
+ASTERISK_VERSION = 22.2.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 
+ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.15.1/
 ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
 ASTERISK_EXTRA_DOWNLOADS = \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
-	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
+	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
+	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2
 
 ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
 ASTERISK_LICENSE_FILES = \
@@ -76,7 +78,6 @@ ASTERISK_CONF_OPTS = \
 	--without-neon29 \
 	--without-newt \
 	--without-openr2 \
-	--without-osptk \
 	--without-postgres \
 	--without-popt \
 	--without-resample \
@@ -94,10 +95,9 @@ ASTERISK_CONF_OPTS = \
 	--with-libjwt="$(STAGING_DIR)/usr" \
 	--with-libxml2 \
 	--with-libedit="$(STAGING_DIR)/usr" \
-	--without-pjproject-bundled \
-	--with-pjproject="$(STAGING_DIR)/usr" \
+	--with-pjproject-bundled \
 	--with-sqlite3="$(STAGING_DIR)/usr" \
-	--with-sounds-cache=$(ASTERISK_DL_DIR)
+	--with-download-cache=$(ASTERISK_DL_DIR)
 
 # avcodec are from ffmpeg. There is virtually zero chance this could
 # even work; asterisk is looking for ffmpeg/avcodec.h which has not
@@ -135,13 +135,6 @@ else
 ASTERISK_CONF_OPTS += --without-gsm
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-ASTERISK_DEPENDENCIES += alsa-lib
-ASTERISK_CONF_OPTS += --with-asound
-else
-ASTERISK_CONF_OPTS += --without-asound
-endif
-
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 ASTERISK_DEPENDENCIES += bluez5_utils
 ASTERISK_CONF_OPTS += --with-bluetooth
@@ -299,6 +292,15 @@ ASTERISK_INSTALL_TARGET_OPTS = \
 	LDCONFIG=true \
 	install samples
 
+define ASTERISK_USERS
+	asterisk -1 asterisk -1 * /usr/lib/asterisk - - asterisk user
+endef
+
+define ASTERISK_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/asterisk/asterisk.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/asterisk.service
+endef
+
 $(eval $(autotools-package))
 
 #-------------------------------------------------------------------------------
diff --git a/package/asterisk/asterisk.service b/package/asterisk/asterisk.service
new file mode 100644
index 0000000000..aeb01703ac
--- /dev/null
+++ b/package/asterisk/asterisk.service
@@ -0,0 +1,34 @@
+[Unit]
+Description=Asterisk PBX and telephony daemon.
+After=network.target
+#include these if asterisk need to bind to a specific IP (other than 0.0.0.0)
+#Wants=network-online.target
+#After=network-online.target network.target
+
+[Service]
+Type=simple
+Environment=HOME=/usr/lib/asterisk
+#if systemd do not provide hostname and you need to use ${ENV(HOSTNAME)}
+#Environment=HOSTNAME=%H
+WorkingDirectory=/usr/lib/asterisk
+User=asterisk
+Group=asterisk
+ExecStart=/usr/sbin/asterisk -mqf -C /etc/asterisk/asterisk.conf
+ExecReload=/usr/sbin/asterisk -rx 'core reload'
+#if /var/run is a tmpfs, this will create /var/run/asterisk on start
+RuntimeDirectory=asterisk
+
+#Nice=0
+#UMask=0002
+LimitCORE=infinity
+#LimitNOFILE=
+Restart=always
+RestartSec=4
+
+# Prevent duplication of logs with color codes to /var/log/messages
+StandardOutput=null
+
+PrivateTmp=true
+
+[Install]
+WantedBy=multi-user.target
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
