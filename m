Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E305C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 06:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA4E560BEC;
	Thu, 23 Nov 2023 06:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA4E560BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LknMER1hbMdj; Thu, 23 Nov 2023 06:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B3260BE9;
	Thu, 23 Nov 2023 06:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B3260BE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F4881BF30D
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 06:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57BAB408C2
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 06:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57BAB408C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUvCdReqrEuj for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 06:00:35 +0000 (UTC)
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC038408BD
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 06:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC038408BD
Received: from [10.161.55.49] (port=55536 helo=smtpng1.i.mail.ru)
 by fallback24.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1r62lM-006Whm-5v
 for buildroot@buildroot.org; Thu, 23 Nov 2023 09:00:32 +0300
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1r62lB-0005Wz-5G; Thu, 23 Nov 2023 09:00:21 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 09:00:19 +0300
Message-Id: <20231123060019.692266-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD92D71B79D2A671AE628886E7395E1296DC5DACA20BBF2B5A3182A05F53808504068F3F0CCDB0573CCEFCA4B7C91DB0C7FEE88B9BF053EB397F5B47C3DA8CEE83C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE700B5EAEB6F2DE1BDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637822A0A225AD602F38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BF29E0D3E21DA2643ED5DA536337298D6F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC1F3D1E7C87716A07A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735200AC5B80A05675ACDF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD183FC91FA280E0CE3D3A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7356436AE5DD6441DC7C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5036C7C95110BB00C9D9C82A8DD278C0026D784B25250CAC6F87CCE6106E1FC07E67D4AC08A07B9B08ED1AC82D843A2BB9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF166C1CB131EF91B5B54278F3FA7E285F809661EF2A4E2E2A57FBC566CDCA07A06141934554CE5B5F6E159192F517E671A2A049BE2211D98969454A2CF80EEBFF40B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOz05VK5QHNr357NzXMfk4A==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3395B1BFE441AA6DD4DF8D7FF7884E030D98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4C412E14AEF4742E1D915F33BAFA678CC5A0CB2ECDC47A2F3049FFFDB7839CE9ED0BF507E2923FF652A246DCE680F800C6808389669B0E5E3BD42FCAAF3DF0AB9
X-7FA49CB5: 0D63561A33F958A54856D38A89B08D109EA29997779A0D08ED309EE051B55BC0CACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdjNtV51DQSTBiXKO3WECGRA==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=izDqlmM4w0O0sDSRMj0dbMkFw4/Gvr9RBrnODmMG0aw=; 
 t=1700719235;x=1700809235; 
 b=Dbti3y61jMHl6VZDZW66pRmAHhnd4R/nzN3/m8bKTi6hGtyHVx/caIo8E21m5JQhJxAkVtzevfj7/0To6AjXxGtKAoYqUi2kUdydB6K7PbaKSqHowHVk0t9AYr1Qrdv1+CoaOIiiBWKj7PTqndt44NHEwilDUrupqbXVfL9d1ajldy0e13gjYWV09RFqNlIHVTCtm9+O0qWaxCRqeUN0J2cctZ75ndcAKrBofXoOhbF98RVY2l34dbHpez65Q++p837uieYr7Ur5byTj8u6nATrCc3s67HFVjKLeJ6bCwyJWLlEdghP1kQ6h/r7fMQaaAQr1kQ2CacV8vH6kNKFwUQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=izDqlmM4w0O0sDSRMj0dbMkFw4/Gvr9RBrnODmMG0aw=; 
 t=1700719232;x=1700809232; 
 b=D3w+lWysDILZrWbKo/ulTfG9XlQ6xIwQTQ6kR/WuJeSPWcrJwR7bs8D3LtUTvkCaXHUEBEzPatMb9ftj8SJOPwjkURo17KS/QrHiuZs8dCxEKIZTC8O+2vMD+U6a/fnEBMmWnZjs4PkyFAF5PZpKJv5QnW93QOTzIFNj0YBOduymqygrVV40R6Nh5ZaJsc8clC6mXdKQKXiFcevV+k5VQ0ow0XgQOddgEnMt/m+G1bbi+uCFPqJfWkH7EjS4QykbuPhHcavRolA4d3XN/85/Ra/nPr48rFSnPLqDkj/mJpM3T0tmrZUMF5/ASN+SA+Gn1D7sd7NaN/dfxVDupC7mLQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Dbti3y61; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=D3w+lWys
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.10.0
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

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.10.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 0b4eb17c99..a93ceb6a7f 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc30a3ad9a27f944e4169be9a8e07ee09711901536ddc8fcf4a292bd3aec51d9  osm2pgsql-1.9.2.tar.gz
+sha256  33849d8edacbca5ab5492fed32ac954de14f92ab6b3028c03ef88bb7ab596d20  osm2pgsql-1.10.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 44c980ac95..1565c2142c 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.9.2
+OSM2PGSQL_VERSION = 1.10.0
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
