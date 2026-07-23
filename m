Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16F2C531CC
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 11:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7938B608E3;
	Thu, 23 Jul 2026 11:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvgNISnUmMBB; Thu, 23 Jul 2026 11:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18ECB608DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784805302;
	bh=fU8xzOrC6eX94u1YDb7w2+S/IqG/37z5W3l8VlLLQmY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DqittLEH/exKAPjoFQrwMRU6d43i/17kCx3SrnGyHFzPXecwwqaUsPxitTK/1sbNO
	 /fiW1Jnfl9vqRAhBNHwC6oQzfujaZdmKeoIWi7gLQIIE70tBq9B2AA9aVWXW+QzE3a
	 ne7uG5oMTeJMYk4Xh+VjuMTs8rGS0TOQobZVI6x8r+QgvSaWUBJuJGGpLkej4BZn7V
	 SeoTbQe7ThGfaToXRS4MeS+S7YUY4e+S/CFQPiNx24os7RCe6TpGkA+8QsDUeeykkV
	 73XKWPd0fG8HUp+8ZDojQQfRkW2bc4H4rsby71hw/t3pIURJngVWNPYqRVeXrlfy7Q
	 daZeN1upq9W9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18ECB608DC;
	Thu, 23 Jul 2026 11:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B8D707
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 11:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C52B04093C
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 11:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Jro3UzJGj9b for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 11:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.224;
 helo=send129.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3F8B40939
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F8B40939
Received: from send129.i.mail.ru (send129.i.mail.ru [89.221.237.224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3F8B40939
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 11:14:56 +0000 (UTC)
Received: by exim-smtp-86556fd747-pfcf6 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1wmrO8-000000000og-2uKR; Thu, 23 Jul 2026 14:14:53 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 23 Jul 2026 14:14:51 +0300
Message-ID: <20260723111451.705361-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD93ED3C6BF6FFA701F7F2B1828239C9590C9D8BEA4C3C4F923182A05F5380850405FA71AA81F9C4CBD3DE06ABAFEAF67058CE5DDAA707BEA38150013B93CB8231B2031A3DD069C1E5A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE721B3E54BB37EA0B4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2DF16F0A4F6C45E3D2E070BE324C7D3C4DAB79E9677A0315CBB0A4F435E46E6718B35066C979671628AA50765F7900637F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22492D2F7FFFBD358906CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C927680F9384605B9036030C3405640F6718941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C9BE88FFEDFA497A35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A57A75A71FC28895285002B1117B3ED696CE6CF4EDCF400D5FBFF4097FFC9E796F823CB91A9FED034534781492E4B8EEAD0BC323893F80E328C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659F9BA2B00D37A818E28A7607FC7CB65D5972E2D14155B2F35AA156ABF3A85BAEABEAC4ECF9A1187EAB8341EE9D5BE9A0A43586941F5E05C17EBAEC6A3880FD30B1C517AAD0C7DD1568CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtll+us4UU8R0m0uFCKFZlWA==
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE24527B4C766EEDF069A5E495C474E844BD7C40A4CB2E5EF7590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=8gvemfKybelSk1wAOGXU73aWMa8bzsKTkLNmDM2QDOQ=; t=1784805298; x=1784895298; 
 b=AiIAcQ1CSy3PkyFRZQylW2KBg6XZTPG4gTFrG+aqNwD36NI3uqx1w9y48xNEo7srlmsYXRcpw7q
 KqMBoTALH4fjR5yUS97/GPfiO62lK2NT9CWUFs8k8L8ERWpVuy9MprsJtmx311QEKzh2JPBFWErOM
 zy+ESwqOOIl3ASF8xW6f69YW+aRwXZaUuCW6fcmVjvx+qQeWMLY/nmhnpOnLS17nFu1K+TQwUFPyt
 RLTVHES5zym9a7hi9J6EGKuFCftelSRbBQ4aYMDsNk7rVSnBLUnnfyweulKBIfJWGcve0PaBYSH9G
 lPcAtfRtBR/4W/Umn/TvI0GNgKKZ9bQt8Qyg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=AiIAcQ1C
X-Mailman-Original-Authentication-Results: exim-smtp-86556fd747-pfcf6;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.6.4
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/postgis/postgis/blob/3.6.4/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 8ca0fa48c3..aef1864016 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d488089a64ee4060bce7dbba0291fcca358e7f7ac5230e2ee5b344e7485729c4  postgis-3.6.2.tar.gz
+sha256  ed8dc6679f1e06f7b113592b04cde2a7e00f1b1e681294c8ca2204058990cec6  postgis-3.6.4.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 0a55ee0e58..8a52027967 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.6.2
+POSTGIS_VERSION = 3.6.4
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
