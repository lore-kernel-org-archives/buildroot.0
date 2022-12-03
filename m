Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A52C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1244045790;
	Mon, 20 Feb 2023 21:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1244045790
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o2kUW9Owhi5t; Mon, 20 Feb 2023 21:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA524E456;
	Mon, 20 Feb 2023 21:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA524E456
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86E771BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3EAE61103
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3EAE61103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fo1uSb8-6L_k for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B407610F3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B407610F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B9808648F; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 22:30:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff
X-Git-Newrev: a63fbb0d9762a0e6a454b1bea9ce44d620a6860a
X-Patchwork-Hint: ignore
Message-Id: <20230220205155.0B9808648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/matchbox-keyboard: add
 libpng dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
