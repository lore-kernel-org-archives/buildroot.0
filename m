Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD785C19776
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 06:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE5761B31;
	Fri, 28 Feb 2025 06:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSr3IouOyGHV; Fri, 28 Feb 2025 06:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DBC961B38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBC961B38;
	Fri, 28 Feb 2025 06:46:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1480368
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8F8984134
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fxg7Fm9OuJvY for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 06:46:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.82;
 helo=send243.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED67B8411C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED67B8411C
Received: from send243.i.mail.ru (send243.i.mail.ru [95.163.59.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED67B8411C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:46:48 +0000 (UTC)
Received: by exim-smtp-6559db9d9c-bqh9w with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tnu8z-00000000UYS-2ERo; Fri, 28 Feb 2025 09:46:45 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 28 Feb 2025 09:46:43 +0300
Message-ID: <20250228064643.91177-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD94C6F4C9F24859151C5DB9F5BB2BD23916E0D5913813AD4EB00894C459B0CD1B967CEFDBD22B4EDA8C8659717DE992388A867FF8EBC7443F7058AE1A1BADE7A28A2BA58D3D091CA1F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79389E7A2A88AA7BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375662B0B15A2BD47BC34A3978F742ACA12E306A8B9150784938109718A9396CC28C38EEF46B7454FC60B9742502CCDD46D0DD166953D3EA3826BF6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249A5DF9383870C0FEDCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0A0DA03275E5C1BCF8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C315AF0D0D4FC4FA3D35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A59008B13E741E26F35002B1117B3ED69662DB1698F1D6804C9E040399BDE4761E823CB91A9FED034534781492E4B8EEAD9F68E8F4EDE74A9DC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD23EA584B45F74FAB1BA71E1D6CD12997EB7498F154C93F8E62427BBD6A32E0F8135B9CF208C7BB7D4F7E0138972EF02B5968B4D07A407C56D7B2E43D16477180A87E3B29AC7BD9C111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVQQG/FugD0/CpmEL+MFijbQ=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219288DEB5BD61177E1589676318E5F2E07762D6305C9250B5A90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=BZl0fZ/k3qguuucbthTXmOGDSkWPjgZyVFfLypUj20Y=; t=1740725209; x=1740815209; 
 b=V2RaPzi4jasZEQnM/zvhU/bXpFpUZUOE9g4mcAdeM0M31CHa5sEN/kkUTvh2lErA0WALwWAvBQJ
 Eyx5qSKcXA8SSiHs8+r53eKuIoP4WyazZi+6rV2z4HlLtnXGRyVRHN4mft3YlGnK9BxqsZVphoMK4
 rFcvSV5SWSZMItZnXwX1cpmWtzRR4qjtEyj/lhe2mtjpPzWKL1Rcqvh/3BUMeSA7evXkq2qjT0bmU
 KzIszqoIyILLcPbBrT2Bi+XbvWwO2oZaAMx3JgVQE4FQmPGYQqINecwkm+nd34SQuK94wV3ktxOtc
 QYwwM0Uc2Yzsx614HP4ao7tPR8bHSohCYlCg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=V2RaPzi4
X-Mailman-Original-Authentication-Results: exim-smtp-6559db9d9c-bqh9w;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.0.1
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

Release-notes: https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.0.1

Change URL to osm2pgsql-dev.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index cc0d91f98f..9f119d9c7d 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05c2355b4a59d03a0f9855b4234a3bdc717b078faee625e73357947d1a82fe89  osm2pgsql-2.0.0.tar.gz
+sha256  b9d5c95ccc928aafc3c6caccb8b5bc19c4d48a5d1640cada07388d0dbf171ecc  osm2pgsql-2.0.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 7b54e4c0d2..f968a159d2 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 2.0.0
-OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
+OSM2PGSQL_VERSION = 2.0.1
+OSM2PGSQL_SITE = $(call github,osm2pgsql-dev,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
 OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
