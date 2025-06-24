Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A941BC83000
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C1761240;
	Thu, 26 Jun 2025 19:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fX4xLIB0z250; Thu, 26 Jun 2025 19:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A259261273
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A259261273;
	Thu, 26 Jun 2025 19:13:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D9521CD
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FC7B418F2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpQKF3pKYyfn for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C5A418F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C5A418F3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 354A884547; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:52:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 00d5d387f5b9be4398af4c684150785896ee7b7c
X-Git-Newrev: 5c96f8d7f846babfdaef689a423ab8aacad048fc
X-Patchwork-Hint: ignore
Message-Id: <20250626191316.354A884547@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: security
 bump to v3.12.11
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c96f8d7f846babfdaef689a423ab8aacad048fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes the following CVEs affecting tarfile extraction filters:

- CVE-2024-12718:
    Bypass extraction filter to modify file metadata outside
    extraction directory

- CVE-2025-4138:
    Bypassing extraction filter to create symlinks to arbitrary targets
    outside extraction directory

- CVE-2025-4330:
    Extraction filter bypass for linking outside extraction directory

- CVE-2025-4435:
    Tarfile extracts filtered members when errorlevel=0

- CVE-2025-4517:
    Arbitrary writes via tarfile realpath overflow

See https://www.python.org/downloads/release/python-31211/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 2772e33109..923a632165 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31210/
-md5  0c0a6cce86d7611aed691d61e0599de0  Python-3.12.10.tar.xz
+# From https://www.python.org/downloads/release/python-31211/
+md5  9613d56b90d0d0cfd19980c7e2956a06  Python-3.12.11.tar.xz
 # Locally computed
-sha256  07ab697474595e06f06647417d3c7fa97ded07afc1a7e4454c5639919b46eaea  Python-3.12.10.tar.xz
+sha256  c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d49f7adb  Python-3.12.11.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6b3a3e81f3..8bbff066ab 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
