Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D821EB362F
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71AE341916;
	Tue,  3 Mar 2026 17:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y947MrSqm2jY; Tue,  3 Mar 2026 17:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A46C41849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772559217;
	bh=bhf0qXQdIx9XBUVQ3SePv2fNgy3o8PrHA+2We/nSFs4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kbucrcWtLiCj6GhIyS49KnFkCG9fOenqjkFg9qFy6+de8jBkP4i6+vdGz4kiTSp+s
	 AZguYzHgaDgbG83oSdMOMKt9eoNIjb0NknsmY4YPnxRm72Qq0thKg2zWqxWL5Zs61/
	 YPUPvl5UYN/Z4v5//2RcHkg4bNYvG5fIPSwU27oUs9qOJ+Fonvti4e01tkXXgRIYxT
	 nV1pju6UsHihXMjG/vIYeVZJEakItmlZTvmk7b64RqxDimMEc8cfqj653sGjtNvDSc
	 eB1iDlxH2L7Yce+NVKFiK4a3NfPqamu6gmkNWK8OGRKXZG42EtwxKlZ3hwIer/IyYb
	 qxK6cQNuGO4kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A46C41849;
	Tue,  3 Mar 2026 17:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAE8A1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC9EF400C0
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fRSdyUSQ-Ks for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E36940028
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E36940028
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25BDC86082; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 18:30:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d184e5504cf2c8cea992c6f2a08f1c185f86cac
X-Git-Newrev: b55fd37919e40c700251d0b8e9e10c73be048d5d
X-Patchwork-Hint: ignore
Message-Id: <20260303173334.25BDC86082@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphicsmagick: add CVE-2008-6621
 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b55fd37919e40c700251d0b8e9e10c73be048d5d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This vulnerability match on every version of graphicsmagick. Since it's
really old it's unlikely it will be updated and is thus added to
IGNORE_CVES. See [1].

[1] https://nvd.nist.gov//vuln/detail/CVE-2008-6621

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/graphicsmagick/graphicsmagick.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 4b9f3bd23c..40107b3aae 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -11,6 +11,10 @@ GRAPHICSMAGICK_LICENSE = MIT
 GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
 GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 
+# Wrong NVD annotations
+# Fixed in version 1.2.3
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
+
 # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
