Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A5ED0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8230640B3D;
	Wed,  7 Jan 2026 17:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lvgAbDPzdq8; Wed,  7 Jan 2026 17:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9969F40B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808081;
	bh=u6W4Ail+KT00Z3BY8y5WmPGHZdTA9/eYt/3576IgRPs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dLlb0JH5lJQ/0H5fNNhyucnKBxkioJWlVSXMHrBm+KrV0EVnjGZTeny+B17G+JFc2
	 1JhE6g8zhVurLqJT3o4nkCVn7Bb/AHz7nrjqkuLYqQotryl9MvWVOXl4NHpHMpJVpT
	 v7XdNr+WTeuKx0u5OKsfUiZ5bY6O/ijnEGqBGUWjzuuw36t7buE/8L2j8erskkN5e8
	 qI65qJd/E0yGYbrf7HN0Q0HPC6oSf9+0syma/fenvE5NVwI6YsXOv/vioSgdFPHJ/E
	 jRKw6cDV/zKZgilpoy/+GnKWvipSvhQiQE4reevmxnZWCJz9iczRgmUUQEPtouXM82
	 z3IyxbwXWkX7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9969F40B3E;
	Wed,  7 Jan 2026 17:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0730B25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C89A80BB3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkY1Rtl8b6NN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC09D80B21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC09D80B21
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB234883AA; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:41 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 32d1d7c367104d23cc9eec2762a7e543afdafd9e
X-Git-Newrev: c8f817c9957d6288119ba216425d3aa296246c95
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.BB234883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pixman: really
 enable NEON support on AArch64
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
Content-Type: multipart/mixed; boundary="===============7762194736279542614=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7762194736279542614==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c8f817c9957d6288119ba216425d3aa296246c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The test to enable NEON on AArch64 is as following:

ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)

It cannot be to true as $(BR2_aarch64) and $(BR2_ARM_CPU_HAS_NEON) are
mutually exclusive. NEON is compulsory on AArch64 so remove
$(BR2_ARM_CPU_HAS_NEON) from the test.

Fixes: ba2fb599cd002b57fa70e978d91884c98d8aad05 ("package/pixman: bump to version 0.44.2")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d297569eb405d2db729dadf8dd86ac2d1070b742)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 76e72d6d96..5d29fd7b35 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -68,7 +68,7 @@ else
 PIXMAN_CONF_OPTS += -Dneon=disabled
 endif
 
-ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)
+ifeq ($(BR2_aarch64),y)
 PIXMAN_CONF_OPTS += -Da64-neon=enabled
 else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled

--===============7762194736279542614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7762194736279542614==--
