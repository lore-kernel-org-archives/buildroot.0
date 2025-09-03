Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1502CA100B
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 06:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD0E84878;
	Wed,  3 Sep 2025 06:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRCj_9Zfl_3T; Wed,  3 Sep 2025 06:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872BB84879
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872BB84879;
	Wed,  3 Sep 2025 06:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4930B10E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 06:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B089409A5
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 06:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jnl1qeOD7eAV for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 06:41:05 +0000 (UTC)
X-Greylist: delayed 922 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Sep 2025 06:41:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58AC240CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58AC240CF5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.127;
 helo=send288.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send288.i.mail.ru (send288.i.mail.ru [95.163.59.127])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58AC240CF5
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 06:41:03 +0000 (UTC)
Received: from [10.113.109.250] (port=38104 helo=send243.i.mail.ru)
 by exim-fallback-d5d8ff84c-r6sx2 with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1utgwI-00000000NDy-2Er2
 for buildroot@buildroot.org; Wed, 03 Sep 2025 09:25:50 +0300
Received: by exim-smtp-6cfccc99f6-sdxx7 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1utgw1-00000000DEo-1mNX; Wed, 03 Sep 2025 09:25:33 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed,  3 Sep 2025 09:25:31 +0300
Message-ID: <20250903062531.1250298-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD953DE4E3DFC06176A543471BFCBFBDFFE30B1B3D7AD103D57182A05F538085040ADBC210B1E88580E3DE06ABAFEAF6705841A89789F689F1206FF51B85E2CC3352476E39F0D35E726
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A00D783AA463E1DBEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B21D79B316F41791312E070BE324C7D3C4BA1C8C75425D9FE1BB0A4F435E46E6718B35066C979671628AA50765F7900637F6B57BC7E64490618DEB871D839B73339E8FC8737B5C224990CCD2EB80CC9620CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C921661749BA6B9773545A75973B56231AD8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C9BE88FFEDFA497A35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5A668E0AC5D3DBFCF5002B1117B3ED696D46459D0334A9FF5886DC9BC01168B20823CB91A9FED034534781492E4B8EEAD5E26F3260102D3FBC79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF63DF3E12E034A994AE0C4F3748B03757472A268B5D4F04CDD1BA1F0AC2CB1582A54F2CFF063EE8C0F492A9F576A244DC709BE1726A21AB8919EA20B2E8AF6493C452767AF29ACB14111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtbEK2ou2cHfNo+NCeH1pEpg==
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6A1804A2C3F16BDA16C61E53A4FC9919DAD927065F797599890DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B45CEF65DC29DF0BFC59E5C65086B9334E06730A74128BB29F68F3CF0E9FE49B691FA4343018358978E914A16024122763ADCF6EF1646C9A48772293C4A70DF765A450AFEC6B7A56AE
X-7FA49CB5: 0D63561A33F958A5FF26CE0C945ACDAC5002B1117B3ED696D38DC9F574D5C671B99A9B79129B760402ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZP+DKzsrtf6USyYVSgZWe8Q==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=M37mZ2YYz0a++KH8Uokaq8ksNWGtmcoyQPKlyYzfg60=; t=1756881664; x=1756971664; 
 b=brp5LqznrDvT+MhfLMebmSNgmL2E386WKBv+P5oFQs1rNA/dSGQSfN3UenSGbrJyJzrX47Hcfxk
 XkasDM4hZDYjojwC5u4v2gLirIGt77WFnLUSFfKS/q3xiBeAPU40tYSpPP72oszGjOJl307zO8mmO
 EzQlSuVUuNcXe29gT/zu5ijMZX/oTbzQcUozuVpg7awNBlnlspGmAYR50vRfMjqOsSnR0ju5IJvhr
 bU27jmqjetWlzQP4C1pcP+ReDqSa462LvT4Vy/C0GTZ8H2q1+TYbkppBJiwNrm+l3M0jB7BOnMpoH
 75Ua5AG3L1qum/FZBx0K+Lr2Evsu0GXXVvGg==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=M37mZ2YYz0a++KH8Uokaq8ksNWGtmcoyQPKlyYzfg60=; t=1756880750; x=1756970750; 
 b=rdXHA9WrNxfI11bqIVsEQjlrHU2x52nEszW4ilRuaYp5EazANOW6Kw0/RHpd6T98394yHNzAPh8
 HYQVDV4ehIJJs/e3gCinJCju/8aldbOhImSVsvDQddjHOMdHcJbDTmf526Ell8vfS5T/hE0FL1I3G
 r47LxbGGGka0DOYNqQp0+m1IxtbR+ZDzhcH+iB02qJsnmgCGEVCdevZnL/NfR94Am+VVna7TxUpqX
 upv1SNMPv2oHPYlsZnKJcDa1/c3Z9mbRnsCHPqTqtOXSES1iC7v1X5FSUVnzpET2pM7YTyv303UK/
 moIYOLXVMvcSuBXmhmZcMwaWhWhVqycY61Nw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=brp5Lqzn; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=rdXHA9Wr
Subject: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.8.1
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

Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/protozero/protozero.hash | 2 +-
 package/protozero/protozero.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index 217e18a7c9..917746af35 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d95ca543fc42bd22b8c4bce1e6d691ce1711eda4b4910f7863449e6517fade6b  protozero-1.8.0.tar.gz
+sha256  6c7a896f1dc08435e8cd4f3780ff688cd0bfce6890599b755f6f3cb36398dc25  protozero-1.8.1.tar.gz
 sha256  254c0e9f18d261bfc55ff277cf12e3c1ca25839d56af17fba65d142396021466  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index e5160d3f04..c5c4285955 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.8.0
+PROTOZERO_VERSION = 1.8.1
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
