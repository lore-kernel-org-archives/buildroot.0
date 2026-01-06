Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12536D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC50440C2B;
	Wed,  7 Jan 2026 17:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHAzrBAg9cFP; Wed,  7 Jan 2026 17:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1564F40C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808115;
	bh=9T963HS+BIpsU+tN7MOhDNqFonLMnD4MCNKN1ZL05DM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GVTbMLQ+EkX5q3E+79wDUFSD3cTmy7z5ZkCddDKkSEsV9l390HxsR/vVevldBMJFv
	 uubUJeFGTEa+Qr4qFNMJCo7dtk2dl94kWWGaee3vzybG9grhsO76lCyX0nisjQ4ynN
	 VcgyGbNMbrxBFwJfMpgDKRGyptUz5nX+RU4R9Fv0lgwMcA8lPha+v9I306M/H4yWYn
	 drKQ+vi8NXaZZFs/jgTvopuQ2meKBFzeQuR037aib+2xxK3ckFt3VWIUOYSXgEglDw
	 ojogHdsLp2SA2zsiLqep8Ks15R4UNdeqVKpIVlaV8BXV7AYc9uwQYPU7z+lxhiP/EF
	 RrRYCfB7cTaTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1564F40C31;
	Wed,  7 Jan 2026 17:48:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F64625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB6680D17
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HYqynfKKxxL for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B66AE80CD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B66AE80CD6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B58D78225F; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:44 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9cb5a7f69063fe8eeef3b106e02a743f83f218b8
X-Git-Newrev: 3f9e201663268c61767e9de43aa71e270e06a9a5
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.B58D78225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pixman: fix patch
 reference in IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f9e201663268c61767e9de43aa71e270e06a9a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the
`0001-Disable-tests.patch` patch reference
was removed in favour of a build argument that disable the tests.

This update the reference in IGNORE_CVES accordingly.

[1] ba2fb599cd package/pixman: bump to version 0.44.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f276648692b898aed8b32d4887a8372209b3cd2c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 5d29fd7b35..0a6ecaa7dd 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,11 +26,10 @@ PIXMAN_CONF_OPTS = \
 	-Dlibpng=disabled \
 	-Dtests=disabled
 
-# Affects only tests, and we don't build tests (see
-# 0001-Disable-tests.patch). See
-# https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
-# "not sure why NVD keeps assigning CVEs like this. This is just a
-# test executable".
+# Affects only tests, and we don't build tests.
+# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
+# "not sure why NVD keeps assigning CVEs like this. This is just a test
+# executable".
 PIXMAN_IGNORE_CVES += CVE-2023-37769
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
