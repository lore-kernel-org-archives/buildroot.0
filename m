Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D2CA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 05:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA78813D9;
	Fri,  5 Sep 2025 05:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEkXEDg2R5Fq; Fri,  5 Sep 2025 05:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C0081376
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69C0081376;
	Fri,  5 Sep 2025 05:06:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 076F2B69
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 05:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D7F60AC8
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 05:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKD82cNbELUO for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 05:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.115;
 helo=send276.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 276F460ACC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 276F460ACC
Received: from send276.i.mail.ru (send276.i.mail.ru [95.163.59.115])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 276F460ACC
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 05:06:04 +0000 (UTC)
Received: by exim-smtp-c584fb9f-hdz6d with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uuOe8-00000000K4t-45JB; Fri, 05 Sep 2025 08:06:01 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri,  5 Sep 2025 08:05:59 +0300
Message-ID: <20250905050559.69719-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD97173C46CF0E1F20A6DBBDCD08486426FD1B8AE1D0F9BACB7182A05F5380850407F57BE39452F042A3DE06ABAFEAF670520E7BC0196B540679FCD80973E68A02E75832A37A19CB0B4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792C68BF9CD4C0E9EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375661181B46645DEA2CBE9E1977D0F1FE2C3802DE227764524812510F034DE90C14B8EEF46B7454FC60B9742502CCDD46D0D2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22499334CD4963FA4318CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C920E30A4C9C8E338DA2F11D39E7306DD338941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C74813BC7F81EC8435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A521216AD131AE00815002B1117B3ED696A6A1B2BDADC1091E406406D89DD9EB8A823CB91A9FED034534781492E4B8EEAD05E80F4396618BB2C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFDEBFBF1D0EECCD0CD47BAC043B8C10389D91E1A26BE378E91CDCF0D4DB1080BB3D4CAFFB26F46A3DE0C80633D239C5E7254ECA98C7737B2665273ED6AD528A19C008063F4FB38F56111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEt1JS2Uy6iaasPPGMwj/ntrw==
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6744C7A2886AF881B27E97B113BE89D364609C47B3B9E418590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=nrgVqleDhtcXL29MRiRwew/U40Ah2okhkhyEY9ZWUyU=; t=1757048765; x=1757138765; 
 b=vrV26bpJW3bGc+LFCIdNEmkCoNmpDiZ1UUQp/6QSV5Obe7ktdVe+37oR8dUap/Z//v++44NHJqE
 UUZ9/xqAIBYy28+oXoPZq00BSxIJEYg5i1e2Qha3xEqcRntb8LecGm71gSA36OILRwmCKtXY1nEL2
 5x3hOgLQ7MllCHfIpvEITMRCcGhWNqbSwUKddKw8vvqQtiav9G/mrlK3O6AWgl3seXFZqoFUNLU8v
 EPMNlvVfNI4Rv9bIULR8bZKKmIWbLyf5Wfm1urqEbAO3FWc874dfVCmbqlUtrEz6zVefFC6+lXdRf
 djJzlsPTemRBwlndoB8WvT5bgZV6uTAvmDBg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=vrV26bpJ
X-Mailman-Original-Authentication-Results: exim-smtp-c584fb9f-hdz6d; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.5.3
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

Changelog: https://github.com/postgis/postgis/blob/3.5.3/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 83c4e9c99f..c67a830ea4 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fb9f95d56e3aaef6a296473c76a3b99005ac41864d486c197cd478c9b14f791a  postgis-3.5.2.tar.gz
+sha256  650e44de788d38175e3719df1d2ca4356bd987f54fe3d2030808de76464a2a06  postgis-3.5.3.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index b6deb36cb3..2888403b57 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.5.2
+POSTGIS_VERSION = 3.5.3
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
