Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B6DE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E9F64071D;
	Sun, 28 Dec 2025 21:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJ6u7apY86-W; Sun, 28 Dec 2025 21:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB18406BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955638;
	bh=ed+zt13yiWKeoauIDlBxmBFwy7O8uYnRtvrBBMv4I/c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QBtuuxqhM4EzpTzzbYrLgzM7WlgWHFy/bNCJ1xYWVXTP/DzS9NPo3xm84QdZymY4Y
	 jc2il5Q7mVGjX7usnHt2oMtN0XY0Z1wGQ2O3h/JVwpk6o0z4IUSvCVeYfhymbQdoCa
	 XOh3RaSgIh4ur1gqJMT8jUkR8s6//GqfaQBUovffOFJtyzPYs4rxmM1xsD0ZK1lw4L
	 CuZiRYG+jgMDPqge5eiyFpqLavKdXFuI4W4ZlkBfhb4JLhU4Pku+9jabExEwFWMr9V
	 o5CNe2ZMKM5LC27YS8lPiPRalnv7P3GGbI4+j4ni0kMsVW50O9BHr+/0Afzzi0zLvU
	 uN61VYbn1MJHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB18406BD;
	Sun, 28 Dec 2025 21:00:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2F2D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CC05405DF
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvD_MSsvDsIH for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E467405F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E467405F0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CE53811B3; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0921c6b38fd494de8b3490b965614d3f2089399
X-Git-Newrev: 96ba06347b33231a79541db516a3e45408a8ed68
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.9CE53811B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: add CVE trailer in
 patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96ba06347b33231a79541db516a3e45408a8ed68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch fixes the information to the patch header to have a single
vulnerability per line.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup/0014-CVE-2025-32911.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsoup/0014-CVE-2025-32911.patch b/package/libsoup/0014-CVE-2025-32911.patch
index 102acb4af3..2421e85201 100644
--- a/package/libsoup/0014-CVE-2025-32911.patch
+++ b/package/libsoup/0014-CVE-2025-32911.patch
@@ -3,7 +3,8 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 30 Apr 2025 14:59:55 +0800
 Subject: [PATCH] CVE-2025-32911
 
-CVE: CVE-2025-32911 CVE-2025-32913
+CVE: CVE-2025-32911
+CVE: CVE-2025-32913
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
 
 Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
