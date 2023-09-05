Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA4CA0FE9
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 06:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876A260BD8;
	Tue,  5 Sep 2023 06:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876A260BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXIxUtR31M-5; Tue,  5 Sep 2023 06:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA73960B8E;
	Tue,  5 Sep 2023 06:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA73960B8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3ADB01BF2FC
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 06:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 128C960B8E
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 06:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 128C960B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCu_QN5-wI3M for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 06:46:14 +0000 (UTC)
Received: from fallback17.i.mail.ru (fallback17.i.mail.ru [79.137.243.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68FD9607AA
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 06:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68FD9607AA
Received: from [10.161.100.15] (port=39294 helo=smtpng3.i.mail.ru)
 by fallback17.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qdPpC-00FiaR-SQ
 for buildroot@buildroot.org; Tue, 05 Sep 2023 09:46:12 +0300
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qdPp0-0007zw-1S; Tue, 05 Sep 2023 09:45:58 +0300
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 09:45:54 +0300
Message-Id: <20230905064554.806567-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD96E142CFC92DB15CD9A78593717343123184EC05241EE6705182A05F538085040EF25D5F3DACA2033EDBEC2530FB759AE177F4FAA55082F19EEAB49D2546D7731
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7818460412E3A2163EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376A27C8034CCD05E58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8357F9C4A0202EE27F752BF8BF1955F806F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ECE82AE7387CF2AD9FA2833FD35BB23D9E625A9149C048EE437C869540D2AB0FC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B0FC4FCDDD36A1EE6A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C799A55B1B7C3DAF143847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5188836100457A14034D2D4609EE721B0DBA333413C0F5145F87CCE6106E1FC07E67D4AC08A07B9B00A6B3CD6EB70C818C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFA0D09628D6C5B399B66F78FB0DBA7D15DC5E42BD77D0B14ECB1BB97D69250E8AF49F51687F14C9B8EA61C66FA002EE272583A319EC24221CD307A2418DBFF2EB40B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNmsqR+t6vc/bvDXBhyrKlg==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986BEF9ABBCBFDA0C801D82C81E0F05BBB7998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4595E58BBE635E2438CA7AFB115AC397BCF2B8A0AEC87D279049FFFDB7839CE9E038EA0FC93E567CEEFEBFF664D5D6D51666EBE864F20A467035340D867230088
X-7FA49CB5: 0D63561A33F958A5DC8AA0C138C9F4B70A346E136A47ADBE2E5787169BB75216CACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdOBAj5ZHPYJ0pxNsotxvd3A==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=LXNvfB+m5SJQHcWR0wmXxLAW2/knAVPfIvs+Mi2WpYo=; 
 t=1693896374;x=1693986374; 
 b=YS2/FcufnWGBiqaThmca1get/gSpYgjESHlBGEoeunGbGjYc/jfgiBlGH2GEbMOwxRFIIwYWF80JP7VB+iF2MQvdLvi1zeWdd7XnPgtBg9OHhLgtIxXnCSeVW5hNMXGf9FPe64b7fRdmEY+y8m8VhKJ0F6wps5c7Df8hFKU4VkgjqiVDRoT0PKqHvHDv3s4vA6SBnBU1aUy3lYCYiwWDXPu2XkdgrW6K5LXuWhrzPhwKD2yiqPhR3jJEEcW9Ft0LxrhStoEf7wjIg9sUIjdO5r5PDd9uvEJZ2wqN//csmUDYF5R7qTZk+ZqKl8k8MBnUQkV6ulydjqkA/IbkKM0RDQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=LXNvfB+m5SJQHcWR0wmXxLAW2/knAVPfIvs+Mi2WpYo=; 
 t=1693896370;x=1693986370; 
 b=TCAr12pDNvjGQ41B5G7cb5INhIiokNiF37neIzqjiKhdWxdsypd1h3hiRc5G5+kLIe4nPYBidqmDoszn5CwWEbE1NI1mDpzTZ2KcVBBddkn9dA8Aomdh9343kVQ8Sgx51w94Pr8pHHSMH3NwBm/tS7SmIR36MgHVXZB2eUVMH5FK2VsXk0foUp/Zfx++1NW/B+IxEQP98Tbz5KGe07H2DHb4ipEiGpJJNHS5VCU+cVbGXJazXlWsLE3RUommivW/v3MuQtrphuOuxnjbO9JIepYbA6qVqgXuYqO1EJf/atg1FIs9kH3ddXTjIt1W9oyk3BM4Lwa9aifVjvQptucjvA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=YS2/Fcuf; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=TCAr12pD
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.11.2
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

Release notes: https://github.com/timescale/timescaledb/blob/2.11.2/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index aa8b3ac497..0f2269986e 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  06a653881dd2460a9c9007dd823be8827ef83fae90a4b628d0b0d5066f60f496  timescaledb-2.11.1.tar.gz
+sha256  acca5f6ec5684722374eece92f73d7763bd171075074fd2e6bd0244bda9fbc25  timescaledb-2.11.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index a32641e09d..fe7bcbc36e 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.11.1
+TIMESCALEDB_VERSION = 2.11.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
