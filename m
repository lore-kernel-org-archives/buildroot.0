Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D701C54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 06:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC25583F46;
	Mon, 19 Sep 2022 06:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC25583F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id btAz7R1ie9vh; Mon, 19 Sep 2022 06:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1833183F2A;
	Mon, 19 Sep 2022 06:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1833183F2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CA451BF393
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 06:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 681B04031D
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 06:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681B04031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeRtPrm6_F49 for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 06:26:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE6C4014C
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BE6C4014C
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 06:26:04 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1oaAEE-0002IL-ED; Mon, 19 Sep 2022 09:26:02 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 09:26:00 +0300
Message-Id: <20220919062600.1095747-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9EBD81B01C038F8F3599E352275EC4F4D0235BE3157CE1562182A05F538085040085EF4680E65A7443102E1527734EABFC1DB24297561CE71BE0C255E2E72CB0C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73AA63C5F29446501EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373768BF035B57E5168638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B300AD43AA09B688F8CE5E624A2F7A116F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74601F13E4625331C9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FBDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEC1C9C6CFAD2A0F5A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C747589E6AAA3516243847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5BA121F24FC5A8CFC0E7E65F06B2D3BF1CAD91A466A1DEF99B6ED91DBE5ABE359A3485EE9140A7D39DC234C8B12C006B74574CD456CC796227EEE6CD5146EDC4CF9DCFFE6BCFCE4822B1881A6453793CE9C32612AADDFBE061501E677427FAD4073D58D961240FA4EF6DABF04D5057A81F1E618B5D5F965AFDAC4ECE65C2AF158215E2725BA614EAEA1EF972C1F679AE1C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34987A0E8D235BB534C93E81B9AE79D5B4025A310F33B0E8C79F6345CECA08006E718D9624FF564F3F1D7E09C32AA3244C745BB15A4CD4DC43D958876D92952484725D5B54B2FE4575729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYCidGuNEkb43NKNAn1P/0A==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284EDF5E34F01FC811B28C75B8BAE3B119B498CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=IW4gfM54leiayLptPWAsI9WCYuQTEQSSuSBfqC0oKgo=; 
 t=1663568765;x=1663658765; 
 b=SfH2qW80lDSDjMd96a/tLnOOli8kgIEDuzsG03WEHH7eRMCaDEuAWlGzOSsfFeK+v3Bl4pG6do+cNXZEN7s8Wfp60HH+Y/giI4p50zHzt49CvLrvW7dKuRb13pTDd/uoOL/FwHssbyLrM6Vj6EjBi0hW7q6haKtPGJhZv4ify+Ptt4tiLfJBCEGRl4T1V9hIQgL3OkloCan20SAiEghL2/HelkWLei39vtqqMLflPwuvOf+V9Y3kEoAiH9n2aDxrQvoeu43JHqMouXM4m4IED1sqcFmxSkwjbGvjykpkNku7b1p0mLcgO0SAJr2u+2kTxeURJ/YesPtLY5BoJYkb7A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=SfH2qW80
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.8.0
 Release notes: https://github.com/timescale/timescaledb/releases/tag/2.8.0
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

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 281e30dd3a..8b43d92219 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05560e0c37f702a377957adf96d8893c1ff437a8b4fd1478f351e40ba9730897  timescaledb-2.7.2.tar.gz
+sha256  a3403447805bb97f8b6f38dfdc9dde24c24e4389cf7f2348358774605ad2687e  timescaledb-2.8.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 0268712399..00fb7d9842 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.7.2
+TIMESCALEDB_VERSION = 2.8.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
