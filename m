Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0153ACA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 05:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF696F5D1;
	Thu,  4 Sep 2025 05:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euhR_a6FWMBV; Thu,  4 Sep 2025 05:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D0856F5C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D0856F5C8;
	Thu,  4 Sep 2025 05:33:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0573106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 05:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A217D84C81
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 05:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUuU08TGlWFP for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 05:33:13 +0000 (UTC)
X-Greylist: delayed 923 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 04 Sep 2025 05:33:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2440884C9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2440884C9D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.173;
 helo=send78.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send78.i.mail.ru (send78.i.mail.ru [89.221.237.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2440884C9D
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 05:33:10 +0000 (UTC)
Received: from [10.113.146.187] (port=48638 helo=send127.i.mail.ru)
 by exim-fallback-77dc7b79f6-2zxn8 with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1uu2M9-00000000AGW-33Wl
 for buildroot@buildroot.org; Thu, 04 Sep 2025 08:17:57 +0300
Received: by exim-smtp-68c6b975cf-vl4js with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uu2Lx-000000002iZ-18Z1; Thu, 04 Sep 2025 08:17:45 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu,  4 Sep 2025 08:17:43 +0300
Message-ID: <20250904051743.39628-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9506C28FC7AAC9D53A889301960F393696BCE7B66E9E5B54600894C459B0CD1B97534B44B3505AC8AF378A8CA21F699D65F4D5E79C5B309DB5354F8E85C96769FB7AB0E7134D2E1A8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E628FE8A185FCFBEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063750E64749F09C4ED58638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B20BFE65228618466F2E070BE324C7D3C4B0A6F4EF316B8BA1BB0A4F435E46E6718B35066C979671628AA50765F7900637F6B57BC7E64490618DEB871D839B73339E8FC8737B5C224931C0090ACECF247DCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0F6FAE79CA2B8C2908941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C9BE88FFEDFA497A35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A572AAF304861A8BF35002B1117B3ED69688B75647F66420D5F09842853758E9E5823CB91A9FED034534781492E4B8EEADB30A456A8F293845C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFCC9B56F21775B1D5AB9E9F2E86631C9FB1B8D812DAFAF318D58305C3E3EEE7E124DE828755D94EE9E0C80633D239C5E7442A4B064F182F1148C9E2B25598E8BD7B2C735DCA62B01F111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVXNcwk+fZooKg2AbmZufj64=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB60B8B4D3970F3ECCBC3ECF7C9FE0DE906C7EAEFF938054FD490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4846457A0DDDCBDD2EA7D6DDF6FA8453436D1F2719782BF07049FFFDB7839CE9E5A0567079EB597512A887A7FBF3DA68A8FEA647D3E3C37EC2E9CC4C553EC981AE3A5B33842D99A00
X-7FA49CB5: 0D63561A33F958A5A5FF9FB8F27F843E5002B1117B3ED69683C2271AEC7853D9F60D80CA342864C602ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZqmxXrT1R/KU4BIdV5NVlDw==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=17IJsdYINTE/xbQvSaCPCXG9ieGjkCmpnTgxFCIYIes=; t=1756963992; x=1757053992; 
 b=Gy+liVO53IYGTJ1fmkKtfIlKc2rulgNdN7EbhiW25OlfFx9iebAzjKwf9fIK5bnrYWcWBQnFqIv
 bs4M03lOZO6tOW+Dok+JAbTsvar0ARBz191xTF6WCCp4kMUIWilXLcX8i0TDRXLuVwrzi2eNybUOs
 26DisXARiSUOiBQ28uZyMsIBHVpsztHzvIoExh6eS72Nt2K3skXRW+I2+Fhy5YMm48WBPcY+ly+KD
 D6lBFTblT24riVp433dwwOSfKFxNfpgCxYTFrtM8M8jON14AZbXB2fGDddp2QdIaI8TwlFbxvufMS
 F8EcCKp+oOSz5K7YrAObIoEFHrWz4a+77riw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=17IJsdYINTE/xbQvSaCPCXG9ieGjkCmpnTgxFCIYIes=; t=1756963077; x=1757053077; 
 b=ljxpQN4a9ERLW79xUZK3Rexlk9fB+7zEB9bCxMIjTwozXH5O6SKrj0Ut2QarBTxgnNE1AURFTzU
 +w6zj99GYm+JA1dTmVKSgZcrfhDmkyguiC715VVO/N2wlwnnM3LaPlv1sdgFCn4ekvTWokTNsB7jI
 jJw5ofb6VELAZn3828bK35TSd0fGd9Tqr085L7wAnfddqdxOmfc0VygF+vtia6rMQj1GFdDch8XS6
 KLyzd9A/iQAFi9DncDP35F0dssKllPR2UKlcXMsICHHWQW45q95HwLiRrqekWdBieCZ6nRxnPgXw2
 TJQJsmO7LkkdrBqiBhd9tH7Orr+jSEod6rhw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Gy+liVO5; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ljxpQN4a
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.21.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/timescale/timescaledb/blob/2.21.3/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index a1945c6ff3..54e122fcdc 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  08e44c875618ed5ffa0d5b968b268d437952a3847403ef70a0bf44d9e59f3c30  timescaledb-2.21.0.tar.gz
+sha256  5b357d6c3e99cea3a5269618066cdebd9731e27da6e67e4181c7c6d07456ca70  timescaledb-2.21.3.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index fcb766c042..593421dd7a 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.21.0
+TIMESCALEDB_VERSION = 2.21.3
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
