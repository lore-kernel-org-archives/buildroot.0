Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAA1F483ED
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1AE40CC6;
	Mon, 23 Mar 2026 19:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RII3YuwQFV-C; Mon, 23 Mar 2026 19:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B138740D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295294;
	bh=CVrQ8RGd90d8aM2dm2nKMiz6El3W8HmENLMWmmD126g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RPH34JIT+XSwjdDNmUofnokaz7tKtg9tAZavNS5bv/KCieiB9BODCJOtYnEc60AtL
	 pgYuikQtv3QZ9BXKs0+V8Q9TPBktBnFdTAQ34iB7hxPwY/Rp7uSdGGyol1vvlLTem1
	 f9E7s5/MO1CmiReOKkE4qdEY8jAFnS1OuI292DVxV9AahdfZuOQUbpug1y8eUBV9Hk
	 jRiSVfM5E7GLreTey2BrZ6MfQL8qQ8MvimUXGx9yKQo6YkA9mMCSDE1D5ElAE1OiYB
	 N/gLyLUZgY7uuHq2rJ1Pv0JpWmQRiX2T/1xxhyx4el676pFj9sE2jRYYgDatMVIVU7
	 2gayW/vN1e8MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B138740D10;
	Mon, 23 Mar 2026 19:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 136B2353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04E6740281
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRKDjge0cQ5f for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A366640262
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A366640262
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6008284CCC; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 15:20:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 170b59b4fbf5f8707ed43c59a012053935283d91
X-Git-Newrev: 8b3d346bd4fb533c76edfc88485dcb9d0f7efaf3
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.6008284CCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.56.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b3d346bd4fb533c76edfc88485dcb9d0f7efaf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.56.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index e8113fca1f..a86498a169 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  4eabb24bd95af9f7ecf52e68b02d2afedc631bcf059f5fc8354c09a0878bcc0a  broot-1.55.0-cargo4.tar.gz
+sha256  bd6e52151e28b4f76248156dcef5c0c56260caaffe39599c798792a528786fac  broot-1.56.1-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 83b2e3443c..f1174358ec 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.55.0
+BROOT_VERSION = 1.56.1
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
