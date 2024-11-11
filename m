Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA81D3ABF6
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BF3606E6;
	Mon, 11 Nov 2024 20:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWqd3obyoSQV; Mon, 11 Nov 2024 20:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59998606F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59998606F8;
	Mon, 11 Nov 2024 20:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E8A7DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E76E606E6
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2HXz4wMh6tB for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B97C1606FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B97C1606FF
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5CC78612C; Mon, 11 Nov 2024 20:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 21:41:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 122a5e252911b2ebd84d59d802e7b28b2a499f24
X-Git-Newrev: 9b40127534bf3e34b5161baf0dd318e65a66dd99
X-Patchwork-Hint: ignore
Message-Id: <20241111204643.A5CC78612C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbredir: bump version to 0.14.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b40127534bf3e34b5161baf0dd318e65a66dd99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1].

This commit also updates the _SITE to the URL published on the
homepage [2]. The main motivation is to use HTTPS.

This commit also adds a comment in the hash file about the pgp
signature verification.

[1] https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.14.0/ChangeLog.md
[2] https://www.spice-space.org/usbredir.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbredir/usbredir.hash | 8 ++++++--
 package/usbredir/usbredir.mk   | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index 577e08efba..2be6301281 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,5 +1,9 @@
-# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
-sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
+# Hash from:
+# https://www.spice-space.org/download/usbredir/usbredir-0.14.0.tar.xz.sha256sum
+# After checking pgp signature:
+# https://www.spice-space.org/download/usbredir/usbredir-0.14.0.tar.xz.sig
+# with key 206D3B352F566F3B0E6572E997D9123DE37A484F
+sha256  924dfb5c78328fae45a4c93a01bc83bb72c1310abeed119109255627a8baa332  usbredir-0.14.0.tar.xz
 
 # Hash for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 325e7313aa..aefe51b6c4 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.13.0
+USBREDIR_VERSION = 0.14.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
-USBREDIR_SITE = http://spice-space.org/download/usbredir
+USBREDIR_SITE = https://www.spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
 USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
