Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF45C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 00:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F0C4155A;
	Tue, 28 Jun 2022 00:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F0C4155A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtx1d2UHCI-T; Tue, 28 Jun 2022 00:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487864154A;
	Tue, 28 Jun 2022 00:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 487864154A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFC141BF2FF
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 00:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A5E34025F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 00:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A5E34025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHOb0OHvRJpi for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 00:15:00 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB062400D6
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB062400D6
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 00:14:59 +0000 (UTC)
Received: from localhost.localdomain ([151.36.180.201])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5yllofpMjAaN95ylmog1UB; Tue, 28 Jun 2022 02:07:54 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 02:07:52 +0200
Message-Id: <20220628000752.378643-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA3pQH2Nn1bTgJIGj4+DxcEPmM7OAoZ1PGR2d9roTKiMRHUVMyY6uv9X5Ah01ImA2g30yLNyNgjkk/kxuvqkE3ntN9a3v5p//TKUxsoDlvCDcfH6lH7j
 3UO96sr4l+MPIWYsL0t1qB6mS5hJyHD1ErqzB/XZ+KKduDY8+9eXHkFmfy3+UNk2zbxJ3Imhl8POwloN/BZkHDtx4pRmNys4jyWChweQ4ByVqztcYn6Ctge4
 Boi4eWEP7w4tWmxEX0g3xssesT+uNloW6qsqPkK4cByFJS90S4uCrOpiR0gNTRXr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1656374874; bh=uQGrlMe0ZamBvseG2Eh2RgQQwJL7/m5xnww5+CAiHm0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Kh/nZhgyXngi0n3k1jUFJA1X9Edeur9oVPGlwtYiuaYPb2W2JPNjBfPQ6V58E+Gp6
 uDW74EeShjOwTjSpO+/JwmjptIr8r1yjENC09dm3vWoo1mUc//eAuNR3QE2SR1mI6w
 O4zL8YLIMmZKtxvRzQWImge1YzNibIe4CYy0ORW6rGWgBBOCVbH6BX+20CSqSWXGd0
 Dul8QZKHOjF+zTn0c+APbe/bNmDdVfXUxDWF2o4QOVOMkyTmRaWcqxyfVmPglunKUO
 0plqOAHb+GkukqfTS0bAaZ6CqdCl8CuHFXVHlVu1yodGvA8sOA2J0b62rJrpgslPvd
 jqm96Ar6mVoMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Kh/nZhgy
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 4.4.0
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
index 29ef89719d..66743326a0 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a49628f4c4c8e6d8df95ef44935a93446cf2e46366915b0e3ca30df21fffb530  harfbuzz-4.3.0.tar.xz
+sha256  02035eddb9d84112834abd1654ce0e177d14f41fd8ce0c29d5b4376888890790  harfbuzz-4.4.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 8abce91537..e74657234c 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 4.3.0
+HARFBUZZ_VERSION = 4.4.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
