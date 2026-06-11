Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A395CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A68411A4;
	Fri, 12 Jun 2026 11:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7ZI2Lo00pSm; Fri, 12 Jun 2026 11:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4AF411A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263370;
	bh=ACilxWrILXdGBR0474nIfjwFwzaxzP2h7icdaXl6u2A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qQP4gghIe8k/KTWvBj0fy0Wjm+9q/U1LBpvbpNHTOzbn2uihYXzDmbJ4mHd1PLW38
	 esDkEyXGn0OQ1gEx1Q5SH2vlXd7UZXM4A1UCGTPgzzVvKd8lS4lhF/lBqvWDHKH2xr
	 8WLNNe3LYOggoWMcz78IRFzMeq8LTq69bmIt8Rn0D3oaC6wKciVsxrrJ0rguZ66Ufb
	 QPzihhwnlpTgHkAZDj7XQMOjj+IZyMOx40HFCl4M6WZZvJL/f5w0XISCN4G1VFdbvK
	 J3Iu6l+k/Lst3YZehj9zmK/2z9n1+I9ov9Be8EtqJVvVc3uc9RGUcKRNBUbKg/lPeT
	 6K5rF6JlgOjtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B4AF411A7;
	Fri, 12 Jun 2026 11:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24CC7321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 040CD40148
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyiBLNVz1MuC for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0265D40655
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0265D40655
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF02B880DE; Fri, 12 Jun 2026 11:22:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:40:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c6d15ebab99748ca3ed86b763bbd9fae43663e5d
X-Git-Newrev: d7daada10840c2c23bb29288ab2ddc7dcdf7f9d8
X-Patchwork-Hint: ignore
Message-Id: <20260612112209.CF02B880DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lrzip: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7daada10840c2c23bb29288ab2ddc7dcdf7f9d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE long_range_zip_project:long_range_zip hasn't been used since
2023. While ckolivas:lrzip got 3 CVEs that affect the current Buildroot
version [1][2][3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-9396
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15570
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15571

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2dce5a7844d061860810da4b77965d96d09eb2b4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/lrzip/lrzip.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 0375696414..03ad36c58b 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -9,8 +9,7 @@ LRZIP_SOURCE = lrzip-$(LRZIP_VERSION).tar.xz
 LRZIP_SITE = http://ck.kolivas.org/apps/lrzip
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
-LRZIP_CPE_ID_VENDOR = long_range_zip_project
-LRZIP_CPE_ID_PRODUCT = long_range_zip
+LRZIP_CPE_ID_VENDOR = ckolivas
 LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
