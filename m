Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13061C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 04:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F41340476;
	Wed,  3 May 2023 04:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F41340476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pzcazaiLZUh; Wed,  3 May 2023 04:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E17B64042D;
	Wed,  3 May 2023 04:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17B64042D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 752C31BF294
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 04:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BE418206B
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 04:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE418206B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEkbtdGjXd7J for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 04:45:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2623582050
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2623582050
 for <buildroot@buildroot.org>; Wed,  3 May 2023 04:45:37 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pu4Mv-0000xO-TN; Wed, 03 May 2023 07:45:34 +0300
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 07:45:32 +0300
Message-Id: <20230503044532.121962-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9F572AEF33F1BC58518F88292D2C242B6F1812EB9C1B2A14F182A05F5380850401E662C95B0D8BE761DAE0143CF56ADF46C6A02D438B2A7C532E3BF61BFF8FDB6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7952C4D7BD0BF3359EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BFD6B3F1638522B88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A29F433D32300B4324B94A2C6C2B34246F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FA18204E546F3947CD56D36E97F3F038CF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637CBDA538BD653CEDD389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC3A703B70628EAD7BE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BAEB924C2B054B06E75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5BA4A3E32CD720B50B63BAE67565DBA26192006C818DA97BCF87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA5889C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A091D471462564A2E19CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF8AB13FF1FD5C30DD32CC647FFBA6AD4EECFC0C03037AFF6DB534D45312541BED12B9ACBE231CC78A14EE98CD8E9D35FC19FF07873C3A9E76E1D09A988FCFB41BC897C70B1EFF344F
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojUsZxtR84vldoiADtF8SMzw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5FE0BDF2DF2418F34D4FE45735863EEF098CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=JOU0zye+1RI5CefksjPi0P94mYIwZSLPPFydCf7wgdk=; 
 t=1683089137;x=1683179137; 
 b=IVCO8guVwovhv2rmgKPyjcdK3g0/5eqGw6WtZcvlnVA02PwULY0e/I8i56noN/e4mTwSRJttjwJSE7IwCHYgVWBKtJ7LCt+VIcLLfIUeVBJ2yBeU/rpz5JbmSHu0tw9SC3pkqpxMOOsgdDBz+Zimf2Wv6NpkfwXtE1+Im+z65KeSKhK1F6NtFi7O1mgbWmleR8Y5BN7iKH5HWWZyUIiWFwnsEJ4BPmjGFCuvbNGSyayUsXRlq+ek/nUshVpqk26eGBgEOVRldpTlLZOZooYty3fDgIf5UDSvtAh6ACN7xjlrcT0Z5RY88Kj9rdRepM9sBIHpNzxtNywnBPesEZUb4g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=IVCO8guV
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.10.3
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

Release notes: https://github.com/timescale/timescaledb/blob/2.10.3/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index b05c7802c2..9ec92244a7 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6fca72a6ed0f6d32d2b3523951ede73dc5f9b0077b38450a029a5f411fdb8c73  timescaledb-2.10.1.tar.gz
+sha256  d3bd209ebe48f058fd3fa2aa0d6a74fbce2023d64dbb205e58e2c9ab62059cce  timescaledb-2.10.3.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index bcda07f893..cd02d8df50 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.10.1
+TIMESCALEDB_VERSION = 2.10.3
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
