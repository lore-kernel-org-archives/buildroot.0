Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F33C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 12:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FA0860DC6;
	Sun,  2 Oct 2022 12:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FA0860DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7Af4z_ow34F; Sun,  2 Oct 2022 12:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB6160D4C;
	Sun,  2 Oct 2022 12:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB6160D4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 213CC1BF3FD
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 12:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D0E1410C4
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 12:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D0E1410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_xOugLvubSy for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 12:00:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52B62410CA
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52B62410CA
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 12:00:07 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E320935208CE; Sun,  2 Oct 2022 13:59:59 +0200 (CEST)
Date: Sun, 2 Oct 2022 13:59:59 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Yzl9Px/Bf4JbONsy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-18-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1664712002; bh=m/yqmzDeQL6qr18zlxo7psplldZcw7OTwPMEF2Rj/qE=;
 h=Date:From:To:Subject:From;
 b=RPd+QYh1TbeErQBs2JpqTLW5dxAr7VLzdbFoPDDuhI9ajOGoPShw1NL8XSopN/8Ud
 cXr4Qx4tdGxCBZijlLCGDHCuMGxKJMdKqBlLA7dkF99YbiO+XPeBIH85a2AoV76OPi
 vrg8/rINN8+66Z9d4wtevx8ZkrBfTq7+js+xjLukGyMLWt/Pp52GiAARxmOS0ECRR4
 +mH5bZev+NGchtF8YaKVZK9475tXB4KBShbAWVpK0vuLVbIqpHA6XXtI7o19vG9AtH
 jiRHqQ7lpQX6TKI9rUCyKbdZuDmsWHd4SSkGazLsddGSqe0/EDXAHm4q8V0oW5Uu+V
 4olhcx2Z6d3tQ==
Subject: [Buildroot] [PATCH] package/uclibc-ng-test: update to latest git
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

Fixes a musl autobuild compile error, see
http://autobuild.buildroot.net/results/3cbd6f8007d1b5276b91e9f1688402f86b1f2049/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index 37660b04c3..4028bada4c 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f731307c0547ce4bbd3f5025972f64e9b22208a147e34e5745000b54d4d3aa98  uclibc-ng-test-0844445e7358eb10e716155b55b0fb23e88d644a-br1.tar.gz
+sha256  655c9d9732cf24d8230defac7ef4d6bd92ad05c070ab02fe99c1fb47c7a40039  uclibc-ng-test-6790eafe897b3a8c19a2caf50a5ecccf06647adf-br1.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 6a658b4293..a678bcf7f0 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 0844445e7358eb10e716155b55b0fb23e88d644a
+UCLIBC_NG_TEST_VERSION = 6790eafe897b3a8c19a2caf50a5ecccf06647adf
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
