Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5063BCA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C6280ECD;
	Thu, 14 Aug 2025 20:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQ9I6ywvPc-d; Thu, 14 Aug 2025 20:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E28380EA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E28380EA5;
	Thu, 14 Aug 2025 20:06:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB97228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A733A80D3F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfqTO9pY3uyO for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62AF880D73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62AF880D73
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 610B08760A; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:34:06 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 5cada211a9054c47f49ddc75ce124f0accd6ff13
X-Git-Newrev: b0daed85e7787ec6c7fe640cf151af26a318151e
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.610B08760A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libapparmor:
 remove stale reference to patch 0001
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0daed85e7787ec6c7fe640cf151af26a318151e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The AUTORECONF variable was introduced in commit [1] with reference to
the patches that modified the m4 and Makefile.am files.

The commit [2] removed the last such patch but left the reference to the
patch and the AUTORECONF variable.

Later, commit [3] updated the mirror to the gitlab URL that no longer
bundle a pre-generated `configure` file, making the execution of
AUTORECONF necessary anyway.

This patch removes the obsolete reference to the patch 0001 removed in
[2] to avoid ambiguity with the new patch 0001 introduced in commit [4].

[1] 01a82c1401 package/libapparmor: enable python bindings
[2] 27cd0b5033 package/apparmor: bump to version 3.0.4
[3] 5649202ddc package/libapparmor: bump to version 3.1.7
[4] 2640f5dcd0 package/libapparmor: fix build w/ musl

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: add a comment explaining why]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 50cac72f73f7eee9136aa9cc48dbd5a5a12a0625)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libapparmor/libapparmor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index fa59ff2924..91c22ad35b 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -16,7 +16,7 @@ LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
 LIBAPPARMOR_SUBDIR = libraries/libapparmor
 LIBAPPARMOR_INSTALL_STAGING = YES
 
-# Patch 0001 touches Makefile.am and m4 files
+# no configure in tarball
 LIBAPPARMOR_AUTORECONF = YES
 
 # Most AppArmor tools will want to link to the static lib.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
