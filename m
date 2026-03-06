Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F5FCC06A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6C641FA0;
	Fri,  6 Mar 2026 19:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rTy715rlrvc; Fri,  6 Mar 2026 19:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C92941F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826763;
	bh=9LCM/h1qoOhcGwPen4u4GZORFir6Z/NxVan6eR+0+gs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A9PNZatg5bVVCqabG+jasXyJ/gXiisvztTHZLuHQGNV6+20NxDBEESyAJjNIUAdVc
	 UzmUvX1elvA29glwt2xrZqwqHq584xy6EFF7Dwmyo4uiwodYBD7N/kC8BoqDeDc/lU
	 aQS/RZYIQav7gmr1+tDYXwublNLopr5ZPlKyxFxVUGvyFnVo13u5zVbIMrpSyyfrG0
	 zdHJkg3Z+o8jqoIHosSrrtzkdeizIfmebE+mCog+OLqDTfOmgXw9c2jNdD1gfyplLQ
	 F+bOamlepyArZ8jyfR1sWVZxQHsqmRv7L6uwWQxKDq/L13IGJkEl2xXHJqrLoIr0gx
	 8JJnZujYJnelw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C92941F8C;
	Fri,  6 Mar 2026 19:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E792223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7416C41E92
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdaO7NDAPuhg for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99FFC41E56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99FFC41E56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF56E7FEE1; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:35 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 398ce24c57513f664086a20a8f3c940a14577a82
X-Git-Newrev: bcf29cd8ee880a46936e2aae59ba72f62e6f802f
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.AF56E7FEE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/graphicsmagick:
 add CVE-2008-6621 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bcf29cd8ee880a46936e2aae59ba72f62e6f802f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This vulnerability match on every version of graphicsmagick. Since it's
really old it's unlikely it will be updated and is thus added to
IGNORE_CVES. See [1].

[1] https://nvd.nist.gov//vuln/detail/CVE-2008-6621

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b55fd37919e40c700251d0b8e9e10c73be048d5d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
