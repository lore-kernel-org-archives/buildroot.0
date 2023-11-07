Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9EEC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 13:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B5C341828;
	Tue,  7 Nov 2023 13:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B5C341828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUkhfiQ-MRwk; Tue,  7 Nov 2023 13:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3EC741819;
	Tue,  7 Nov 2023 13:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3EC741819
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D41681BF215
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9047821BC
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9047821BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IX2XdwAjoiyv for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 13:59:23 +0000 (UTC)
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 137DB821B4
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 13:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 137DB821B4
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1r0Mbw-00087Q-0Q; Tue, 07 Nov 2023 16:59:20 +0300
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 16:59:17 +0300
Message-Id: <20231107135917.1008132-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD99FFD3FA9E0A670D85D07EAF5B36B0256E213751273FCFE2600894C459B0CD1B91A719DD14425D12B374B7C9FC03E99EE8702D10429002E15B9C4F2611CB3DCF4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CE4525FFB91B9BBCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637991D0D3E51C637188F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB55337566F9C8F5978A750CBCD92A389035B991A2AED47A02BF2070DF1DF9E95F17B0083B26EA987F6312C9EC1E561CDFBCA1751F6FD1C55BDD38FC3FD2E47CDBA5A96583C09775C1D3CA48CF0BE004AA24E73514117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE79FEEBCD9E13F050E9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006370669898C38A383F16D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637BC468E7E89D8C5D6EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5F3370D13A63523466C812CF66DF83CD3800696E7FB627DA2F87CCE6106E1FC07E67D4AC08A07B9B065B78C30F681404D9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF67A185C7288CF7681CCAFEF6FB4FAA6B13B5F98BBB178C06C00B59B3BF47F2E5A4BD9291AB2A84562B33B16BC67043E05725B5128399DC4E608851E3F446BC8640B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojoiosMWyUVRfgVJ+PpbX1tA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3380ADB4F83962AD3EA28FC8D56D65F4C298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=UEhQVidablH68K/dPJexQAG6kshuV8bPXrnz9ZDd34M=; 
 t=1699365563;x=1699455563; 
 b=ehkTiCp/bY5ZyBBA3pZJpjM5iW8Zyu1UFMnrJgS1ka5ik8wSfjTZ2mhUXxUpqFvUziSJ3K8i9OWNPT/NtuR/Mto4q04FCZCqd6w3NZVE0WtzQRLGbpR/TkfZgRZPsIQywK7dUhbdLoSvhabJw+ONuUX6k0T95tVdU5ME6cO+Q9IrC9R35MDWjhk5Le32yS+a4wawaOj3oJBnMxzeQKMXE8hjwHvd2SOUJYH95sSXwY8UA4tJd14MG5eS0UyTtHtPheSppCKuwuTqsh+R/9eGsbJmqPgiuJPOWEhwmEthe5NGp3z9JaiL+fcauhC9pCYsz8uGDr2eyIgJq2Mo05z+ng==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ehkTiCp/
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libosmium: add optional GDAL
 dependency
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

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/libosmium.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 753255556c..c39e7d0152 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -31,4 +31,8 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBOSMIUM_DEPENDENCIES += zlib
 endif
 
+ifeq ($(BR2_PACKAGE_GDAL),y)
+LIBOSMIUM_DEPENDENCIES += gdal
+endif
+
 $(eval $(cmake-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
