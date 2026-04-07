Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC28FF5126
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3210060B72;
	Tue,  7 Apr 2026 17:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJe3d5GmN2dz; Tue,  7 Apr 2026 17:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD8C60D4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775582961;
	bh=Vxj9ZlZrKfHKbaMV2O7HpeZTx0lRPrTMoXxtpRfQLtE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z0dJBd1K622qoaaRCTZy3QsOcF7OZi3TejZ0vtD29YdbaXJy8KvXXt2+YQ8Kh9tH+
	 u5Vr2GcIl9vsFDy0GARkT3dsPFEikJxhlQsQzqxVHrH8O7zoc1lUOCYMzOXP5P1ILC
	 niDfm6FHHudAHGl61+s80cLeNyMBh+AiVO/7NFAaNE+EHareLaEFN1Xqdub0RAWxYX
	 PU3dcaXioNk0ti3LpMkUeuy9avOLOjyWOBNBqsYPrRGuQy74rpyKiaseyBq+4/sAtn
	 ICllvMtuBYG3Pgw1SfzkQIKJbZ3XW7N8oIfZTwbQytL0V+9MUORmlUOT429GABLBV2
	 rVsKxyQ3iu3gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD8C60D4D;
	Tue,  7 Apr 2026 17:29:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C07802C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C2560D4D
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvWslcLJWaB4 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA1E960B72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA1E960B72
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:29:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E1FE805A6; Tue,  7 Apr 2026 17:29:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 19:28:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac4c32f6f839d1b813125e64f0e23a98922ac602
X-Git-Newrev: 04689a8bc05d3a0e8d194ba795512438c10b53a0
X-Patchwork-Hint: ignore
Message-Id: <20260407172918.3E1FE805A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libphidget: bump to version
 1.24.20260127
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04689a8bc05d3a0e8d194ba795512438c10b53a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is also a backward-incompatible upgrade from version 21 to 22 [1].

Version 21 was deprecated in 2020, it doesn't support latest phidget
devices [2].

Version 22 is covered by BSD-3 instead of LGPL3 [3].

Release notes: https://www.phidgets.com/?view=changelog

[1] https://www.phidgets.com/docs/Upgrading_Code_from_Phidget21_to_Phidget22
[2] https://www.phidgets.com/docs21/Main_Page
[3] https://www.phidgets.com/docs/Software_License

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libphidget/libphidget.hash | 4 ++--
 package/libphidget/libphidget.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libphidget/libphidget.hash b/package/libphidget/libphidget.hash
index 9789f78646..7c2f67af7f 100644
--- a/package/libphidget/libphidget.hash
+++ b/package/libphidget/libphidget.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0e789912700228808519cf5c41e19f9b761da635c6bb676b147897936b23851f  libphidget_2.1.9.20190409.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  b1682ffb4a9a7d4589ec24256cbd30af1342880914117d3e3f4814e70049238c  libphidget22-1.24.20260127.tar.gz
+sha256  7c1c42a1485cd44f9b8275931e645962b7af86c524c0b683ab9fba62e7e3ece5  COPYING
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index f7d471f99a..f81080e1da 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBPHIDGET_VERSION = 2.1.9.20190409
-LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
-LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget
+LIBPHIDGET_VERSION = 1.24.20260127
+LIBPHIDGET_SOURCE = libphidget22-$(LIBPHIDGET_VERSION).tar.gz
+LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22
 LIBPHIDGET_DEPENDENCIES = libusb
 LIBPHIDGET_CONF_OPTS = --disable-ldconfig
 LIBPHIDGET_INSTALL_STAGING = YES
-LIBPHIDGET_LICENSE = LGPL-3.0
+LIBPHIDGET_LICENSE = BSD-3-Clause
 LIBPHIDGET_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
