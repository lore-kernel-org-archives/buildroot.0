Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189F3C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB7F81F61;
	Mon, 19 May 2025 10:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwwYYw3Ur15F; Mon, 19 May 2025 10:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206B382087
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 206B382087;
	Mon, 19 May 2025 10:41:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 160361BF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6580960EED
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecYiCH8uMX6V for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C6C60EF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0C6C60EF8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C02C873DC; Mon, 19 May 2025 10:39:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:43:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 460da6d4b4b189a8a0fc512f6ccd2d642e610c66
X-Git-Newrev: 294e3a40bb7e0fe3af8fb4689529e595d6895099
X-Patchwork-Hint: ignore
Message-Id: <20250519103957.9C02C873DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/micropython: bump to
 version 1.22.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=294e3a40bb7e0fe3af8fb4689529e595d6895099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version bump removes CVE-2023-7152, which was incorrectly associated
with the micropython package in pkg-stats.

Although the CVE fix was already present in 1.22.0 the CVE only applied
to the preview version of 1.22.0. The CPE ID of the 1.22.0 matched with the
CPE ID of the 1.22.0 preview version as well.

This patch bumps to the latest patch-level version available in the 1.22.x
series to include additional fixes, rather than just adding the CVE to the
'MICROPYTHON_IGNORE_CVES' list.

The LICENSE hash has been updated, as the licenses used for the ports and
libraries have also been updated in the LICENSE file.

For more details on the version bump, see the release notes:
  - https://github.com/micropython/micropython/releases/tag/v1.22.2
  - https://github.com/micropython/micropython/releases/tag/v1.22.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 43551866b9..bbfde0e89f 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  a042764f0b6f6d92b267454c5bd5afcb83fc3900119f2583672aac571e661924  micropython-1.22.0.tar.xz
-sha256  d9e0e0395867c899090e150213bc2b417e970c17355a8d48300089875b3c8037  LICENSE
+sha256  bb3ba34848a7620663b6a7cba22af45d3056fc79328c2ceb943874b5478d8756  micropython-1.22.2.tar.xz
+sha256  fe63a3fbd0731f6530e0783224763bceef972e516cab4b8513ca4d7b05be9713  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 125a0edcfb..558ef86534 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.22.0
+MICROPYTHON_VERSION = 1.22.2
 MICROPYTHON_SITE = https://micropython.org/resources/source
 MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 # Micropython has a lot of code copied from other projects, and also a number
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
