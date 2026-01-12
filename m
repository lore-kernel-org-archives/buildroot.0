Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D21D25056
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 09:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0FE680EC9;
	Mon, 12 Jan 2026 09:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-taFQmfD-zv; Mon, 12 Jan 2026 09:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A01F80EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768208494;
	bh=NtqLsOkdHDW8+xCiLmex5Ssi5OvIC3r8722FKYx9jdg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BuT2xCGrKaz1xxYswgogBzPFBXOvf1kdV7gyyc7MdP3hICvlTj4ZdQOSN+aINGoD9
	 dxo7AWCgU/cDDQInBB090xvbal4aLAOTqJIpgg3GrJHPIoC8gWSdrKbIk0qzaG9Uuj
	 NXqiEGjkbDvcskI8S+zGs7IoCwRT8mLcrJAhbTeRfZdvL5+hcbCrcelglQA8R3Agu3
	 x81sWK6Vc7g6gTuOjCFUJYS23LAIWZoniMt7tjiGJQmXYoBP5XYoviWQK/J+hKcdBt
	 AWZioR9QW9CFbhnyE24R86wUsxV3huUautAEQsF6uxhf8ONiSK8s1fgCPnEweZW8eL
	 CMcv5BZMCLAJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A01F80EB6;
	Mon, 12 Jan 2026 09:01:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94C051CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8716040052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpOw5SkHjaY4 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 09:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.175;
 helo=send80.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E04534004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E04534004D
Received: from send80.i.mail.ru (send80.i.mail.ru [89.221.237.175])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E04534004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:01:29 +0000 (UTC)
Received: by exim-smtp-7b4fb89df9-8hjv7 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vfDng-000000006TK-3laN; Mon, 12 Jan 2026 12:01:25 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 12 Jan 2026 12:01:23 +0300
Message-ID: <20260112090123.67683-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD915529E8FC4AA06711C9A560450D6B8525830D8DE161C9B641867C24CE74E72BB5FE18E9CBFBE7C07B6B6D1AA2948BBBDA7FD08865BF5636F8FCD97F3BD28DEAC5B0C9D41A97932A7FEDCCBD3DDE7F493
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EED5D2FAB4CEB1EDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637ECAF4C2CEE0D0B2F8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B231BAB06F3CC79D622E070BE324C7D3C4B5F87E87D51E6790BB0A4F435E46E6718B35066C979671628AA50765F790063798EAA0EED4DE4A60389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0FF650BF36608E5878941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6CDE59DDCCE53AF2BCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE74ABCC139FF3F849B731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5370FEF94F78AECF25002B1117B3ED69636FD345C8CC6BAE169995D676B7B4CBE823CB91A9FED034534781492E4B8EEAD1DEE520572A35377C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659CF1744A19A680699918BA9C3630E7289C3B1FEC2C3EE6EB1F8D1A0F670C7DF0A8A93E87E400748EAB8341EE9D5BE9A0A6B9859B72DACA3585987ECB0382B565F69DA2D9350CA0EDD8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVVt0N+pdRHOZPbQskZzFQBk=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2575E2831CEECA090716D8B634192148D6321EBD812DE568290DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=3x78W2lFlTzKvf6MgZhBMlIOBvBU9hNDM3KNds3T1hA=; t=1768208490; x=1768298490; 
 b=a5BqvHJiudiJs6JiEHZX8v0x6sUdGmV0tEPggNfr9gdlKH+6XjOcwP3gW1slvN2D4ca+j8PRam8
 KRc4UmKgXnNv7Wx9sZWmqVzrBXAsj390B3UM2w/MoahHPVykEEGRsx22D+qNzHvd2Obt4nDerrBHH
 U4P1LhBrA42zz6pP0poc4P+FLGS4a5pjfq7vKtV0cT78CjcUUADNsZvJs1k9Wok5ZrW3Vn3FofaoV
 gX/AUuiCFfGkEWhQYTa8ahZJCRpv79KWmpPLc1AFd/KkC4cSAzqrN5LlQhatEbXzVv6hvfnTAoTui
 t/KrQttY53bMWhwxiZ4x+FIL6+aB8OR8m6xA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=a5BqvHJi
X-Mailman-Original-Authentication-Results: exim-smtp-7b4fb89df9-8hjv7;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.24.0
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

Changelog: https://github.com/timescale/timescaledb/blob/2.24.0/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index a2ccc28e29..888b6c2cfa 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  26575fa9e287a6107a6bf162bacab4932b0df19bee38d28c132f9a2d6591d647  timescaledb-2.23.1.tar.gz
+sha256  06a5d38c52bebb364104541002ccfb9ea739f93183c339895f0d1ed90b005e17  timescaledb-2.24.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 80c2b385aa..3ad8bb41fa 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.23.1
+TIMESCALEDB_VERSION = 2.24.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
