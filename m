Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D0CCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C3C783F4A;
	Thu, 30 Oct 2025 08:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRIH2RWdlUyw; Thu, 30 Oct 2025 08:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE86883F3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE86883F3B;
	Thu, 30 Oct 2025 08:10:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 237FCFC5
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 090B840748
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzNfyM5f4815 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53DA44007E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53DA44007E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 420E2879F0; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:55:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fdfbad13cad9d7f5640d3bf0aa2abc1c6016fd92
X-Git-Newrev: 0f7762b85c149dfbc7790d272337c5b780df22f9
X-Patchwork-Hint: ignore
Message-Id: <20251030081039.420E2879F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/samba4: security
 bump to v4.21.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f7762b85c149dfbc7790d272337c5b780df22f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

As explained in the announcement:
https://www.samba.org/samba/history/samba-4.21.9.html

This fixes the following vulnerabilities:
- CVE-2025-9640:  Uninitialized memory disclosure via vfs_streams_xattr.
                  https://www.samba.org/samba/security/CVE-2025-9640.html

- CVE-2025-10230: Command injection via WINS server hook script.
                  https://www.samba.org/samba/security/CVE-2025-10230.html

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit f3eeb0c19a73410a3a1f26233506b5ca8a43d76a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9fff75bcb4..ae37e497cc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.8.tar.asc
-sha256  e78c36653a37e9647513e5408fc8052375901560d36b8744cd21acc9e4d91fc8  samba-4.21.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.21.9.tar.asc
+sha256  9d60206efb450c08700a85504ec2b63257be7c6e1c393627da54e047b4e9ea75  samba-4.21.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7895ec4a4c..c2886d9ea7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.8
+SAMBA4_VERSION = 4.21.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
