Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A630D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71EA4408D0;
	Tue, 13 Jan 2026 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PK6x2XOhQ3TY; Tue, 13 Jan 2026 19:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921AD40955
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333287;
	bh=dwJNUYHr6nWW2HMhSYLtfHwESN/N1U+uiVp8mThI5YM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TPvg/MWKwoWP/GjMOYDCQ6fEJCLZbFy/8SCmrxiaBLyUM2/QrZSbHd1TpjcuJ3nzz
	 PYc3AOYRHBGluLXGi5FC8DTHCS4QrS+JrCuhFldps/5cRjXPt/f/88ufJGgj/dFYQs
	 Hr6eoZI2wmaVgIHQmKEJGV+EoJKjvwI/sd7MTo9rP9cjHNU3KPZXZ4S/6m58xA6qpF
	 7lyl7g03e0QCYybdxt1NbEeyQ2u/U1/6BikGeVnlTBW9rcbc0C0dJphoEyuuSSFrme
	 o7Wda7/SttlpG6buzG5b40lWPPunHv4u8uEUTReA1np1mBJjinJwQD1cbOs3rr+MAw
	 cobO4/qDtPxtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 921AD40955;
	Tue, 13 Jan 2026 19:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 285FA231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39BBD82E95
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUCIrEXMdoy8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8709882C7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8709882C7C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8408986E70; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:19 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6f5c8638c1200df34cdc465102557628a5df439a
X-Git-Newrev: c4958f7b985fa035da30c42b988a8202764baf99
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.8408986E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/glibc: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4958f7b985fa035da30c42b988a8202764baf99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The IGNORE_CVES entries introduced in [1] no longer match to the glibc
package following the bump to v2.42 in [2]. The version boundaries
specified on the NVD DB are specific to 2.40 & 2.41.

The CVE-2025-8058 though don't have any information available on the NVD
DB and will remain on the IGNORE_CVES then.

[1] feaf53585a package/glibc: security bump to version 2.41-70
[2] fb6256c0ef package/{glibc, localdef}: bump to version 2.42

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6fc37d7c6e8320679eff6bf7a602e3bd5b486e6b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 924274a7d6..9c3ff7124e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -25,12 +25,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.41-57-g84bdbf8a6f2fdafd3661489dbb7f79835a52da82
-GLIBC_IGNORE_CVES += CVE-2025-5745
-
-# Fixed by glibc-2.41-60-g0c76c951620f9e12df2a89b2c684878b55bb6795
-GLIBC_IGNORE_CVES += CVE-2025-5702
-
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
