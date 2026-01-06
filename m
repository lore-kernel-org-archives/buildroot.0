Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A3CD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B7D40AF3;
	Wed,  7 Jan 2026 17:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvNcZCxsRI2B; Wed,  7 Jan 2026 17:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF5040AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808067;
	bh=MkMpaTCHVG3pnWLiAK1yKckRpVYx87pF9yw3rerLw8M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LxE/7FXWSc65ZQ+GkhiralpBvhqTkGFDisUcyYXqG94fDRTQXUe5NDpEDxMai+Tac
	 629JjCmmIh7UO9kl2TuHOzr3dvHhWikTgx1Oqqx+oRx0nEjlx8R7Mk5y/OM09c9ioZ
	 ThjA/ePYrL21gyytR/lhrXXd4Acs3eC89g4Pox+x1yj0IIkuFWOVSmSqpJ141yg4BU
	 wVk7+o1SZo8eeYvzNwDJjOZ6KfluqwOiGucI3V5qEeU8obv+5bIaR93c+iKhKZP1Wy
	 7uzw2qcyoSIHPtK8T9TfVfW5JtjoVlj1RemCx2lYC4lFn5+C2i88SiM25C/+QQ+LKo
	 kzFmgcX46tEAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF5040AE9;
	Wed,  7 Jan 2026 17:47:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A20425B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D5380C63
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NltKhg48mzoI for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F5B80B82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4F5B80B82
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3C1681917; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:21 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d71f65ff4303d78e69a5be3bf9b8a7a681497944
X-Git-Newrev: 88198aaecee2ec00e6a08525e6bf6ccf1d5a1971
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.C3C1681917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openvmtools: add
 CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=88198aaecee2ec00e6a08525e6bf6ccf1d5a1971
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch fixes the information to the patch header to have a single
vulnerability per line.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96ba06347b33231a79541db516a3e45408a8ed68)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
