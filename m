Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03070EE20AF
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 15:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DBCD60D99;
	Fri,  6 Feb 2026 15:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8T-kS7G9GlM; Fri,  6 Feb 2026 15:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1F160E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770390695;
	bh=dkHce42gXB3qPZ+GPBrY4/lPSBeXk8cB9AcNqPJJUyY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kSsc1Jc+FQ3HfvRu7/afQb4swnO5hpnwyhHh9TZFD4wvHgg6xLt47pnFUsJNX5mTs
	 a+MlAC8Eq8DkMh/KFFArPsSCFGeLV/iVtgoSnFecfKS8nI98xArCVqbhMtaVXd5+Yb
	 eFf7LS1hLXAxMzRV3sSvv4wp7a9xBVoB0yx9ysIXMr7BuidxV5Jr5qdLhmT2atFXR2
	 VlpFjAlqSFa9B45GLPOb9MwtpZxsLxyCmIhnnOzqALAlUlhtR+KTmNK/JaQ5qErZaf
	 vw/nd9D9kg8KQjur3cc3Ll/X1TctcLh+FRQPmjhsQ2RmHgjvFPyJzAvx5m9f9T5CZv
	 OId80G97j1j3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB1F160E26;
	Fri,  6 Feb 2026 15:11:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA432173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF9C440979
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIjhJ_3ubf3P for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 15:11:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.57.108;
 helo=mail.villagedupre.fr; envelope-from=pyk@foss.peewhy.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C17BE4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C17BE4000B
Received: from mail.villagedupre.fr (villagedupre.fr [163.172.57.108])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C17BE4000B
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:11:32 +0000 (UTC)
Received: from sejong (82-64-130-240.subs.proxad.net [82.64.130.240])
 by villagedupre.fr (OpenSMTPD) with ESMTPSA id 66189035
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 6 Feb 2026 15:11:30 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Date: Fri,  6 Feb 2026 15:56:18 +0100
Message-ID: <20260206145618.337231-1-pyk@foss.peewhy.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206105242.0f66fb07@pc-1>
References: <20260206105242.0f66fb07@pc-1>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=foss.peewhy.fr
Subject: [Buildroot] [PATCH v3] package/libcamera: bump to v0.7.0
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.0

Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>

---
Changes v2 -> v3:
- omit unecessary license references

Changes v1 -> v2:
- add missing licenses libcamera.mk
- reorder licenses entries alphabetically
---
 package/libcamera/libcamera.hash |  2 +-
 package/libcamera/libcamera.mk   | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 4e79be844e60..e00e1257adb2 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  libcamera-v0.6.0-git4.tar.gz
+sha256  9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  libcamera-v0.7.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index e86e05328c1c..e8f502b2534e 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.6.0
+LIBCAMERA_VERSION = v0.7.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
@@ -23,23 +23,23 @@ LIBCAMERA_CONF_OPTS = \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
-	LGPL-2.1+ (library), \
-	GPL-2.0+ (utils), \
-	MIT (qcam/assets/feathericons), \
 	BSD-2-Clause (raspberrypi), \
-	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
+	CC-BY-SA-4.0 (doc), \
 	CC0-1.0 (meson build system), \
-	CC-BY-SA-4.0 (doc)
+	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
+	GPL-2.0+ (utils), \
+	LGPL-2.1+ (library), \
+	MIT (qcam/assets/feathericons)
 LIBCAMERA_LICENSE_FILES = \
-	LICENSES/LGPL-2.1-or-later.txt \
-	LICENSES/GPL-2.0-or-later.txt \
-	LICENSES/MIT.txt \
 	LICENSES/BSD-2-Clause.txt \
-	LICENSES/GPL-2.0-only.txt \
-	LICENSES/Linux-syscall-note.txt \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/CC-BY-SA-4.0.txt \
 	LICENSES/CC0-1.0.txt \
-	LICENSES/CC-BY-SA-4.0.txt
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/Linux-syscall-note.txt \
+	LICENSES/MIT.txt
 
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
 LIBCAMERA_CXXFLAGS = -faligned-new
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
