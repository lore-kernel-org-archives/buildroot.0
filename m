Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C80C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6360A8495D;
	Fri, 28 Feb 2025 16:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zp6816PW6zjJ; Fri, 28 Feb 2025 16:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DF88494D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75DF88494D;
	Fri, 28 Feb 2025 16:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFF468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE93A42DB9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkNmKYToCbRS for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95B042564
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E95B042564
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4E2E80584; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 17:27:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f52d4183e8221b99b8b206fd41d6fc98255d80c
X-Git-Newrev: 5027bcf2c5c6f152bd837b5f961a4eea8e92ba5a
X-Patchwork-Hint: ignore
Message-Id: <20250228162949.E4E2E80584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tinifier: bump version
 to 4.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5027bcf2c5c6f152bd837b5f961a4eea8e92ba5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

3.4.0 -> 3.5.0:

Changed

    Go version updated from 1.17.3 up to 1.18.0

3.5.0 -> 4.0.0:

Changed

    Go version updated from 1.18 up to 1.19
    Sub-command quota now supports multiple keys at once
    Default threads count for compress sub-command is now NumCPU * 6
    Go package (module) name changed to github.com/tarampampam/tinifier/v4
    New terminal UI

Added

    .env file support
    Global --version flag
    --update-mod-date flag for compress sub-command (since this release, the original file modification date will be preserved by default)
    --keep-original-file flag for compress sub-command #103

Removed

    Sub-command version (you can use --version flag instead)
    Global --debug flag
    Global --verbose flag

4.0.0 -> 4.1.0:

Changed

    Go dependencies updated
    Go version updated from 1.19 up to 1.20
    Module name changed from github.com/tarampampam/tinifier/v4 to gh.tarampamp.am/tinifier/v4

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tinifier/tinifier.hash | 2 +-
 package/tinifier/tinifier.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
index c43e77b88f..f22203cac6 100644
--- a/package/tinifier/tinifier.hash
+++ b/package/tinifier/tinifier.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a56fd648cdc86f82837fedfd3e1a9ecc5750f15be24630ea1533d64fc6d1c2bb  tinifier-3.4.0-go2.tar.gz
+sha256  42e5ad67a1533c009f655d8c66dbdbf5e6fe3b9934293586534b55143d1a542e  tinifier-4.1.0-go2.tar.gz
 sha256  18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c  LICENSE
diff --git a/package/tinifier/tinifier.mk b/package/tinifier/tinifier.mk
index d7ed6f7c93..d837b5da00 100644
--- a/package/tinifier/tinifier.mk
+++ b/package/tinifier/tinifier.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINIFIER_VERSION = 3.4.0
+TINIFIER_VERSION = 4.1.0
 TINIFIER_SITE = $(call github,tarampampam,tinifier,v$(TINIFIER_VERSION))
 TINIFIER_LICENSE = MIT
 TINIFIER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
