Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9767C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 05:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9738C60F08;
	Tue, 18 Feb 2025 05:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6n4FXGOtpFsF; Tue, 18 Feb 2025 05:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A325F60F11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A325F60F11;
	Tue, 18 Feb 2025 05:37:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A6AA72
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 05:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75DD660F11
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 05:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C25MtYpV3du for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 05:37:24 +0000 (UTC)
X-Greylist: delayed 81008 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 18 Feb 2025 05:37:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2612F60F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2612F60F08
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.58;
 helo=send219.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send219.i.mail.ru (send219.i.mail.ru [95.163.59.58])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2612F60F08
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 05:37:23 +0000 (UTC)
Received: by exim-smtp-844687bc8-8d2vh with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tkGIJ-000000001lC-3g6N; Tue, 18 Feb 2025 08:37:20 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 18 Feb 2025 08:37:18 +0300
Message-ID: <20250218053718.80431-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93899CACFFF273C599441A9C4784ECFDD3A67E815C75128A7182A05F5380850403F8C9A1345F8CA983DE06ABAFEAF6705331DB9AEF040992428CD28B960291FAA5709D77201D190DA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792C68BF9CD4C0E9EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C2ED30353E4AD6B18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82546BFDF12487F67467823DBF7423A0D271A8EC57F1B074320879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F7900637855F30AB076FAB09389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8B1E7EB37E7A723DAF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDAE3FA6833AEA0C275ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A543C343099EEE85945002B1117B3ED696D4833A57DF58A1D569995D676B7B4CBE823CB91A9FED034534781492E4B8EEAD3C056C6FCE5AFF8EC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF401E1F26C89A0AE135EFBA8B46B14A73DD6E3B04971B671E41F95BE653030DC217059C39C4D662420526A8B1FD8BF66B67DFF3D2EEAF51486FD6EDF58E61E390C627F7B007FD0218111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdrXYFxdquIuBc=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219FA89CDD5EB07DCFB908ED357D782B6D81CDF72C24F867B4190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=S8ew3jD0pE0bDmYdKUjfGoOWxnVW21+CJPfKnVGRjvU=; t=1739857044; x=1739947044; 
 b=c+91qEHA4I3twNsK624PQT9mnRNrX3shmdqAAH9zwSREJeel7+7wibXHl/gieC/kIUTO4kfwzWm
 dpf/P+o7EadViGGcsSz/lIkBEXsm6uD9QhnGx58CweZBx9B2qEewJmHGvnhUDe3ghSTrAhTQskb+s
 BpvFsSfExKQleE8a6zqFlveCiH9aYGFEQlyz4JRQtWdqFYNF9vJrrmJUZj6vBfAU5nsuVQqNln4DD
 bVbWtyS0fkdNGiNWK2nFELA/Gd248NgOxbOg0iXpxO1UIQhO1Q0rZwaTDnOHifgB50C/X/qUrDRp6
 KBmqe4fT2GpLc1FexAn++AUmPooZ0n13AfhA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=c+91qEHA
X-Mailman-Original-Authentication-Results: exim-smtp-844687bc8-8d2vh; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.5.2
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

Changelog: https://github.com/postgis/postgis/blob/3.5.2/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 9e283f5ac7..83c4e9c99f 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ca698a22cc2b2b3467ac4e063b43a28413f3004ddd505bdccdd74c56a647f510  postgis-3.5.0.tar.gz
+sha256  fb9f95d56e3aaef6a296473c76a3b99005ac41864d486c197cd478c9b14f791a  postgis-3.5.2.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index a2b121e6f5..b6deb36cb3 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.5.0
+POSTGIS_VERSION = 3.5.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
