Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB621E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C8A283D4A;
	Sat, 30 Sep 2023 07:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C8A283D4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fndexmdv7KWC; Sat, 30 Sep 2023 07:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9920583D97;
	Sat, 30 Sep 2023 07:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9920583D97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB27B1BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3E4F82EAD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E4F82EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4R9PuiJD4k58 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:54:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90ABE83D4A
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90ABE83D4A
Received: by mail.gandi.net (Postfix) with ESMTPA id 7E3AD40003;
 Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 09:54:23 +0200
Message-ID: <20230930075426.513345-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
References: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696060474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x73NG967EuKq8uB3v64JCbwufOxPW8pmWsJRSW7INMM=;
 b=Us0IpdICcMhVkEREM87qXycDydC4QTt2BSMp3RgM+UQTw59oZS6MNEzI8zsDfksKgEvArd
 yX094w9DDT/w8H8OliPri1Tl6LpsGQIM2QyeEKE84mE07ZyFKFU8VBpg3g/JVpzMv0vb5E
 S8smzZNEE1YPiHa1uGBFCzwNn9i80Q9a7Xc9A4EyOV39ILjPKx352owI5h1T09yaVmVXbQ
 KogB8zj0jlZTMyjW3Ai7FyZpybC3neF4GGaehcWa9359K3RN3E/na+wnV6yHMnX9mvrGbE
 0LfjycZLQfjcZFDOTK9soI+VKCxq6ChBW0gYj5MnR05PUf9XCI5kd+oWqMXAmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Us0IpdIC
Subject: [Buildroot] [PATCH v2 7/7] package/gcc: add license information
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Henri Roosen <henri.roosen@ginzinger.com>,
 Stefan Mayrhofer <stefan.mayrhofer@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the licensing information for the host-gcc-initial,
host-gcc-final and gcc-final packages.

For host-gcc-initial and host-gcc-final, instead of duplicating the
information, we use common variables coming from gcc.mk.

Of course for the target gcc-final, we use a different license than
for host-gcc-final, as it's the whole point of this series: be able to
describe that the target side of gcc is GPL-3.0 with linking
exception.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 4 ++++
 package/gcc/gcc-initial/gcc-initial.mk | 2 ++
 package/gcc/gcc.hash                   | 7 +++++++
 package/gcc/gcc.mk                     | 3 +++
 4 files changed, 16 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index bd18d9ea71..11104167af 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -7,6 +7,10 @@
 GCC_FINAL_VERSION = $(GCC_VERSION)
 GCC_FINAL_SITE = $(GCC_SITE)
 GCC_FINAL_SOURCE = $(GCC_SOURCE)
+GCC_FINAL_LICENSE = GPL-3.0-with-GCC-exception
+GCC_FINAL_LICENSE_FILES = COPYING.RUNTIME
+HOST_GCC_FINAL_LICENSE = $(HOST_GCC_LICENSE)
+HOST_GCC_FINAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
 GCC_FINAL_DEPENDENCIES = host-gcc-final
 GCC_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index a8ac20c5d8..1f8b76a942 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -7,6 +7,8 @@
 GCC_INITIAL_VERSION = $(GCC_VERSION)
 GCC_INITIAL_SITE = $(GCC_SITE)
 GCC_INITIAL_SOURCE = $(GCC_SOURCE)
+HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
+HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
 # We do not have a 'gcc' package per-se; we only have two incarnations,
 # gcc-initial and gcc-final. gcc-initial is just an internal step that
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index d5f8135ff6..478b0b1620 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -13,3 +13,10 @@ sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b7
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b5bc15963f..4a3b780618 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -18,6 +18,9 @@ GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
 endif
 
+HOST_GCC_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
+HOST_GCC_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
+
 #
 # Xtensa special hook
 #
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
