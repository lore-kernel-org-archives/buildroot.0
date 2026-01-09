Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71ED2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A2382F98;
	Tue, 13 Jan 2026 19:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blIWj8VRfRLi; Tue, 13 Jan 2026 19:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2640182C8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333257;
	bh=Rqubb5vUtpHycrJgH4GkejHFbqJsYSS69r4nebzHbo4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZlR2svIW4Gem54hHB8fskukuFBWTzqNv+9EPmKDDLH6q5pTSvVuuolDFlvuGGyV6r
	 utCaaMwSS9NN1K76oqr4T3NZ7nUCtKSqdUL5MfoByYjELTdenj7a1m3bhSxqkB+trs
	 vtOZ5UDbNUCMICkzM0EmvaTtNE2FpjfdR8rpZtX3KKo3Zgne0WPpvKqPRheFiClV1b
	 5GFxLUERY0NXprD5O8ZNu55cuVDRZY93szzVy5HYS4qrmNoLbhzxH+hTAkEyC17AXa
	 mYVutjw+03ITt03vL9Xuw+NpLsgrGLBW/9P5VUb2xTObQuwo5p/eibhYDwBC1al/CA
	 VFvIXjHGvJZew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2640182C8F;
	Tue, 13 Jan 2026 19:40:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02965231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 864CF82A0E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUour2hZ7M9A for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A3982A29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17A3982A29
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14FED8125F; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:14 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f8e626f0268399aa9a7867d264034163c7bdbe44
X-Git-Newrev: 6a3f34be1a6785dd3e092fead30c9b83f6968309
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.14FED8125F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/tiff: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a3f34be1a6785dd3e092fead30c9b83f6968309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
