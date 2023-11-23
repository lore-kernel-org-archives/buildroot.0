Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D94C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 05:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6A960BEA;
	Thu, 23 Nov 2023 05:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC6A960BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFmhd0slP4NR; Thu, 23 Nov 2023 05:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCA560BE5;
	Thu, 23 Nov 2023 05:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FCA560BE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A49571BF372
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 05:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B1EE8133E
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 05:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1EE8133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EN3tDXnrTzN for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 05:44:05 +0000 (UTC)
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CAAF812C1
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 05:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAAF812C1
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1r62VM-00080s-Ot; Thu, 23 Nov 2023 08:44:01 +0300
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 08:43:59 +0300
Message-Id: <20231123054359.101121-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9FEA8E122FE2215F5F9A7F26A9461D4801668790ACF3513421867C24CE74E72BB5FE18E9CBFBE7C071D31BAE2E2D3DFA4F8DD7D3BBC7DA0CA687CC1EE79FA633E750FC9643A608EC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73DF5CE93DF87A85BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D4360D888D8F9BE48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D801AC0D09B8BE5C70E6B009A11F37A1916F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC651D0093ABB73C3D389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC816F36C0CB6DCE122F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD181150BA43C84913FC3A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7358CCB3ED2A1DE2304C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5737005895227DBB4AF11AC6104B02C462765B54D4A146A92F87CCE6106E1FC07E67D4AC08A07B9B082B967D547A19D2F9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF72853B2D0DB1552DE1E86D751B82E15F4080885B99CEC16F24F08BD9A7080DDCA30287D0F4871F186E159192F517E671953BB49CA7DE898B72F64521593B714C40B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOz05VK5QHNrOXKdY6DL1YQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE330EFCDD86BCB7E743523F1216A83A017D98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=STGcPJbkT2GVw87kSartQtuBIJiQXKqGvttRhV99iLc=; 
 t=1700718244;x=1700808244; 
 b=kOi42l2eg197bAjCHHSDBxvV1i/3bCPdzpDmCg4YmG0mmhRtn///DurWurIu8V+C0OA+FOJYIddE0smgQM68ZQBMn11qgdPw/iaHrhwALCeOohhw6MhAxr+KgB7p4HK6CYULGF0dBB6J6TWcF0zuOI3BXl7RepfRGrx+xb37DRMsMdqqR2Pv2oL4GjY4aSBz+Uf0/nUgeEIR+zDsO4aU/IYPMRODcKpe16o908n2pjNRhASCGxvnU7EkQDvKy394ag8tPzY4SmusjXWjTh6XTPqjLjlpourmyHJVmk+h3nbHnsYCPvr+EchMEk7xqWXtqqe/xMNf5ZSPDtci2P5FGA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=kOi42l2e
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.12.1
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

Changelog: https://github.com/libgeos/geos/releases/tag/3.12.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index bb433117a5..37fe7d6d23 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39  geos-3.12.0.tar.bz2
+sha256  d6ea7e492224b51193e8244fe3ec17c4d44d0777f3c32ca4fb171140549a0d03  geos-3.12.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 70f8ca3495..491168324f 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.12.0
+LIBGEOS_VERSION = 3.12.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
