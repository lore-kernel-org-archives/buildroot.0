Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8CFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 18:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C07360F24;
	Mon, 10 Oct 2022 18:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C07360F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZMC0s9SKJTx; Mon, 10 Oct 2022 18:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4899A60AEB;
	Mon, 10 Oct 2022 18:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4899A60AEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E19EB1BF3A3
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 18:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBE084170D
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 18:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE084170D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOzNjmz3H9hx for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 18:11:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F6834170A
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F6834170A
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 18:11:51 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hxFloQYOZJpY4hxFlo7Ny3; Mon, 10 Oct 2022 20:11:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 10 Oct 2022 20:11:48 +0200
Message-Id: <20221010181148.18858-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKV/WVqMHciZDVZWJqw5TYLt5/31I732W6LJKOptWhbAKHDcuVaDTIfvPJpDEmJI2zuKb1KthVRC/1Vx82WFDbySD8sZwjA7CYRG3NDQNuVRw0d4dmWZ
 zxmDMHmeB6j0Xk2K+uCbEN+4Mdr4lBQl9Tl7/9j+6QieShAhum9wAu2ikigHY6KKAnVzh+Xdr7MYVMAYjNxbCHtc4LCgBWkoRmjhNMPgJHediHdOuKiW6uCL
 2OAdceqdzc+yU6NmC1yJDMjdsDs4rsKyaQIMl74bNZRS2RkdWTd8AidS0ZFYuvzi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665425509; bh=IJxcpCo3fx+jvsnweCyhOq9353biqs+WRj00O+dAGj0=;
 h=From:To:Subject:Date:MIME-Version;
 b=CG/QAlAZQ7o21bOSbhh7dQiH1cM9YuZcfEOHU/fDYQJzH5zzRxdBOPgZHxbB76LO9
 hbcv+4fgsUcolIL/jwsxc51pkiscDuJYbspskKSTrrtOngLymMwCCOAKpf+rKdfFZk
 jU3Z2GhKiIKNLU2175bcY89I/b3+wNYw9wtuCSUusbiBCv0crLKXQ9bTnCrIfpY9Nu
 07Cq6u8MC/+uuRIy3EQ/LPKYDXaQQx3LVI8a8W+Zf9Kz12cLiiNzB7DDDEmDRNWmZ+
 O5sFbe37bhue+hkKZpSFcilZDE5t5o6Nb1/Gq86x0XvRffcL84KX+NYqQGikbPw5du
 tTnLJwnSxeoHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CG/QAlAZ
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 5.3.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 9ec5c63f55..3582de2f30 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05  harfbuzz-5.1.0.tar.xz
+sha256  a05e19e3f52da24ed071522f0fddf872157d7d25e869cfd156cd6f1e81c42152  harfbuzz-5.3.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 75d55106ea..8ef41d3952 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 5.1.0
+HARFBUZZ_VERSION = 5.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
