Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCADC3271E
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 07:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F034098D;
	Thu, 11 Jul 2024 07:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2AYQ-4G9Z-q; Thu, 11 Jul 2024 07:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC5E440D83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC5E440D83;
	Thu, 11 Jul 2024 07:32:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE61B1BF863
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 07:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A937940184
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 07:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCEkQ9JwOwxZ for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 07:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.137.243.65;
 helo=fallback13.i.mail.ru; envelope-from=fido_max@inbox.ru;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C842A400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C842A400F6
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C842A400F6
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 07:32:18 +0000 (UTC)
Received: from [10.12.4.30] (port=56826 helo=smtp55.i.mail.ru)
 by fallback13.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1sRoHo-00D5ff-4G
 for buildroot@buildroot.org; Thu, 11 Jul 2024 10:32:16 +0300
Received: by smtp55.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1sRoHb-00000002rkw-1tMs; Thu, 11 Jul 2024 10:32:03 +0300
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 10:31:56 +0300
Message-ID: <20240711073156.360955-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9985AA43F8E1EDB6E06D05F165CEF3A3EF7AA80C9DB1578BA00894C459B0CD1B9A5B394FF03EFE14014D5C4874F525AA323152D85EB6C62ECB0F1CD599AA56AA6C91F273C30732FC0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7176D509958FF914FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637829D9538242026C38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80A01449365D561F277C96513F8DF9C40C24CC48DD2DD501420879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C78444BBB7636F62AF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E67544712269775B389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F7900637F09814068C508CC822CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5F931F399137557055002B1117B3ED69692B67679DBCE3217B91D2EB2DEE3878C823CB91A9FED034534781492E4B8EEADC3194D76C41E9723C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF116EAE95BAC474C3739D2CF91D9400EC00FAFDA4A6D54F4BD5777884F1273F7C141C0AB2DA7D0DDA8E7497A9C4BD18FF89537678580E6EB6482D23CCE93A4347A772BE206503F469111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYxP1dNBoSZmbPffCXqAw9w==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BDC03D1BCA683DCDE26DDCB453C49819FAF7BEC489D2623DA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4FC2B51242C20761DDD0753F9E2DCBD5BA5CC27D153D6789C049FFFDB7839CE9E7B40050E93261B940748AD083DB7A5F0008AEC242F5C81E605059BF875A5E4ED
X-7FA49CB5: 0D63561A33F958A56302A5CDED266C15FC42D8E0EAF12D5ACDD236C08694496CCACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F7900637CBA2F893EF2800639FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C342E5C09891E4E6C3CC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE4930A3850AC1BE2E735C8D5298E42E60C1FC4224003CC83647689D4C264860C145E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYxP1dNBoSZk6e+jcyWlbMg==
X-Mailru-MI: 8000000000400800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=6xjAePlB4Rjlev1Ni1ymoB2YLrygF4AwfXlX6Q11B8g=; 
 t=1720683138;x=1720773138; 
 b=ijFYqqGXsYzNwKOPTTivHkzRyuxAgptONOFyUJa00gY5ZF2/M9CF4p4p9hsYFNuCW77ZjEIfrBq0+sDN5HlyjBqQepND59/hazku5OyCwAetcW5MrWm6oo9iO8twvSL8nc5AlKlo6qgqc3/sSRYvBR/L1GMua2rcbvZmhtidu7FMWwaTwMrC7Lr44m6D94sXR8kkweuItY/cX8NCh5zUZi1y5Lg190JHo6lQYmTKbe9i7Sjt5CdzutbwYQquXSpvABiAG1SW46V4mzeccpUXtXpiTRub7K36CcL3Th40Mvjd6M+ZTKEQlOUtE2Hk9Rwdhz4EDmFMXBSwv6/IkpveTQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=6xjAePlB4Rjlev1Ni1ymoB2YLrygF4AwfXlX6Q11B8g=; t=1720683136; x=1720773136; 
 b=ACyQz+K7wMVsJVRFrzyd5mvOKBeAR/sXBGOsI8kVsN9hixx1ylle3fr72bLmfKkuML1VD3AxUrJ
 4k3yNl9N3wntYQcD5LdiE7/Xv1JO6MR6nqxw59F4GFsFC5OvgE61zzqpPLBK3/IeSg8m+1gxoIzFV
 g53fDt66QphCxOzmuKz/HKc9Aqh5QRgLBjakW9gKWD33i4cu9lfRAdvD5cCsTRYUX4JKXbS8M1X/v
 Clk8iizWpKxHHPPv6jVXdDhRLCnjHdsbi+XEx1N5IFw/jfXyELwz05/tWQg3IrRcG3VZM/CgkUPDK
 eugVBgy8SA338N7ExCy8mKBvBMCOFGHZa8dw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ijFYqqGX; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ACyQz+K7
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.12.2
 Changelog: https://github.com/libgeos/geos/releases/tag/3.12.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 37fe7d6d23..362f1c10b6 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d6ea7e492224b51193e8244fe3ec17c4d44d0777f3c32ca4fb171140549a0d03  geos-3.12.1.tar.bz2
+sha256  34c7770bf0090ee88488af98767d08e779f124fa33437e0aabec8abd4609fec6  geos-3.12.2.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 491168324f..05b74b60a2 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.12.1
+LIBGEOS_VERSION = 3.12.2
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
