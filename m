Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87C5FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D0C41FB7;
	Fri,  6 Mar 2026 19:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GG3EJ_fnC29; Fri,  6 Mar 2026 19:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B6141F8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826767;
	bh=2HBlWc8l5N7+sj2vZsWoEmK991oI3s+U5dhtWEqM+38=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qx1VfAuvgEO1+NyOcdMaoopK9tzPGKyTm0GDPpNuHAH+7I0Nz9WXgafAf516kMeYB
	 a8Q8dqvW0OPMX7wxIPqMjnm/tK5hbh6ym8ch7pATXcR4wNrA2UWbrfsEo/U9bwJATp
	 cw/sPyrkCh4bXo5hP6IEmEsoKz2ezewJhRC93oth5ArSDnKTcLJIxXn4x0ZCRzVf7K
	 ytJLzfaaRv5YO3UQEeNIdnP22EGAxlfCW2YQ3hf4A/maTqX640xMtLLaoCi0d1slCT
	 N15rXdm2OydD0WyhyXPY9JqSP5TQAcFQrI8SgoR2rK7krdToBWL4OmnpvaWfp9Tolu
	 x+WVAiXbqVIMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B6141F8D;
	Fri,  6 Mar 2026 19:52:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DD09223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5682B82668
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrjBK8oEmAo3 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5BD283CFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5BD283CFD
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB32A7FB67; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:16:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bcf29cd8ee880a46936e2aae59ba72f62e6f802f
X-Git-Newrev: 10945b65772f8c2186dcf4d9e947c787358ad6ab
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.BB32A7FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/graphicsmagick:
 add CVE-2007-0770 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10945b65772f8c2186dcf4d9e947c787358ad6ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This vulnerability match on every version of graphicsmagick [1].
It was issued because of an incomplete patch for CVE-2006-5456 and has
been since remediated [2].

Since it's really old it's unlikely it will be updated and is thus added
to IGNORE_CVES.

[1] https://nvd.nist.gov//vuln/detail/CVE-2007-0770
[2] https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5c03ddb28637404ab37ce3eb4a0851c8135b4251)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/graphicsmagick/graphicsmagick.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 40107b3aae..6c2885b7d8 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -15,6 +15,11 @@ GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 # Fixed in version 1.2.3
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
 
+# Wrong NVD annotations englobbing all versions
+# Wrong patch for CVE-2006-5456 later updated
+# https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2007-0770
+
 # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
