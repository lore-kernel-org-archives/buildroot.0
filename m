Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DCFC5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 06:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F2DA60BEC;
	Thu, 23 Nov 2023 06:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F2DA60BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hta_gavTaSKc; Thu, 23 Nov 2023 06:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D57560BE9;
	Thu, 23 Nov 2023 06:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D57560BE9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 543911BF852
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 06:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 380C7403A5
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 06:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 380C7403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojW-lkNETqcG for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 06:06:03 +0000 (UTC)
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86291400F3
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 06:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86291400F3
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1r62qe-00071D-Ud; Thu, 23 Nov 2023 09:06:01 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 09:05:58 +0300
Message-Id: <20231123060558.807373-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92D71B79D2A671AE6422F1D012930A708C4696DB667808124182A05F538085040E9D8260B6226CC25F2C9E5C87AA1E1EAB3A1594357092A078834F8369E1CA949
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E5D7EAC6EBA58433EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063750E64749F09C4ED58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A45CE8C229FCDB506A0CF12F7424B8B26F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7D9442B0B5983000E8941B15DA834481FA18204E546F3947CDB8A315C1FF4794D117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE719E4A684E2A1C1059FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637AC4ECE65C2AF15826D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F79006377870F476E0DB9443EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A57834E8FF57FD580CC2D3543366CB5FE5168BFE2458019D3DF87CCE6106E1FC07E67D4AC08A07B9B082B967D547A19D2F9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFCFD43D43D346B91824FB7F66621DD550A734C47AA8A0B7CD51E85FD4FDA8AEE2AFE07996864E0BE26E159192F517E67107816175DB434AC144311E9AF524CF5340B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOz05VK5QHNqxBhsvC+YM6Q==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3398B65E4C8D745B9B6917A9E5C612005598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=76PhyDPOM6orOxsuS/H3SEGWUvNWCBN8+u6bS/r4EOc=; 
 t=1700719563;x=1700809563; 
 b=miFLr/9ZWRVQG+mV+/uB9FGbhACu0wowY45A/j2NiEp/q6f57oZY4lZTWJNcLtr8dOeJdatZGvivZPmw0w8zxKa19Nbd3vKoRUwrZV2515kIKxGnjHPzB8DYIISNPnh5Gxq0tF+EEJ+Z5dApIWDnL5hqYr0d49/VzhSY2iwI5e78W5LKG9fG2uW5gEboo6KjNoNTvN0Q2AJjSqmiBzNWzSgw89v2GYRBHj+rDf6jpFzITTjvXu2Bod4O1z6kAnmpir6iH9JMNf4jzTPezKXGp19IU6E/u/EEVTDwbZeUW1tZBiF+/V4+/TxkSPdHetam+3XMMeasKc1sCpB06t6A8g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=miFLr/9Z
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.12.2
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

Release notes: https://github.com/timescale/timescaledb/blob/2.12.2/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 0f2269986e..ae1d3db1e1 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acca5f6ec5684722374eece92f73d7763bd171075074fd2e6bd0244bda9fbc25  timescaledb-2.11.2.tar.gz
+sha256  d24cd29aad411d3e41d543d1a30827c48f8e01a48563650db5fac145ad7a01eb  timescaledb-2.12.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index fe7bcbc36e..adae1c2bae 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.11.2
+TIMESCALEDB_VERSION = 2.12.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
