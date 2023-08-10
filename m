Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9127C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58EAC40B4D;
	Thu, 10 Aug 2023 05:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58EAC40B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NfixcaHIbjF; Thu, 10 Aug 2023 05:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B202408D0;
	Thu, 10 Aug 2023 05:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B202408D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACA6F1BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8840540232
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8840540232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDW0DLMoCX5j for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:44:46 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B425D40087
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B425D40087
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 62757352BD86; Thu, 10 Aug 2023 07:44:40 +0200 (CEST)
Date: Thu, 10 Aug 2023 07:44:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNR5SCVmNIOQ6YdI@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691646281; bh=TqiKzBsbHzKj7SjDCFsHbkW2o4N9JSWSWNCV5UGcoHI=;
 h=Date:From:To:Subject:From;
 b=EePW465z6I4zeNS2H0fVpwDBOwm9zFfGVou051YZmkOxpTQgHV1ETyRSdiTRrIB+N
 wqH2W2BGi5Dx3/x/jL8aiDXQLN6efQNiJg9iTDTr1yo41FoCloMBwS/YDVQTZwiCrw
 Q4CsWmfeVzxeLFwPAAQJWvqWpqzRmGHnQeYm3XYLsalaTTa7lFg4tGffbpWGSk62uE
 6NuPIeWci8gC4tfRCKQexubt5p5VuC9Ov2rB/uTU3XN3daW0VBhN05XB4F8LRmIAZb
 3nO/aJgdcv9MK9t0YdGX6m/GfVOl+mQjvgnTCFswFpC4B5THGcDaew37/ceo0S89FD
 LFQhAfxUhhSJg==
Subject: [Buildroot] [PATCH/next] package/uclibc-ng-test: update to latest
 git
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

- update to latest git version
- switch to https url for better access for users behind a proxy

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index 4028bada4c..c4db6ebf83 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  655c9d9732cf24d8230defac7ef4d6bd92ad05c070ab02fe99c1fb47c7a40039  uclibc-ng-test-6790eafe897b3a8c19a2caf50a5ecccf06647adf-br1.tar.gz
+sha256  f261229c43c026e39178aca48f4f3caacd0bbe373ccd06d27954e7a5fa768fe8  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-br1.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index a678bcf7f0..7d62401244 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 6790eafe897b3a8c19a2caf50a5ecccf06647adf
-UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
+UCLIBC_NG_TEST_VERSION = 0f303c63fab7f4038515ced6f2659242cf60ac19
+UCLIBC_NG_TEST_SITE = https://git.uclibc-ng.org/git/uclibc-ng-test.git
+UCLIBC_NG_TEST_SITE_METHOD = git
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
