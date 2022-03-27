Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B406BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7218582AB6;
	Sun, 27 Mar 2022 15:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrhAOKv86tNx; Sun, 27 Mar 2022 15:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC6F82A56;
	Sun, 27 Mar 2022 15:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEB11BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358D140993
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YJrOGVr7jR1 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 666474099B
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1471C85D65; Sun, 27 Mar 2022 15:37:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:01:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53da16e3786cbf4c7637dacfddeef58c315cce66
X-Git-Newrev: 407c6e62996b7bfff475330a6ac28a96292b1d73
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.1471C85D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spidev_test: bump to version in
 Linux 5.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=407c6e62996b7bfff475330a6ac28a96292b1d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump to version in Linux 5.8 (depends on SPI_TX_OCTAL/SPI_RX_OCTAL
  available since Linux 5.0)

  Changelog (since 4.10):

  9006a7b3220e spi: spidev_test: add option to continuously transfer data
  35386dfd13b7 spi: spidev_test: Improve decoded text part of hex dump
  84a14ae8c44f treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 178
  020bd6c48ebd spi: spidev_test: Remove break after exit statement
  1f3c36328a48 spi: spidev_test: Check input_tx and input_file first after parse options
  470a072e1220 spi: spidev_test: Use perror() only if errno is not 0
  896fa735084e spi: spidev_test: Add support for Octal mode data transfers
  9ec8ade81224 spi: spidev_test: Use %u to format unsigned numbers
  bd2077915bfe spi: tools: Make default_tx/rx and input_tx static

- update Config.in help text

- indent hashes by 2 spaces

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/spidev_test/Config.in        | 4 ++--
 package/spidev_test/spidev_test.hash | 5 +++--
 package/spidev_test/spidev_test.mk   | 5 ++++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index aa57b5edbf..81386adf7a 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -9,8 +9,8 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  proper operation of 'spidev_test'.
 
 	  The version used is based on your toolchain headers version,
-	  if it's older than 3.15 then 3.0 is used, otherwise 4.10
-	  is used.
+	  if it's older than 3.15 then 3.0 is used, up to headers 4.20
+	  version 4.10 is used and otherwise version 5.8.
 	  This means you won't have quad-pumped SPI support if your
 	  toolchain is too old.
 
diff --git a/package/spidev_test/spidev_test.hash b/package/spidev_test/spidev_test.hash
index 7bc4a27e45..867920fc78 100644
--- a/package/spidev_test/spidev_test.hash
+++ b/package/spidev_test/spidev_test.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256 80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
-sha256 3cf76b15d9a8644f3f5cbc0387cc02a7d4a392ade39788cbc6367cce98552e2f  spidev_test.c?id=v4.10
+sha256  80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
+sha256  3cf76b15d9a8644f3f5cbc0387cc02a7d4a392ade39788cbc6367cce98552e2f  spidev_test.c?id=v4.10
+sha256  87329094ea3010eae9e65ad7ea2d2309e044845942414aa0ca8f1a7095b80178  spidev_test.c?id=v5.8
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index bd2fcf6db3..6c5a9495a4 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -10,7 +10,10 @@
 # If you need quad-pumped spi support you need to upgrade your toolchain.
 # Note that the location of spidev_test.c changes from v4.5 onwards.
 
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y)
+SPIDEV_TEST_VERSION = 5.8
+SPIDEV_TEST_PATH = tools/spi
+else ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
 SPIDEV_TEST_VERSION = 4.10
 SPIDEV_TEST_PATH = tools/spi
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
