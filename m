Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C396C001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 06:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0204061026;
	Mon, 31 Jul 2023 06:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0204061026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPUYKGZ4ARuO; Mon, 31 Jul 2023 06:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3324061042;
	Mon, 31 Jul 2023 06:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3324061042
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 256011BF3F2
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F273D61042
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F273D61042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezwLeyvfTVbM for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 06:57:48 +0000 (UTC)
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A618961026
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 06:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A618961026
Received: from [10.161.100.15] (port=56694 helo=smtpng3.i.mail.ru)
 by fallback13.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qQM8c-007EwE-Im
 for buildroot@buildroot.org; Mon, 31 Jul 2023 09:12:14 +0300
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qQM8T-0003in-AB; Mon, 31 Jul 2023 09:12:05 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 09:12:01 +0300
Message-Id: <20230731061201.26156-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD920919EE866B1AD2443B811EAA63348AB75BCBF9E7251987200894C459B0CD1B97BF00D82A76139FC367EF1F38DF77B10253F0E9A10E72B1200C9DE52C14C3926
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F4E79F226F99D4DDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379B0255B5E5688AF88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84A7F13B1C20C9A8B23E295BA3F0A3DC56F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D9E625A9149C048EE140C956E756FBB7AF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370A2DD59B67EFEE27389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6AAAE862A0553A39223F8577A6DFFEA7CB0EC3B1FCAE4A06943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A58A33E3B267DCE8289BC6AEB78436D26A42AF0494885E13ADF87CCE6106E1FC07E67D4AC08A07B9B0E753FA5741D1AD029C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3FA81ECE6279ADFCC63006A18E95913F0FDE84DA45FB2C80E3A4F0363805DA958657CCA151A12AF5337391BE08E8D56EF7623268BA5755D94782CAA7466498E940B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojJslAqQEzemtdBsKXH2EXfw==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986B95F63EC49F2A67BBD53479DE0827E36598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A38953B6848CF8DBBDFB616497C684075FDD48472F24446968F3CF0E9FE49B6943608B47A4DED820131A70DF4FF8CC3C64BF01E08D918AA2E6AF03ED255AF0FE
X-7FA49CB5: 0D63561A33F958A5BAD3E847373E814F4CC4F56EA3192ADCC74867E5F0F2633CCACD7DF95DA8FC8BD5E8D9A59859A8B6608027D3E87725F5
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFd+XxdZzrZy27i4yX88xMAdQ==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=/NojtuD8R496wM0+Tu7CZoLAzJ8Q4ogNB+C+PCMNyU8=; 
 t=1690786667;x=1690876667; 
 b=IvUs1q0DTsPklu9i33VA1z/MjCb4oHinByXFCnyikwfpRx4mbD8taNasjD7dUSAkk2fHRVErDpRmlPHzQlrlXF8/RSsgl/CHKUr/1ei0UR/rTcEcX3rddux7rVgk4LtWUNlBl/fK91E56AxC3+gIB3HvAnqQccUgb04dcA1hvBHMjAkwNVoa33mp9QrkrSknpRYlE23bC8CH//PnnERGIkPH5B8A3j+tWPZcdSAs3nPpaT440BFFJn4NMFuua9fT32jkPrk/+QgEF5CdVbb+G2e3Al8mnA25P3wui/iaxn++zDsjrWnoXHL2kNtdYsoyaR5zqVYQ/wD13fGjGk6lew==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=/NojtuD8R496wM0+Tu7CZoLAzJ8Q4ogNB+C+PCMNyU8=; 
 t=1690783934;x=1690873934; 
 b=R/07Oj7sJ3ZcG2+ETN2ktDv/JZjyAt9EfdJ3n4B/qJuErRzBqTQr938fZHIDYOeEzpp3svePgl91LUrb9zBaLAodHZL4/34ivD7L2wMYRreQcsDuRMT/gNwMf6FnTEkvH7BZicEqrGiFK8HZepAtdxy4MaMlxGnwLFKKAIzvBxLH6VkUq5yTce0ZVpn+qfS8JIjUqAitj6wnqKUmEKTt5xe6ly6UeieQnqQ+Yb7NPyK7wCqZkPOtnBrA5Spi4qDL5mhR3GUO73pip1CUZ7suAU3lp3aPZkqiQk7gHsamoAravJAIil/kd+Xh+lmiXTFA1oykJ5fWPWDX7lQ11K3CEg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=IvUs1q0D; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=R/07Oj7s
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.12.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/releases/tag/3.12.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 54f53d19de..bb433117a5 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b1f077669481c5a3e62affc49e96eb06f281987a5d36fdab225217e5b825e4cc  geos-3.11.2.tar.bz2
+sha256  d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39  geos-3.12.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 5a7932bad2..e0931dbb30 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.11.2
+LIBGEOS_VERSION = 3.12.0
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
