Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402DFC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C976140E;
	Wed,  5 Apr 2023 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C976140E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PPELNhihjeY; Wed,  5 Apr 2023 20:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BCB661051;
	Wed,  5 Apr 2023 20:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCB661051
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFD21BF2E5
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48561417BB
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48561417BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DW6XF6ZFwiob for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:22:03 +0000 (UTC)
X-Greylist: delayed 00:07:39 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 497EB417B1
Received: from mxd-1-a65.seznam.cz (mxd-1-a65.seznam.cz
 [IPv6:2a02:598:128:8a00::1000:a65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 497EB417B1
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:22:03 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-546bf4d7d6-hd7dr
 (smtpc-mxd-546bf4d7d6-hd7dr [2a02:598:128:8a00::1000:a65])
 id 63fb93bed5db2ce563fc2dc9; Wed, 05 Apr 2023 22:22:01 +0200 (CEST)
Received: from x230.suse.cz (mail.ms-free.net [185.147.46.46])
 by smtpd-relay-54787d77c7-x9wpm (smtpd/2.0.9) with ESMTPA
 id 65acae74-0345-4f90-ba8c-11463b576986;
 Wed, 05 Apr 2023 22:21:53 +0200
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 22:21:49 +0200
Message-Id: <20230405202149.1411245-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1680726121;
 bh=+lNbyoaSHFPIVBl62NqiLOvZRVpfKxngUaaQSwcCmok=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=dMIfk2ZPMs4TtuA+r1yOEUXp8Q52HlnHfe9gv495lqtSzi6hkKILmYqsvboinOjXP
 8TkcHeivsaGB4bAyrkQ9F6qap9NJ1vZxyW6ERCyi8UPW1UacNWAFOtP6sTyC49d4xM
 DmDRRXkQhwgmFFFLQzPDG8toXN6GjokOcRq4O0wBPxSIYvagZE29mwbsPsPv0Hk51l
 lD1ENR4R2RYnyBrcofaXVWzAXpweMMeNvnq20ioH54n1feYCW0l/WW3koU3e3JemTm
 QA8lPJw6UucMMxqlDeH3CIg2tSrYw9BWGP67fy1ey36/oJFXEZkjAcgB0BL7XG+IMV
 W6oRjGgrs56rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=dMIfk2ZP
Subject: [Buildroot] [PATCH 1/1] ima-evm-utils: bump version to 1.5
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

From: Petr Vorel <petr.vorel@gmail.com>

Project primary git repository moved to github.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ima-evm-utils/ima-evm-utils.hash | 5 ++---
 package/ima-evm-utils/ima-evm-utils.mk   | 5 +++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 56d830e54c..9777c7f213 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,4 +1,3 @@
-# sha1 from sourceforge, sha256 locally computed
-sha1  f23d8a406759a469b0223b0bfb302ada4407a1d1  ima-evm-utils-1.4.tar.gz
-sha256  fcf85b31d6292051b3679e5f17ffa7f89b6898957aad0f59aa4e9878884b27d1  ima-evm-utils-1.4.tar.gz
+# https://github.com/mimizohar/ima-evm-utils/releases/download/v1.5/ima-evm-utils-1.5.tar.gz.sha256
+sha256  45f1caa3ad59ec59a1d6a74ea5df38c413488cd952ab62d98cf893c15e6f246d  ima-evm-utils-1.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 01984402ce..fc20df0441 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.4
-IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
+IMA_EVM_UTILS_VERSION = 1.5
+IMA_EVM_UTILS_SOURCE = ima-evm-utils-$(IMA_EVM_UTILS_VERSION).tar.gz
+IMA_EVM_UTILS_SITE = https://github.com/mimizohar/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
 IMA_EVM_UTILS_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
