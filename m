Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F53D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECEB3410A2;
	Thu, 18 Dec 2025 16:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEXcRINrKKlN; Thu, 18 Dec 2025 16:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA65410D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075720;
	bh=RmublTSbfqw91M7Tof91vRenJprBQMOESc2oH1pZlVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QmGpG0aHbxDPPl+UhnNyqr6NSdwQn6c2Xh55Vsm4h1rivclvdSsWtCQpcjuJaY3nt
	 2RkzRN41vn85KNl2b4dlSgqhsKnjb8vcSs7lHZ+d1bDQxH/25qbHh9aoFL6AePiI+w
	 PuYzZIrISqsVlgiKQNGOKGRf4hawTXTWcEgpPikSwozQS3Zccg3uJTzAOfDWbRN+Bz
	 gE88f0+808e+RUxsM3UL2g+AFfXczmSx7j8/VIsXFNe/qCrGgEZpTvg8+k8giCSre3
	 C3DHEPqjoD/U17FiWTjEyOgynlubI+e7v/M68IlCcgW/23HL3NLzouu2nvcbz7LqNL
	 G4EEPLP1b5obw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA65410D2;
	Thu, 18 Dec 2025 16:35:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A88F1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7586F6115F
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GqcPztdiLNs for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D736261166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D736261166
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5B9986B3B; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:56:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7f233cd78e1d5356a975f9108fe9e1eeab624e14
X-Git-Newrev: 0b8037b1e52786932e99b8242333a1c1f5de487a
X-Patchwork-Hint: ignore
Message-Id: <20251218163507.D5B9986B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive:
 security bump version to 3.8.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b8037b1e52786932e99b8242333a1c1f5de487a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.3
"Libarchive 3.8.3 is a bugfix and security release."
https://github.com/libarchive/libarchive/releases/tag/v3.8.4

Switch to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add missing '#' in hash file to fix check-package error
 - add back the comment with the pgp signature
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 68b83f9a805908e37fa6cf01e57752eb8ae2bc59)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 7 ++++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index f31b693c67..1a61d254f7 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,5 +1,6 @@
-# Locally computed after verifying the signature from
-# https://www.libarchive.de/downloads/libarchive-3.8.2.tar.xz.asc
-sha256  db0dee91561cbd957689036a3a71281efefd131d35d1d98ebbc32720e4da58e2  libarchive-3.8.2.tar.xz
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
+# After verifying the pgp signature from:
+# https://www.libarchive.de/downloads/libarchive-3.8.4.tar.xz.asc
+sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 8568847493..083e913033 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.2
+LIBARCHIVE_VERSION = 3.8.4
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
