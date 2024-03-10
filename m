Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92ACC54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 06:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF08406E9;
	Sun, 10 Mar 2024 06:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsL_WRtu2-5p; Sun, 10 Mar 2024 06:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51E04406D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E04406D9;
	Sun, 10 Mar 2024 06:23:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D08731BF384
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA7816066A
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0ynmKqFnLiv for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 06:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.78;
 helo=smtp37.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9B0C6065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B0C6065C
Received: from smtp37.i.mail.ru (smtp37.i.mail.ru [95.163.41.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9B0C6065C
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 06:23:38 +0000 (UTC)
Received: by smtp37.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rjCat-0000000AWZL-0Rqt; Sun, 10 Mar 2024 09:23:35 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 09:23:33 +0300
Message-ID: <20240310062333.642265-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93B4404EFBC5FECACE5C610B1725ED3C661FD8B55A48E2EE5182A05F5380850404C228DA9ACA6FE270031DE4784117D2EC591814E25D11F9F59E0EFBEB616CCFF8A0AA202076E9429A24CDA786A8AA87E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7ACA11F7F2395C8CCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637770CCD3A0ADFB7EEEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD87148F47B334FFC2DA040F7C857BBB9AFF544CEDE9BDDC699E51DF9E95F17B0083B26EA987F6312C9EC33AC447995A7AD186FD1C55BDD38FC3FD2E47CDBA5A96583C09775C1D3CA48CF2B25D9E4C92BC8AC117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7DE18F277BA63F6BF9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637B8F435DEDE9E76EBEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A548C37D4A416476455002B1117B3ED6966CC417AC0865F44B19AC5B239BAD4335823CB91A9FED034534781492E4B8EEAD2F8D89FC5850081EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF946D8EFD73096035A6F8E139B0E09386FF468A8046616B1304DB7219430BACC0D753EA1A396000B0748ED927723DE83FAD4279009AE481F4A631A17EBFF408319AF0DB1C54B5C6FC111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojuV2YtZBbGDzK+pyoQjDsmA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33FB961BCDE45BA22250E1C12B53D35892A2F5B6C30BC20E9090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=fvCCtfzSN+fDldpxoW43qtHhu/J6ZHia4VW/EdfejZ8=; t=1710051818; x=1710141818; 
 b=ZNUHOgLPls9no8i1R9au+frgfkx+VXurWiperGKz/JuiFm7iyXDQ40CX8JE96WIEvOrrofiB6St
 zr5JnX0mzcCEhr3E8J/9Hsc9WKTGv1HN3GTOae8yXBo2ICXATpP+RBSzKnFzZTA2eP0LO4KEy5tLl
 0Re2X3vmKA6ZZiss1GWUlSgsTp4Ri8GrY9lRupBX7Jb/tSp7aGuLjGwMz6zhqu+qgg0w/MtyCu6Sy
 jPyGkoxv941TfQf4hMWaYHtQPDHjsiXhgqBTFPJt6MLaBpIquMCD7vhSnNFvplcRQYFmlcDCGyNhN
 XfRdzLbErKobGro+PrRgxY3RqvzRbiTLpY0Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ZNUHOgLP
X-Mailman-Original-Authentication-Results: smtp37.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.11.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.11.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index a93ceb6a7f..df3302b2c7 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33849d8edacbca5ab5492fed32ac954de14f92ab6b3028c03ef88bb7ab596d20  osm2pgsql-1.10.0.tar.gz
+sha256  6b46313813b816f15ce906c04cd4108bbb05362740e0a1a8889055f4e25977d2  osm2pgsql-1.11.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 1565c2142c..846a4ea242 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.10.0
+OSM2PGSQL_VERSION = 1.11.0
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
