Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C7ECD6E71
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B86F5427E1;
	Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id km0e8X8J_iw8; Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB00427F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512590;
	bh=r1H9GjVdVVRDjzEHtrMCsIJ8v9tLidfxP0iaD80tymo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kx65EE3jGLDTOuFYybDY7r507X2hEbQOpGUXyDn8GqLcdGgtcXXvugontmyp5kYCD
	 w/mzm4+qsA8mxR5ZaCl8d2AG+ylGtZGaI7P8k3hZQQd2c7mjd5Byi1nuhObv+Nt7ij
	 jnkM53Fh7k8SjWSgAQ0muE4hNRSZCN6VqhPK1qSndu6q5vj48ep9f+igSY8fkCNczd
	 LduhPwu5HNqVY8PtGtmXlJH/rYMgbyutue4pZc87DUioePVAuTCoPH3wyq3L73XVJL
	 TY+jsIfjobh1rUZYtIq02fyXBkj/jh/aEGkHB2B+rYxIWXRkl/rLmw5RvlAUC/kmAX
	 peBib/o/vWa9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAB00427F3;
	Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 386E6388
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A257422FF
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdXqcE-E-D1V for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3924011C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F3924011C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FAFC87992; Wed,  3 Jun 2026 18:49:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:40:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb756443fade620d1bab26724ed8b50239d19c8a
X-Git-Newrev: 2dce5a7844d061860810da4b77965d96d09eb2b4
X-Patchwork-Hint: ignore
Message-Id: <20260603184932.6FAFC87992@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lrzip: update CPE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2dce5a7844d061860810da4b77965d96d09eb2b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE long_range_zip_project:long_range_zip hasn't been used since
2023. While ckolivas:lrzip got 3 CVEs that affect the current Buildroot
version [1][2][3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-9396
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15570
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15571

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
