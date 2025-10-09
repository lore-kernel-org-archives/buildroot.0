Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E9DCCD183
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E666241177;
	Thu,  9 Oct 2025 19:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2sAIkzicDgf; Thu,  9 Oct 2025 19:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F34A141151
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F34A141151;
	Thu,  9 Oct 2025 19:47:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 862F9119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF4961396
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmPJi9sFQ0kN for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 19:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C278D612F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C278D612F4
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B35C186B55; Thu,  9 Oct 2025 19:47:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 21:46:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c90e226988db0e7874ba65de43ecaaa1512e5f88
X-Git-Newrev: 7962b3bfd1765987d7518495a4983b4780809cc6
X-Patchwork-Hint: ignore
Message-Id: <20251009194711.B35C186B55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: bump to version 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=7962b3bfd1765987d7518495a4983b4780809cc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://chrony-project.org/news.html

Enhancements:
  - Add maxunreach option to limit selection of unreachable sources
  - Add -u option to chronyc to drop root privileges
    (default chronyc user is set by configure script)

Bug fixes:
  - Hide chronyc socket to mitigate unsafe permissions change
  - Fix refclock extpps option to work on Linux >= 6.15
  - Validate refclock samples for reachability updates

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 75555fed9e..6b07b8d56a 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://chrony-project.org/releases/chrony-4.7-tar-gz-asc.txt
-sha256  c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b  chrony-4.7.tar.gz
+# https://chrony-project.org/releases/chrony-4.8-tar-gz-asc.txt
+sha256  33ea8eb2a4daeaa506e8fcafd5d6d89027ed6f2f0609645c6f149b560d301706  chrony-4.8.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index f2aca81d60..d1745419a2 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.7
+CHRONY_VERSION = 4.8
 CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
