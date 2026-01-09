Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9967D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4FE838AC;
	Tue, 13 Jan 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MedfWQ7GZtDZ; Tue, 13 Jan 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECBA8392C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333021;
	bh=0EE6lPM0PViqo7VlfMaxNeTPfG9x4PWGjY6Dn1O0iCU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KEzsP+EsowCLpHdW3uytKP8laVmIXXSvIxfbA5Z7BNz+96UIOFMEmGQoQrxlynEKe
	 t52PCec8aBWMKknIJAFPZMYoxaBkXXG6pVoG5sPln8qVL68g1vxZDI9Krn5Q23mhga
	 f/aNm/lpedSJ56j9+T2wF1viKUe9Db/Me6vp8rLUGt4v5mw6Vd9d1q90CPTZFfP+ep
	 cNaW9W/al3Cb7TWYfRZ3Jo7bgITLA4vOCA5N+G4R7R3oUswG0pxppWqBw6gOJhtc9z
	 IMwqxiRNcJQP4w9CYtbKVD9O/RO2vz1FX5Ij5Tt6MOXBFipM+21A6dmmrpqXyOoSai
	 A+P8m5dwWfbYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECBA8392C;
	Tue, 13 Jan 2026 19:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 160892CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78BBC40516
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwVuB9FiMmfq for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FCE840416
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FCE840416
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DDD88854B; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fe357abb84877b836f0fca129e83e55c14be2067
X-Git-Newrev: aba6ad016df973417ed24c391f7facf0c1e66636
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.5DDD88854B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tiff: remove
 stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=aba6ad016df973417ed24c391f7facf0c1e66636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The Buildroot commit [1] introduced this IGNORE_CVES entry that was due
to a bad NVD entry.

The NVD database has now fixed the annotation [2] and it can be removed.

[1] 740412aefc package/tiff: ignore CVE-2025-8851
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-8851

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 237cd294b7bbe7c42e621042bef4756724d2c233)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tiff/tiff.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 32bebcf95f..e64a6baf83 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -13,9 +13,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# Fixed in 4.7.0
-TIFF_IGNORE_CVES += CVE-2025-8851
-
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
