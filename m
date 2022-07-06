Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE0BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 06:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575C181384;
	Wed,  6 Jul 2022 06:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 575C181384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uigiGhygE3zy; Wed,  6 Jul 2022 06:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6403481353;
	Wed,  6 Jul 2022 06:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6403481353
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6531BF36E
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 06:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E09040194
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 06:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E09040194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4N7bMfu1VoVT for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 06:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 940C8400AB
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 06:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940C8400AB
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1AA1F826D9; Wed,  6 Jul 2022 06:39:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 08:51:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dedc1b71d90b56d98ee56f36f69f81cf23f18d5f
X-Git-Newrev: f414afe53d5f050cf42173d7870791013a958919
X-Patchwork-Hint: ignore
Message-Id: <20220706063929.1AA1F826D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.4.224
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f414afe53d5f050cf42173d7870791013a958919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires the host-zstd package.

The hash of README.md changed due to changes unrelated to the license
terms:

-- `sudo apt-get install libusb-1.0-0-dev libbz2-dev pkg-config cmake libssl-dev g++`
+- `sudo apt-get install libusb-1.0-0-dev libbz2-dev libzstd-dev pkg-config cmake libssl-dev g++`

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 245c38879c..7291f93c52 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  a9b8b74e32e6718d591c66951b8b52276df7862db80ee943e046947f7313e57f  uuu_source-1.4.193.tar.gz
+sha256  b8b7fcd0e8eca64a255bf2b964bfb39a97599670e5258858421b27ff86aac80f  uuu_source-1.4.224.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  77b90738ae98b7958d34d9f96caf2671210a133427f8f6b784914b54f406c29b  README.md
+sha256  52b1828ddb508a180cf9ad159b61e655c72dfb25ffce67eb0aef761d38a4398f  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 9bf9ff123b..647254446f 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.193
+UUU_VERSION = 1.4.224
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb
+HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd
 
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
