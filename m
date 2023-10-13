Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355EFCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E882C6080A;
	Fri, 13 Oct 2023 14:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E882C6080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHtYbnTV0yKz; Fri, 13 Oct 2023 14:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADF0610D6;
	Fri, 13 Oct 2023 14:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADF0610D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36B711BF33A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA83E82E5F
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA83E82E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d431jbru4A3r for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DDEC82EBA
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DDEC82EBA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F291E843FE; Fri, 13 Oct 2023 14:47:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:38:41 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 29e7a27801cf665f2fad14a2f6663b5c9ba41231
X-Git-Newrev: 97128028df9b116149fb2d2f482e0454bc1077e5
X-Patchwork-Hint: ignore
Message-Id: <20231013144706.F291E843FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/tar: security
 bump to version 1.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=97128028df9b116149fb2d2f482e0454bc1077e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

- Fix CVE-2022-48303: GNU Tar through 1.34 has a one-byte out-of-bounds
  read that results in use of uninitialized memory for a conditional
  jump. Exploitation to change the flow of control has not been
  demonstrated. The issue occurs in from_header in list.c via a V7
  archive in which mtime has approximately 11 whitespace characters.
- Update hash of COPYING (http replaced by https)

https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4d483451f0a305781b94b96c15a6cf4b489cd84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/tar.hash | 6 +++---
 package/tar/tar.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 1914a9f3b4..108a95ee62 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256  63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28  tar-1.34.tar.xz
-sha256  51337b19c71df92cd4f51c50efe4dc6ddc267d31fd54679be9e9bc2e6ce8132b  tar-1.34.cpio.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16  tar-1.35.tar.xz
+sha256  c77a38fcf25b21fd8209d20d35638744344ded239cfc7df80138bf46d3c6b16d  tar-1.35.cpio.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 690a5952ba..eea112ebc7 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.34
+TAR_VERSION = 1.35
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
