Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A5C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 07:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6994760B67;
	Mon, 24 Mar 2025 07:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69NrFPB6k_9w; Mon, 24 Mar 2025 07:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D92FA60AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92FA60AF3;
	Mon, 24 Mar 2025 07:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 176BC1B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 07:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F03A400D0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 07:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUfqPPKgxQDa for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 07:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.13;
 helo=send174.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A32FA40BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32FA40BEC
Received: from send174.i.mail.ru (send174.i.mail.ru [95.163.59.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A32FA40BEC
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 07:09:29 +0000 (UTC)
Received: by exim-smtp-75f69ddc6c-tghpl with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1twbw5-000000007Nj-3HGa; Mon, 24 Mar 2025 10:09:26 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 24 Mar 2025 10:09:24 +0300
Message-ID: <20250324070924.162291-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92A53477891B58793825B79BECD38E02E42497B1FF40D587C182A05F538085040E1BE1868243582F73DE06ABAFEAF6705F799C62EC176F767E9228A36CA3E9D36F0D203FE66146AB1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78CB87876C5D626D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637204D59D994DFFAD78638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2224653F4ECB797492E070BE324C7D3C4C43C9D1620CBD536BB0A4F435E46E6718B35066C979671628AA50765F790063741F7343E26298569389733CBF5DBD5E913377AFFFEAFD2691661749BA6B97735F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637CBC60B0CD3BAC473389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7356436AE5DD6441DC7C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5209526E40CBFCB265002B1117B3ED696DA8C07A0BE39DD25250A03108B67251B823CB91A9FED034534781492E4B8EEAD4ADCFBF7921B375DC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF653FC12ED13D39312F8B2C702F0317F8105704E9D54B58E7EED40C03136DFD0614625291CC5E48B9D556C2DAAA19247FD1CB8E672B9E7B581B3392B3EF90C6BE6ADD7AD1520CDBDB111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtWsn0LzliPTTujWUZDrlUgw==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA2196F061DC9B9A92325BA1B7E7F728B64DDF88E37BDF9B5EAD590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=aNYJRZgZRQUbI1Mq+dxfkZ9xMduorZl7Q3yOtYDPcas=; t=1742800169; x=1742890169; 
 b=vfbhZdVb8LvhikERZphHUQyt84A4z23Tw5Rn75TG/BmtH089OKVtCn5hY3st8VKBhq7OJfsPSU1
 liuWJHQZ5ogEgMye7bQV4VoxkrPZz1tmSJoZJhq1GSbZJuukxjz/YrgzcprC4xjBtf1dEgdl4FlqC
 9WkmdW4HepQWSLCCJcBKIfFK9O9FiYq4/YviIfhuPpEtl00c+b7wKX4oqYo74LUZhfqAHqV9OQx3r
 weMjD2IvYnS4JqaaNOM4WopksN8RGNiUkeWSuZ6mtmqqqG5+HnsF4TKjFJ9YljqeM5LfRRL60+emb
 8n0CVeTrtMqTSs3+aFqdhI0yvRpQfqkIijag==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=vfbhZdVb
X-Mailman-Original-Authentication-Results: exim-smtp-75f69ddc6c-tghpl;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.22.0
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

Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.22.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 82657d7fe7..9f09024f74 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5a222e555865f742102d2802a7ad7ef91d6e1c8944c097c70a924214e079c858  libosmium-2.21.0.tar.gz
+sha256  8f74e3f6ba295baa7325ae5606e8f74ad9056f1d6ab4555c50bff6aa8246f366  libosmium-2.22.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index e5392b06e9..5b73b3a128 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.21.0
+LIBOSMIUM_VERSION = 2.22.0
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
