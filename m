Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C04CC6B2C
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF69040450;
	Wed, 14 Oct 2026 21:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uVoMwKR6jA2; Wed, 14 Oct 2026 21:47:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CD1240781
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792014431;
	b=eSjN0ZlgEx4H+/DQQNGB3dpmoHgZNcy47hKLwkGVneq0TRUiA0Fqf+CRGmVNr6TGane/
	 yC/20wgbqLCBb11ThrKzd5g1iwkGzC04nbdTApcglxrbB8lGF9InuRFVucrzGJ7CiP4d1
	 d9FrZGTmqseNF9addUrugoZRbzGmvKjonaHztVDjEtkb94nc0PTVi2yUpWt46phHbVA/f
	 Vkt0sIbnFZ1ugkkUyHzJu9+gj7ZYUtPvN5iOMVyG+foq5lP+10DQ1nH1uhiqb7kHIfRYZ
	 toL46i0wFVH3ePiMDsstb3oSL/uvj7RvyAQRdmPiB1cl2BIHszBRENhhO1XZ0ZbZVxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792014431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=GtxeFtg8fWnRBT8UrAefj1SQwAAtbQT16cKeVLmkR0k=;
	b=Au03D1zB/e2wbaueWpQrjgg6mHjiUlXtdRHZm3z7cwb62aNhJfabylaQJ5tgwPyRlzch
	 vnt24Vx0Lv5Pmb7qQlIr091rBXZhYGMs4HFxC+6UnoChapzIBL5p9wxLIeIPl3dJTbfxV
	 h6d04a7dvSyeBrxZIIQcpy6MBmfVEsyy4C/YhwT50bzVLpH306IeKNQwhsr7Atxdep2IY
	 sCEEAyRZbd0PhZy+2SeCia1316mvLZ7Jw11VyDPNfPDm0c2lWgtL5kuLYdisdl9t7nPUm
	 KDj3E7c4pqK49L0PnzrBnzdubSYmz/TTX74VVG4qx6kMCNDyHdW47CD1XVe914+5xAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792014431;
	bh=GtxeFtg8fWnRBT8UrAefj1SQwAAtbQT16cKeVLmkR0k=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LLAKoWv+A2VUUJiOL0tOZc4hGBOgalRu7mL1ANyjK9WOCkjbq3/m7TvWj606tnCEs
	 lMzNF/nehGDZNJ6LAw1cA0sxJ8wmHw2WXHJm3q5/7UpefwNj3Mv20Yd+nxHDIiL4+i
	 StXCXyrP9Ad9obiOO3cAEZEd2+/jTXaRXyv+VY6zsDBoQUTkRjfuoNgbrD3T7Lom1I
	 Fz5OY0goZ+eDK0OPpBUlr1xOxM7WHrt3MI3wEY+du7JpZziCPtEHgnKKg/t7UtFBiJ
	 L/fdzdjp48b434nypbNvmT/s0r+eVgj1OVv6sxruukpUYexzWtk7RWrjk5UtkTb8Dq
	 Kz4AjHcqTH9cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD1240781;
	Wed, 14 Oct 2026 21:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A81AAA58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E56A80F61
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZ5Ldth9PP31 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:47:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 82F4080F20
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792014428;
 b=iV/Iy1TeEO/r1h5vfrs4jCMIdIux3nU2+p1QeSw7tlBBoViotAqITwUxUJ7HHdjaa9FB
 K6YPq9HyTCwir+syUmk254rTBefjK6hNLb+LD+efMdHve5u5PpxJzheCz+Hk8z16g+imK
 0O3zB58IRSBSriIUbPLz7NOXc/T2yjqKbRXnqXVWXLSxqVDgI0PNWSJGBF3J3VDA44FfG
 4AbtG/NqCNkSwh1DuQoZ/7NHm7pRbAxRCYFKrrWH/tpLsxZwat4GHLS11GuMoc3wk3jUL
 7q32qMqNnNeqDO0uzb7QMdIwBbVu6QZRZCknRqSyPSMIK7B/VxHirrhTKvaLhH8c2gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792014428;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=GjVUj2PVDUgTuwaH6Pumr3FwWC8Z3ts0nXRYQAOPTyM=;
 b=gI0RqQP3GHJfGpbH5YCPgkt1Q48JwK55GtgbeGbBfVZ9/Jkrv2IsjHqy2Djoo1ghWzUe
 bhjwt3gNJPJjJxrrEd9XifVC9pC9zicYjysUCgsW5JU3bSTq/gjfGvY4/GmwIr4aLgUes
 5btOJyVscc7oT/nzVYlVRvgRw61F3RG+H02Njne8xZrlkY+CPicmXlboH/owYkwyD+IrB
 8DdVJgfaNmdevp1BuhgXySI4ARJx6STT1wkR1jyuMewSdwjvlb6v2oRZykEJJZzrTSVJp
 1qlaBxTM5Yac3T8B2w7vwo7GZ3DO09JQbMRSGbqPGs0EbgcOCJxpLv4oQi7/704KPEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ezvcwp00; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82F4080F20
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:47:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5537E4E41239
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:47:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C40FD60368;
 Wed, 14 Oct 2026 21:47:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5ED9310328930; 
 Wed, 14 Oct 2026 23:47:03 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 14 Oct 2026 23:47:00 +0200
Message-ID: <20261014214701.537626-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/mender-update-modules: add missing
 BR2_USE_MMU dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM selects BR2_PACKAGE_RPM without
replicating its BR2_USE_MMU dependency.

BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU selects BR2_PACKAGE_SWUPDATE
without replicating its BR2_USE_MMU dependency.

This commit fixes that by properly propagating the missing
dependencies. There is in practice no functional change:
BR2_PACKAGE_MENDER_UPDATE_MODULES depends on
BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and go is only supported on
MMU-capable CPU architectures. But since there is no formal
relationship between BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and
BR2_USE_MMU, automatic validation cannot infer that
BR2_PACKAGE_MENDER_UPDATE_MODULES cannot be selected on !MMU systems.

Fixes: a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 4c60aece14..1fd7384f59 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -212,6 +212,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # rpm
 	select BR2_PACKAGE_RPM
 	help
 	  The Rpm Update Module updates software on the device using
@@ -224,6 +225,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/rpm
 
 comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -232,6 +234,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	bool "swupdate"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # swupdate
+	depends on BR2_USE_MMU # swupdate
 	select BR2_PACKAGE_JQ # runtime
 	select BR2_PACKAGE_SWUPDATE
 	help
@@ -244,6 +247,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/swu
 
 comment "swupdate support needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
