Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02658C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC4160EFF
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAC4160EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852C460B19;
	Wed,  4 Aug 2021 00:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IS_vx_yj_nKP; Wed,  4 Aug 2021 00:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D09CD60A38;
	Wed,  4 Aug 2021 00:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8BF1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B699E40E4E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k49PrzhWICMJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A341740F9A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EFAB787E2D; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 12c05e42c7b0f346ec4ff0fa8e79af532cdd783c
X-Git-Newrev: be76508af2b2253f95137a28198139732be2dcb3
X-Patchwork-Hint: ignore
Message-Id: <20210803211021.EFAB787E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmbim: bump to
 version 1.26.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=be76508af2b2253f95137a28198139732be2dcb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This release introduces meson build system support that fixes
gobject-intorspection issue with autotools.

As meson files are only available in git, switch the location to
https://gitlab.freedesktop.org.

Since 1.26.0 libgudev is not required anymore so drop this dependency.

Add support for bash-completion.

Fixes:
http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmbim/libmbim.hash |  2 +-
 package/libmbim/libmbim.mk   | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 2779be1e96..07cfd69163 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  02590736163fff10e5732191fccc1b9920969616ddc59613a003052a116a3c25  libmbim-1.24.8.tar.xz
+sha256  63b53db0196dadea673f04524b0683ce40282f25bfd513d398e2a10b992cac01  libmbim-1.26.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index b343dec238..cdc3fabedb 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.24.8
-LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
-LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
+LIBMBIM_VERSION = 1.26.0
+LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
 LIBMBIM_CPE_ID_VENDOR = freedesktop
@@ -14,12 +13,18 @@ LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
 
-# if libgudev available, request udev support
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-LIBMBIM_DEPENDENCIES += libgudev
-LIBMBIM_CONF_OPTS += --with-udev
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBMBIM_DEPENDENCIES += gobject-introspection
+LIBMBIM_CONF_OPTS += -Dintrospection=true
 else
-LIBMBIM_CONF_OPTS += --without-udev
+LIBMBIM_CONF_OPTS += -Dintrospection=false
 endif
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBMBIM_DEPENDENCIES += bash-completion
+LIBMBIM_CONF_OPTS += -Dbash_completion=true
+else
+LIBMBIM_CONF_OPTS += -Dbash_completion=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
