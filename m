Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EDBD0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB4E40ACA;
	Wed,  7 Jan 2026 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vf8JzdOkojqs; Wed,  7 Jan 2026 17:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CABA540A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808063;
	bh=0v9iiO8Kh79drxI2PEW0ZDNqlHkKheH3bHXBXVoqeNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f2V0axcr0BWuvtHaDAzm+tM2FBHErMRQF20zQTHEz6gUSRCGhDNXdSHmGqxuo5WcG
	 +cwaQHgUIUgrHq6CqynA+SOSIX/4qt6CK6Nj6sZvjJKAla7iBwZ60Z/vlEOe8+tt9B
	 LOYfEIOfC94jlchDvm4nt0mTpWsAgrHMCn/B0ep7XhSYl3D31VMxr8XRdg3rzpj7Km
	 iSlKV2WeXTm3VhOjavxuVqAqpiUUKSgcF7bsofKb2KINjPxM0g0WLVWXFwM/NF3K5G
	 DboVNA1+qYyzNr6h+jP8zWu9OcNPVVpqHM1Yo2gW/UtX01ymUHmpPrZ7Pq3hklxLbs
	 IQI/lhVJGmq1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABA540A9E;
	Wed,  7 Jan 2026 17:47:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 122499ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98967408AA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHuEmbTzRPf8 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8749C408A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8749C408A0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 867D288367; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:34 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 608cd4193162bf217529dfe3c08271bf0d11646d
X-Git-Newrev: 7f97279529c3ff4ffd3b746beef3c532d70bea4a
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.867D288367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cups-filter: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f97279529c3ff4ffd3b746beef3c532d70bea4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9b63b439c06c6bf485ff17dcf4477caded2d40e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
index e527b20f91..fbe2bfac4a 100644
--- a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
+++ b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
@@ -32,6 +32,7 @@ In addition, done the following fixes and improvements:
 
 - Use "static volatile int" for global variable job_canceled.
 
+CVE: CVE-2023-24805
 Upstream: https://github.com/OpenPrinting/cups-filters/commit/93e60d3df358c0ae6f3dba79e1c9684657683d89
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
