Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357B1EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 05:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83BB040AA3;
	Fri, 14 Jul 2023 05:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83BB040AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHjCJZQcgQVA; Fri, 14 Jul 2023 05:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2572401E1;
	Fri, 14 Jul 2023 05:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2572401E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF091BF384
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 05:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 703844208B
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 05:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703844208B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSNpzo8aqTDh for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 05:02:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C7D84207B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C7D84207B
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 05:02:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF4A8A4C00C8
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 07:02:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34020)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKAx9-00065f-21
 for buildroot@buildroot.org; Fri, 14 Jul 2023 07:02:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 07:02:51 +0200
Message-Id: <20230714050251.3063758-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689310971;
 bh=9dak+dkfJW00yuDc9mOfLuLde2h/jfTbhJyRrOwLkGQ=;
 h=From:To:Subject:Date:From;
 b=Ki5iXRROwNc5aNqsfE045yiEA5iGXexmgL4prsrLu101X6R2PcAWuZ4fBvs+jMEs+
 fMWFWjFTY6l0miiT4Vv+h06fDHTlnKmhTbg7HAADHH5gA3FVps5sYZ121ndjeCDUbC
 If7Idtw4q3kAnVUarRZWzwWsz6K9CfVLroLa4R8udmxGRRYbBYbwSyUT1ERaHhdSMA
 t6gNHej2ln+SQYnJIljPW4UBJVibkr8NVKXB303mWaAX9Rklo0gOxS6D5+244TtrhB
 F0nP9IIfqo+KuAWWImMXpM7kwcQ1gIcusUB2dGaQQr6nRO7XGpDDUv5a/dNs73V36l
 KU7wEHIIjQ6rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Ki5iXRRO
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{3,
 4}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 17bf808cdc..cd0a6a38f6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a4542b94b6..c8e72d31a8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a326ab224176c5b17c73c9ccad85f32e49b6e4e764861d57595727b7ef10062c  linux-6.4.2.tar.xz
-sha256  cb7fdefc207dd4e8ef947fccd687126425edce0138ca11191bc0590c678e6cd7  linux-6.3.12.tar.xz
+sha256  7134ed29360df6f37a26410630283f0592c91a6d2178a9648226d30ddf8c88a1  linux-6.4.3.tar.xz
+sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
 sha256  f9a4f91b609f7d332a5f2be01ab86336fa00149fae6bdc19f16fa19f78802d43  linux-6.1.38.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1944d47e4e..d886a4659b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -410,8 +410,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.38"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.12"	if BR2_KERNEL_HEADERS_6_3
-	default "6.4.2"		if BR2_KERNEL_HEADERS_6_4
+	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
+	default "6.4.3"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
