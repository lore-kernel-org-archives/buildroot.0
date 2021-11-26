Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD70C433F5
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47891400DE;
	Fri, 26 Nov 2021 21:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Cd6tjqZGx94; Fri, 26 Nov 2021 21:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2761840169;
	Fri, 26 Nov 2021 21:11:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B17B1BF47A
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 21:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A1B24045B
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 21:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drl81_grpjrI for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 21:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59E9B4045A
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 21:11:02 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout02.t-online.de (Postfix) with SMTP id 658AC41CC
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 22:09:25 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.176.215]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mqiTC-0qHlZJ0; Fri, 26 Nov 2021 22:09:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:38368)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mqiTB-0004P9-Ld
 for buildroot@buildroot.org; Fri, 26 Nov 2021 22:09:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 26 Nov 2021 22:09:21 +0100
Message-Id: <20211126210921.23675-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637960962-00001454-BE75E957/0/0 CLEAN NORMAL
X-TOI-MSGID: f6c0cb81-cb85-4685-b75d-667e2f6680c0
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to 2.4.109
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/dri-devel/2021-November/332386.html

Changed _LICENSE_FILES to data/meson.build as it receives less updates
than xf86drm.c and therefore requires less changes of its hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 8 ++++----
 package/libdrm/libdrm.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index ee14d4c124..ca7332dd76 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2021-November/330279.html
-sha256  a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0  libdrm-2.4.108.tar.xz
-sha512  6a841dc3eb8eae7d75e1d35d23a14d51aff758e5a251dbcf6fc8c28d973d935a4a2f6751b405e956b2777d93c651721199ac80c3cd14b87d021668120d6bc974  libdrm-2.4.108.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2021-November/332386.html
+sha256  629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26  libdrm-2.4.109.tar.xz
+sha512  45194bb28207421afcff3e247930d2eeab77a5fea58e6be22f67525f2e0aab2f410a9ae0ab315b55ef56b80c481bba40b1660468b7cda539758b2bbb8e814fd8  libdrm-2.4.109.tar.xz
 
 # Hash for license file
-sha256  e64a695d0f18bfba26071afdfe19dd6ff4030d0dc1c47304059b724b23955ddb  xf86drm.c
+sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 0e4029fed2..9b614bf421 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.108
+LIBDRM_VERSION = 2.4.109
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-LIBDRM_LICENSE_FILES = xf86drm.c
+LIBDRM_LICENSE_FILES = data/meson.build
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
