Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F30C3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63997403E7;
	Thu,  8 Dec 2022 10:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63997403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shHkRmI31xjW; Thu,  8 Dec 2022 10:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F037402E7;
	Thu,  8 Dec 2022 10:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F037402E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485F91BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D0D401CC
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D0D401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnEe3CYmrFvn for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC70440283
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC70440283
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8BA685E69; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Dec 2022 10:53:59 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 15637d4830e3cd02c3d56cef8ef3c6a3d634c1f6
X-Git-Newrev: 534716254ce5b3867adbeef1baab2358c40b83da
X-Patchwork-Hint: ignore
Message-Id: <20221208100118.B8BA685E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 package/matchbox-keyboard: add libpng dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=534716254ce5b3867adbeef1baab2358c40b83da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

libpng is a mandatory dependency since bump to version 0.1.1 in commit
e2511d88e83acae4144be89ce5e258b724067bd5 and
https://git.yoctoproject.org/matchbox-keyboard/commit/?id=1d7c5f1e0ad736205151c0df5aa738f942bd3e97:

checking for PNG... no
configure: error: Package requirements (libpng) were not met:

Package 'libpng', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/4495f0720d7053a52ff8fef82d18a70a6f20c66b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a63fbb0d9762a0e6a454b1bea9ce44d620a6860a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-keyboard/Config.in            | 1 +
 package/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
index 260a57c6a4..3d7a9d203c 100644
--- a/package/matchbox-keyboard/Config.in
+++ b/package/matchbox-keyboard/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "matchbox-keyboard"
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index 242c4831d1..a1e3c61543 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -11,7 +11,7 @@ MATCHBOX_KEYBOARD_SITE = \
 MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
 MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING applet/applet.c
 MATCHBOX_KEYBOARD_DEPENDENCIES = \
-	host-pkgconf matchbox-lib matchbox-fakekey expat xlib_libXrender
+	host-pkgconf matchbox-lib matchbox-fakekey expat libpng xlib_libXrender
 # From git
 MATCHBOX_KEYBOARD_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
