Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC49BCFB43C
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 17:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70D03607C7;
	Mon,  7 Oct 2024 17:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmgpSPgRG3Lk; Mon,  7 Oct 2024 17:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E6B607BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E6B607BA;
	Mon,  7 Oct 2024 17:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8BF1BF360
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 17:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09236404FC
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 17:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6p58FOvdOYW for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 17:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.93;
 helo=smtp55.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2E4040274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2E4040274
Received: from smtp55.i.mail.ru (smtp55.i.mail.ru [95.163.41.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2E4040274
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 17:34:01 +0000 (UTC)
Received: by exim-smtp-57dbb65494-rzgbx with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1sxrcM-000000009Ri-1hwT; Mon, 07 Oct 2024 20:33:58 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Mon,  7 Oct 2024 20:33:56 +0300
Message-ID: <20241007173356.967432-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9B01871A0ED523BBFE56F99792CC1187A2EC73447709F4BD8182A05F538085040AD96C6A07093369B3DE06ABAFEAF67056C630CDD50EF0DF20B9A3F99E1693F210CC985FF34F4B040
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CD501AD3AF4FF0D5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370BEBC60587DC626C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8396C523242AA19F902552A7E2A4664C3CDBD408732BD541B20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F79006376C7EDAC7DBA73289389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8978BC0718161B9C8F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD182BEBFE083D3B9BA73A03B725D353964B2FFDA4F57982C5F435872C767BF85DA227C277FBC8AE2E8B53A69B3AC30C7B9475ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5080A3798EBE769C45002B1117B3ED696AF349ED12917D75B484B8D70797403F6823CB91A9FED034534781492E4B8EEAD5C5DFC4BFF39B799F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D54AF47762AB4810619
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5B0EFD5CB450A53F08F0D22D62D3678D880A709EEBD8DD47B62648BA635DF7A712B9ACBE231CC78A4C7633FC567861F31A12019FBB3D4E939331DBA6B2DE9D171D77147A0B5F3FA5111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj/pBY5inp/EZ1Ri0HYnAWYw==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B3A3BCA05EF3A1EA7D1B6FC9ABEBBB39D2B411BB903CBAF8490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=6KMxwkQe5a3PWOoIW+rL2CCRjlDwPc+rhp2SB1wJp1M=; t=1728322441; x=1728412441; 
 b=jPjH4kkES3GeFv3IBnLYEvaONBEuylngrwSx3b8WlgMGT8jvpfKgM0GoavFTvgMSGIWrwW5tw0q
 tcPFHvNyOCATOaNc8jnKn7llnx7u1zLEE7DAzW3jW9BKoPXh5tnadLUpvvglillVtc6nplJLrDBhM
 VwbOH7M8AuWLvSL7Z4H/6k69TOW4Vejb/uXjLZRRVOxFi74ZSShMaqHMZPA+/ibitTE+8HYsiFI1K
 iutDKiyQ4dByO2MV/KfrmmuvCiO7XDO1Vmh8PAXfeRHxm+G9+R/akEJDlASlBcgUVuz59knMjH19x
 GW4NNrT3vRSMhg99N/lX+hNn7uvV0jHK+VZQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=jPjH4kkE
X-Mailman-Original-Authentication-Results: exim-smtp-57dbb65494-rzgbx;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.13.0
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

Changelog: https://github.com/libgeos/geos/releases/tag/3.13.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 362f1c10b6..36f47cd523 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  34c7770bf0090ee88488af98767d08e779f124fa33437e0aabec8abd4609fec6  geos-3.12.2.tar.bz2
+sha256  47ec83ff334d672b9e4426695f15da6e6368244214971fabf386ff8ef6df39e4  geos-3.13.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 05b74b60a2..beb2c077c4 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.12.2
+LIBGEOS_VERSION = 3.13.0
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
