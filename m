Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1253FC4332F
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B010260B3D;
	Sat,  3 Dec 2022 21:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B010260B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1aSqbdVNp-X; Sat,  3 Dec 2022 21:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D4660AF4;
	Sat,  3 Dec 2022 21:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8D4660AF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC201BF5DC
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8143980C40
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8143980C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4duMKEAanYDc for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 21:33:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C70E780C3D
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 21:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C70E780C3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3B4F851BB; Sat,  3 Dec 2022 21:33:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 22:30:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff
X-Git-Newrev: a63fbb0d9762a0e6a454b1bea9ce44d620a6860a
X-Patchwork-Hint: ignore
Message-Id: <20221203213341.B3B4F851BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-keyboard: add libpng
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a63fbb0d9762a0e6a454b1bea9ce44d620a6860a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
