Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADA9C636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 07:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B126108B;
	Wed,  8 Feb 2023 07:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B126108B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vAIZtIbe7dw; Wed,  8 Feb 2023 07:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7DC61059;
	Wed,  8 Feb 2023 07:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC7DC61059
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8071BF8B4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75D9381EBE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D9381EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzNVfxvb5OAl for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 07:12:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73B581E7D
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A73B581E7D
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 07:12:31 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pPed2-0006Kn-Pw; Wed, 08 Feb 2023 10:12:29 +0300
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 10:12:26 +0300
Message-Id: <20230208071226.33697-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC66046397AEC088A59FC2E4C3B8ABD5857F3D182A05F538085040EA6800D8B305A85EF6E7206890E7A0028CEF05C88CC39D864F3F5B8F0ED0FC24
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F544D30F1A6FA191EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373745FD4183B699148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F7FE4705C18DC1EEFE76B5AC5579EB5D6F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC5FC25ED3FCEC3375A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352091ADC097FE2C3A08F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD182BEBFE083D3B9BA73A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735F43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5EEA3B29BE358BC51D86F4FEAAF495B625C22B25CCBB3C6D74EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34951738D4D62E58A4A9453F22313106D73B751738F9CB936FD736C5D1EC13D2487D2A03B97AF02FD71D7E09C32AA3244C65B389FB58B42AF0C05744D1ED1243FFE8FBBEFAE1C4874C729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojDL2JcYrVG/9hj6eAEq+nfg==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF502716657FC8BF4EE5ECEBFCBD80713F998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ipyzjUQxTNWEmrS9Kjft36qWdykF75/G+yrmYl1uh3Y=; 
 t=1675840351;x=1675930351; 
 b=enYtYLAsEcQXArPm2g5n7jXxL6M6uAXYPaD2E+NotvgTN837nWV86dwSdl84fb0aB4NzYWI/vLyHPzkHKVxkOgCZ7Lp5uM2owr1vTauZUlkln0IJnew49BVgzwtAyhfWEdQzS2FT6mPkh6ugvoM+csNJx8YPmoq0RhxsloqEO7RlryRsc3DHcCe18YvATKSJqzh/nhxSXXnqXO3zBYN4bc79F6Qj912XRPft7wuqduBAUcBqAJS7ywq+kfFEdeNxCM/3XPNbcFO4pbTKv/rzkXuOwukG/ssm9ZIAy4SxfT99PVHhLsKo561oRuWpURItx+xu/QTsD/w7Zy6myKkg4Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=enYtYLAs
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 1/1] package/postgresql: add lz4 and zstd
 support
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

PostgreSQL has optional compression support (LZ4 and Zstandard).
So enable it if libraries are available.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2ffcac6595..0fb0e01153 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -91,6 +91,20 @@ else
 POSTGRESQL_CONF_OPTS += --without-libxml
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+POSTGRESQL_DEPENDENCIES += zstd
+POSTGRESQL_CONF_OPTS += --with-zstd
+else
+POSTGRESQL_CONF_OPTS += --without-zstd
+endif
+
+ifeq ($(BR2_PACKAGE_LZ4),y)
+POSTGRESQL_DEPENDENCIES += lz4
+POSTGRESQL_CONF_OPTS += --with-lz4
+else
+POSTGRESQL_CONF_OPTS += --without-lz4
+endif
+
 # required for postgresql.service Type=notify
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 POSTGRESQL_DEPENDENCIES += systemd
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
