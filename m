Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AEBC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092AD608FB
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 092AD608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFBD3400EA;
	Sat, 24 Jul 2021 20:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQheVmsBc1Gd; Sat, 24 Jul 2021 20:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 211104017B;
	Sat, 24 Jul 2021 20:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22DEC1BF966
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 128DC605D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFvBQA7xPIsL for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E18605C0
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AC63788938; Sat, 24 Jul 2021 19:34:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:08:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b763852031bb29f53b3895e78db062291be44fa
X-Git-Newrev: 968782ab3c440de006f1a4e555b30cb23df29361
X-Patchwork-Hint: ignore
Message-Id: <20210724193419.AC63788938@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: needs gcc >= 4.9
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=968782ab3c440de006f1a4e555b30cb23df29361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bluez-alsa needs C11/stdatomic.h since bump to version 3.1.0 in commit
c4041c230c18d3a9d82bfc6a96b2ceaabddbc94b and
https://github.com/Arkq/bluez-alsa/commit/04d904326ae77e2919bcfa56245cb7adbc19278a

Fixes:
 - http://autobuild.buildroot.org/results/a8cd389796bbc8488e5b5aea995d1cef4c581e8d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 2f103f409c..a31d125d9d 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BLUEZ_ALSA
 	bool "bluez-alsa"
 	depends on !BR2_STATIC_LIBS # bluez5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5
@@ -33,8 +34,9 @@ config BR2_PACKAGE_BLUEZ_ALSA_RFCOMM
 
 endif
 
-comment "bluez-alsa needs a toolchain w/ wchar, NPTL, headers >= 3.4, dynamic library"
+comment "bluez-alsa needs a toolchain w/ wchar, NPTL, headers >= 3.4, dynamic library, gcc >= 4.9"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
