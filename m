Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96368C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 19:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 220EF81FD1;
	Tue,  8 Aug 2023 19:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 220EF81FD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZscscoMP6fW; Tue,  8 Aug 2023 19:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F20C82077;
	Tue,  8 Aug 2023 19:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F20C82077
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BE4D1BF341
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64E1940129
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64E1940129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtwyUCq6PkQy for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:32:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79141401AD
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 19:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79141401AD
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A72B0A4C0F6B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:31:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54846)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTSQv-0003oO-1F
 for buildroot@buildroot.org; Tue, 08 Aug 2023 21:31:57 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 21:31:57 +0200
Message-Id: <20230808193157.2042920-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808193157.2042920-1-bernd@kuhls.net>
References: <20230808193157.2042920-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691523117;
 bh=Vi3NouOFG9MT0PmHgoxNOhKVRGIBxYb/fAJ+MeQiv1g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rxm6cgXQpMR2pYoejn9LuvhwaU19dL7lehtHqp9oLjZH+fejWkBjHf/zBkgWKh0Mh
 llT8Ju9UeslX4dqs5/fxZ2rmQ0CZC66Bg5XEhw86Hms5bAr3Y6NB8VxyUYheaUOTPN
 ZIs0jmoye+LqUIY/o7cHgVg2aMBE81v2rqMAyYm4+rBpy5QiQ86+tw2B4lbfE/4pu3
 20lyWlhfGUWrMFCeL5gD/wPQvE5yc2O7jFaGrJyYUzOHsjxbqCuqP74UAsjuZNOPkH
 0ujCZfQw2gRVeFU+7+pg4du3CqeFCrFoRUGRvwdL6UBE6PFA1a0d/8Gdy3UQW39S4W
 SfHxgH6afNrlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=rxm6cgXQ
Subject: [Buildroot] [PATCH 2/2] package/intel-microcode: security bump
 version to 20230808
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2022-40982:
https://downfall.page/
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00828.html
https://www.phoronix.com/news/Linux-Git-INCEPTION-DOWNFALL

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 3f12b71191..64c50dd6f7 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  58f3321dcf900175d87d5b39455138c2a24e69df4ba997fb44e3e0d19e531ad1  intel-microcode-20230512.tar.gz
+sha256  fe49bb719441f20335ed6004090ab38cdc374134d36d4f5d30be7ed93b820313  intel-microcode-20230808.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 48c6340af8..0a89d3a603 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20230512
+INTEL_MICROCODE_VERSION = 20230808
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
