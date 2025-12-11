Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A4D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF21A408F0;
	Thu, 11 Dec 2025 19:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUXHtHQr-itH; Thu, 11 Dec 2025 19:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB284111A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481430;
	bh=jXTC47spWoKkCk5Rn2hW2Y1bLo3FsySuPiV2WJ1x0Tk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fqDBeHcZSgQNVtDteZMQKGVxkSdK0r7OMkh+M9N+EjagNuvreKwXsC4H98DCUsfFm
	 k1cbwiNeX9YPewV9BIirWPGBg/cVgieufsuOR9kPbswZXX/0lx9U/DHwLUKcs1tQlX
	 xBh2Kk4c+t3KcoO/N6gFugsra+0wROFpYz8YOZ5D5mSEKa4SDTpuK0KWIjquF3Q8z5
	 zb7IFda3BxJWZNgO99uaMHNQ1DP293kN+kulXXOVmSOq9i02/TpkqyYWYFarJRzYv4
	 n9a3s+6QumGUtoGu4wE683SytmN1W5Hz/VAF0AsO67mwNcn9XilFzfx2L19GXroWuO
	 WntYOxAkKlX1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB284111A;
	Thu, 11 Dec 2025 19:30:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 106742C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A6F80C56
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7b_rVvJNhl5 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C48880DF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C48880DF4
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B9E886BE2; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:45 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 8162a09cfede8d76cb2587d6ba0301c1e3c9abce
X-Git-Newrev: 05f367ee24ad1f6b4e4e1ff6311bc9e284fc2839
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.6B9E886BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/ficl: update SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=05f367ee24ad1f6b4e4e1ff6311bc9e284fc2839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Upstream moved the tarball to another folder:
https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
and also retired the package.

This patch just fixes the download problem.
CC'ing Francois to ask whether the package should be removed until a new
version 3.x is released.

Fixes:
https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b90121838c665/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f2b5cdf5a3b84612de3e51b210fd31c5152b057f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ficl/ficl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index af900fa2cf..c0698a3433 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -6,7 +6,7 @@
 
 FICL_VERSION_MAJOR = 4.1
 FICL_VERSION = $(FICL_VERSION_MAJOR).0
-FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)
+FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
 FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
