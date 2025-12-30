Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6798E95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C15960A64;
	Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1YmXiE85Ezi; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58EB608C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092255;
	bh=pOhjMb1ISQJ0jWtlliT8T/Ysbu5dMUeGLNgQp2bem78=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FK5Vmz1fZTxbP0x4lIKVid4pJvsKPqtEWm3DJyPMk2VM6/KkhrgTpZ+DqG/NHPIfx
	 vc4W1bqJPXsVZwKKccZzSrMVZSwmK/PYhcZP9nLXX+DCDkLdU7ruyvL9VphYpLoWXv
	 2ORVaF83GX0GiFnAk1kFqBEdTOlikO9suEyvpLdEfDZeXUPT4qI9GuuuANTMmUhJ3w
	 BndOxGfGVSnvNnoNEk3h3yVsirHIV2MoTG/wcXuw2Dz3dhVI39Zwm70n3qc1Tggygr
	 UtIPJ9ZFwrTTPY6RfoedfG5n2SfnpDCAV4EOC+lLjtybCs+cM0NVjGkZzewpr9b3JH
	 JC2YYC9/auezQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B58EB608C1;
	Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D69235B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B0A440369
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LzJCAwy5KRq for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87205402EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87205402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76C1087BD5; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:53:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74b079d9e916062629148ba79374998762e1998a
X-Git-Newrev: 237cd294b7bbe7c42e621042bef4756724d2c233
X-Patchwork-Hint: ignore
Message-Id: <20251230105734.76C1087BD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: remove stale IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=237cd294b7bbe7c42e621042bef4756724d2c233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot commit [1] introduced this IGNORE_CVES entry that was due
to a bad NVD entry.

The NVD database has now fixed the annotation [2] and it can be removed.

[1] 740412aefc package/tiff: ignore CVE-2025-8851
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-8851

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
