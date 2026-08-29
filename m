Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8BEC61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E123860607;
	Sat, 29 Aug 2026 21:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwI_So1qU_XI; Sat, 29 Aug 2026 21:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788038429;
	bh=FoTHGyYU2ACaGIQEz84nMkGLVnAuKRKbMh55YzwOInA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JdVsqqxTZEDH6iwgsdHyNaA2DVM0TtdkHiKhDCE9f/Ud36rVN06dwpdYg1v9qf5mR
	 Y5nlUVECfeEluanWtjudkj2Z038P3YsEyBrW9g7mN9a4psV323jRlRCspO3QNVarJe
	 6myl7kq0m4HHpWC/YMgPVSXc3FLeslV63LcS0q0RldqxGTQr62z+MCctdO6dUhr+gS
	 8jaw3/KA3/MHHpPnQD6LTwk0Twe5PXxGl+PBWk3W2ulqpQBYCvfmy+G9akciUhpZR3
	 Z9vHdqjaBin8XRsqho8Abjnmz0ts5/Is/Bk1BfPn3+XLLjXYtSj5UJhjT+BXw6lV81
	 1/DzE1iZH160A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1326E6061B;
	Sat, 29 Aug 2026 21:20:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D89118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B77FB40057
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7R9fkAtaDrDe for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 175EB40059
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F45C8AB97; Sat, 29 Aug 2026 21:19:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:20:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd2fb3de1146b2317c0f2eef20b8afa6b0de25f5
X-Git-Newrev: c529a2c28628e60ac51917704a0ad5e2c5fb48e7
X-Patchwork-Hint: ignore
Message-Id: <20260829211927.5F45C8AB97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: post-image.sh/post-build.sh
 should use '-', not '_'
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c529a2c28628e60ac51917704a0ad5e2c5fb48e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Even though it's only documentation, the form of the names of the
post-image.sh and post-build.sh scripts should be consistent with the
names of those scripts used in the code base, using hyphen, not
underscore.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/customize-directory-structure.adoc | 8 ++++----
 docs/manual/customize-quick-guide.adoc         | 4 ++--
 docs/manual/customize-rootfs.adoc              | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/customize-directory-structure.adoc
index b4b5d50e1a..aab225811b 100644
--- a/docs/manual/customize-directory-structure.adoc
+++ b/docs/manual/customize-directory-structure.adoc
@@ -23,8 +23,8 @@ to you.
 |           +-- linux.config
 |           +-- busybox.config
 |           +-- <other configuration files>
-|           +-- post_build.sh
-|           +-- post_image.sh
+|           +-- post-build.sh
+|           +-- post-image.sh
 |           +-- rootfs_overlay/
 |           |   +-- etc/
 |           |   +-- <some files>
@@ -84,7 +84,7 @@ layers 'common' and 'fooboard' is:
 +-- board/
     +-- <company>/
         +-- common/
-        |   +-- post_build.sh
+        |   +-- post-build.sh
         |   +-- rootfs_overlay/
         |   |   +-- ...
         |   +-- patches/
@@ -94,7 +94,7 @@ layers 'common' and 'fooboard' is:
             +-- linux.config
             +-- busybox.config
             +-- <other configuration files>
-            +-- post_build.sh
+            +-- post-build.sh
             +-- rootfs_overlay/
             |   +-- ...
             +-- patches/
diff --git a/docs/manual/customize-quick-guide.adoc b/docs/manual/customize-quick-guide.adoc
index 315027c590..360cbe9622 100644
--- a/docs/manual/customize-quick-guide.adoc
+++ b/docs/manual/customize-quick-guide.adoc
@@ -35,9 +35,9 @@ your project can be skipped.
    Set +BR2_ROOTFS_OVERLAY+
    to +board/<manufacturer>/<boardname>/rootfs-overlay+.
 . Create a post-build script
-   +board/<manufacturer>/<boardname>/post_build.sh+. Set
+   +board/<manufacturer>/<boardname>/post-build.sh+. Set
    +BR2_ROOTFS_POST_BUILD_SCRIPT+ to
-   +board/<manufacturer>/<boardname>/post_build.sh+
+   +board/<manufacturer>/<boardname>/post-build.sh+
 . If additional setuid permissions have to be set or device nodes have
    to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index 4d03d04617..b7fe5813f7 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -52,7 +52,7 @@ Using post-build scripts, you can remove or modify any file in your
   post-build cleanup scripts.
 +
 As shown in xref:customize-dir-structure[], the recommended path for
-  this script is +board/<company>/<boardname>/post_build.sh+.
+  this script is +board/<company>/<boardname>/post-build.sh+.
 +
 The post-build scripts are run with the main Buildroot tree as current
   working directory. The path to the target filesystem is passed as the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
