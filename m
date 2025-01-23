Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA2C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80BA70748;
	Fri, 28 Feb 2025 17:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QT7InHYd4zdn; Fri, 28 Feb 2025 17:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B651A70814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B651A70814;
	Fri, 28 Feb 2025 17:02:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BCEA711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A96E42E58
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6j8jDnq-BLyt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B17D42E66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B17D42E66
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98482818ED; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Jan 2025 21:38:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11c11b9a247a920059a4e0f569da8eb39ad1914f
X-Git-Newrev: ac832e20bd71c5168457d9cc3a774b3615c01f45
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.98482818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wine: bump to version
 10.0
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3006084703661249529=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3006084703661249529==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ac832e20bd71c5168457d9cc3a774b3615c01f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For a summary of changes since 9.19, see:
https://www.winehq.org/news/

This commit also adds a comment near _VERSION describing the intent to
stick the package on stable versions. See [1].

[1] https://lore.kernel.org/buildroot/ff5c88fb-c745-483c-9f8e-8aa49164e76b@dawncrow.de/

Acked-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wine/wine.hash |  6 +++---
 package/wine/wine.mk   | 10 ++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 61de6db80f..eb0d45ca0a 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,8 +1,8 @@
 # From:
-# https://dl.winehq.org/wine/source/9.x/sha512sums.asc
-sha512  530219c6a337f2996eac92d644ab603528b82cc6136cc37c1e6aa736d418f33c6f4b0d54f3537b04bceaf4487d84abcf926a2f5e9536ed4e966c4fe63c5b6ddd  wine-9.19.tar.xz
+# https://dl.winehq.org/wine/source/10.0/sha512sums.asc
+sha512  effb41c5641993e2e52eaa825cc19b7d9846e084992c5a5b066ead2339b24384d320898a9cee347a9a87106bcb3b0f54c8cd2c8d4de3a887a658052ddd5168d6  wine-10.0.tar.xz
 # Locally calculated after checking pgp signature
-sha256  2c13a0c3f31f25a54d415d86785a1ad46ef8a07ae973b6b699345a45206ac015  wine-9.19.tar.xz
+sha256  c5e0b3f5f7efafb30e9cd4d9c624b85c583171d33549d933cd3402f341ac3601  wine-10.0.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
 sha256  51433d87540ee2f30e3cff986e00e1477880002bf993106a13775ed60d4e0af4  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 6b1ba19b0b..efee63a294 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,15 @@
 #
 ################################################################################
 
-WINE_VERSION = 9.19
+# In Buildroot, Wine should be updated only on "stable" versions. This
+# usually corresponds to version "X.0" (for initial stable releases)
+# or "X.0.y" (for maintenance releases). Please avoid updating to a
+# development version, unless it is absolutely needed (for example:
+# incompatibility with another library and no maintenance stable
+# version is available).
+WINE_VERSION = 10.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/9.x
+WINE_SITE = https://dl.winehq.org/wine/source/10.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq

--===============3006084703661249529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3006084703661249529==--
