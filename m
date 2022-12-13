Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43F9C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F15160FBF;
	Tue, 13 Dec 2022 20:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F15160FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcCQx2ztwqzi; Tue, 13 Dec 2022 20:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED9D60FCE;
	Tue, 13 Dec 2022 20:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED9D60FCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6119A1BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CFB7403B7
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFB7403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBjejXPMagQ6 for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E17B40332
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E17B40332
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4892B8663A; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 21:07:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3d1d5a2dab19a954915c807e90ac74708b7e9ce
X-Git-Newrev: 67a6bc3d19afffffe75b1e6ffa1f0e1b89dea39f
X-Patchwork-Hint: ignore
Message-Id: <20221213202218.4892B8663A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbluray: bump version to 1.3.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67a6bc3d19afffffe75b1e6ffa1f0e1b89dea39f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://code.videolan.org/videolan/libbluray/-/blob/1.3.4/ChangeLog

Added a configure option to build without external libudfread introduced
in version 1.3.4:
https://code.videolan.org/videolan/libbluray/-/commit/2f10fb73b869337f2a2fb6fc8c8b45ef88383b78

Using --with-external-libudfread is broken so this option was not added.
Since the default to build with optional libudfread support was kept
upstream there is no change in behaviour.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 6e62bb49a1..a631722bb0 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.3.1/libbluray-1.3.1.tar.bz2.sha512
-sha512  f39fc8a11771e8fdd5eeebf0ab23535ffab44721f64b350e5d153eee44555b31c618b6d765da114254dc83ff0ff89e84c6b185f61cdbcfedd2d47a5f6e26b75a  libbluray-1.3.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbluray/1.3.4/libbluray-1.3.4.tar.bz2.sha512
+sha512  94dbf3b68d1c23fe4648c153cc2f0c251886fac0a6b6bbe3a77caabaa5322682f712afe4a7b6b16ca3f06744fbc0e1ca872209a32898dcf0ae182055d335aec1  libbluray-1.3.4.tar.bz2
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index a9eb3c67c6..54f4caa368 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.3.1
+LIBBLURAY_VERSION = 1.3.4
 LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
@@ -21,6 +21,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
 LIBBLURAY_DEPENDENCIES += libudfread
+else
+LIBBLURAY_CONF_OPTS += --without-external-libudfread
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
