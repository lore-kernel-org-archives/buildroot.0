Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9885C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 06:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9556A60807;
	Wed, 22 May 2024 06:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tokZ_x8bN89H; Wed, 22 May 2024 06:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8FD160810
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FD160810;
	Wed, 22 May 2024 06:29:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 348631C57E5
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2139580E8D
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnDRl4-xt8Iv for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 06:29:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.137.243.71;
 helo=fallback16.i.mail.ru; envelope-from=fido_max@inbox.ru;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DBDC80E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBDC80E77
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DBDC80E77
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:28:59 +0000 (UTC)
Received: from [10.12.4.11] (port=46232 helo=smtp36.i.mail.ru)
 by fallback16.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1s9fT7-003oBz-2M
 for buildroot@buildroot.org; Wed, 22 May 2024 09:28:57 +0300
Received: by smtp36.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1s9fSv-0000000HD2M-1iVn; Wed, 22 May 2024 09:28:45 +0300
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:28:40 +0300
Message-ID: <20240522062840.439640-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD99EF2330544E8CB05BE9709F5D243C1C168585EF8DB359705182A05F538085040209BF7B5A4B5E3F289CEA9C911D09995BE97F096975586ACF0E4414AE440E9FFF14F8599D8FED5CC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74378043A27BE1642EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637040380BD28C1B15C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85AD05431B002007013B59A03950F2529DD578CF8736F622120879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C05A64D9A1E9CA65708941B15DA834481FA18204E546F3947C62B3BD3CC35DA588F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637424B6AA9142E4BBC389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F7900637B8FA30D9455089A722CA9DD8327EE4930A3850AC1BE2E735B17145F0B7815491C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5E538C73A6514E4465002B1117B3ED69694968805E142136A54BB1175C6E7DD94823CB91A9FED034534781492E4B8EEAD3C056C6FCE5AFF8EC79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB5B18C2B2CEC408F57ED68BE4410BE1990DA1BE1D3F1FEFB9F3FED33422F9531F2D331BABA2AF905A82CB81CB2FB284A298FA5A48D178541DBDC50E886D4EAA4A7545C5FBBB894BE111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioji7oPwb/+WNBb9jVA/yGwWQ==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B5CB54553F436A16C75DCD1AAB6C8C7E81B97288B128458B790DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4931842D42803ABA65168690DA483413965C6E3CC9FD482F0049FFFDB7839CE9E5285DA703F72759598B104D9B93DD0EEAD57D86E3E0CE3D75358BD23FDD0F86A
X-7FA49CB5: 0D63561A33F958A5D5A786A222474064357D12FB3D02637D4EC27A5E39E2EA44CACD7DF95DA8FC8BD5E8D9A59859A8B649BD6D9C51793B4DCC7F00164DA146DAFE8445B8C89999728AA50765F7900637007B9EE9EB8896AF389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC810A7BA5215B3CCECF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE741256E0470D8E12A731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioji7oPwb/+WNCkjeObEB+CAA==
X-Mailru-MI: 8000000000400800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Q8vrk+rWtgQj9HDaGPgWuB2qOrkA4LJGwUx5sybzLvQ=; 
 t=1716359339;x=1716449339; 
 b=iSg/ERXxAPf36xqoibLRUrmzEqGrXzJqZQM0B9ijxu2ZyStEAHmkaWMna6N30l04+e8ocAOutGkQvEX81NV/6T+l10l7UJicuyzTYAO3qQ8Wk1j7ISr5zWBnPYl06uTJmLFQZcmU3oPDi7TlIa8l82OTLRxOuySk9OZ9MJ7fLdTxjLrS4buSNxC5h9w5clWQeRikWLCFCzGE2RXuCSJC5g0QEt8XD7ZCXtbGE4WEokHjbGgQtQ9GSZv+ZoHofQe5elZEXWf/1Z16thDlVw405LatoN2tI1Gk6kmX8mQVZ7jfyP1aaxNIDNvvCzusltzWiNTLCin34CHROiVK4tfMrw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=Q8vrk+rWtgQj9HDaGPgWuB2qOrkA4LJGwUx5sybzLvQ=; t=1716359337; x=1716449337; 
 b=XfSyjDoVrsCcv5/iY6hoaFATWuLNsXfEdCyTeIfw3sUM1W7cVmvfJettnmQh2YJjLxamqdofQNp
 MfC8LxTuhusb8HJlhJne0mCJsXnQ5jsUT+q2QNj9z4rN0QkeYI7ZQKlKOpTxV9pbvCESj2WbXMgee
 7yKydJhVSivXLjTQJwjM4xdM84iljLAI1599wNXoAJ3VNBoEVrbz5iV7jvprLIi4CurppHMlJBuC/
 UhnyDEJq7UjldA/zXpw3zbEvOc9CsmvTQOcj5gAuiLuCaQyzIqeBzjPVQsx7uEwyoJ6A3y4bBgdNU
 4PXajx+SEk0Et+qNydMrIumoB/lPEZqoYeKA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=iSg/ERXx; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=XfSyjDoV
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.15.0
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

Release notes: https://github.com/timescale/timescaledb/blob/2.15.0/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index f98098bdb8..ba81c74c7e 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c7768b267ea67914d0491b28da102faecd317060e429b2da7530517fbc94e73b  timescaledb-2.14.2.tar.gz
+sha256  ff2019f734566f73af0a8041db50f7f1d0ad6967f7e2e7d796d388cd38c0b5bb  timescaledb-2.15.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 59731270c5..d6c8164234 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.14.2
+TIMESCALEDB_VERSION = 2.15.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
