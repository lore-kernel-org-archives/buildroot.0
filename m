Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97167C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B1EE4047D;
	Fri,  3 Nov 2023 20:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1EE4047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzSmNnYSphmY; Fri,  3 Nov 2023 20:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0305F40484;
	Fri,  3 Nov 2023 20:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0305F40484
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99E1C1BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73ECC60B78
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73ECC60B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3DBGvxtVFWQS for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:14:19 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78F7E60B77
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78F7E60B77
Received: from fli4l.lan.fli4l (p54a1b8f0.dip0.t-ipconnect.de [84.161.184.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50C92A4C062F
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 21:14:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50034)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qz0Yb-0007yS-0H
 for buildroot@buildroot.org; Fri, 03 Nov 2023 21:14:17 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 21:14:17 +0100
Message-Id: <20231103201417.81191-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699042457;
 bh=zTUjQ24WbM8RlSOChO5Fqi7TtOqCldijfTvWRU3Zfjg=;
 h=From:To:Subject:Date:From;
 b=mXRCFgjhL0+DdxVt31AyhhJsZrQr8QP3WVvlAovAdh8dyabZUazsEyo1j2rg90XtF
 JaPI1y84oGmcVoaHz3nX+3JaLicADKKiZulGb2VmPqRKftRFwdCj2EZKIcCNskqV/0
 hTEwJJwYkxoZ5wiXyivbJvngY2Ss4zYwD2qUXy0z0AhSgLQsS8JnVzlSY4EbH+TNDM
 zeun7xq6TRx96bnzOcHAYC+e+4yQZ/X2ffll2por7AxrXFHAo47VSBOrnnQvgIywzp
 /HzM97fnXFbCgTmtsDeLYqne2e9fgaHztkRZyDN6vPwQ2+FaK0UTCc41iSvAGFvWhZ
 5ZIdfA5ZuMMZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mXRCFgjh
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1,
 5}.x series
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
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 7b56d19cb5..9159f7294a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0  linux-6.6.tar.xz
-sha256  c6662f64713f56bf30e009c32eac15536fad5fd1c02e8a3daf62a0dc2f058fd5  linux-6.5.9.tar.xz
-sha256  58520e7ae5a6af254ddf7ddbfc42e4373b0d36c67d467f6e35a3bd1672f5fb0a  linux-6.1.60.tar.xz
+sha256  a15f498604adf8f6ac842f1733a694083f23e578b48c8e97d94b6d8968e55a8b  linux-6.5.10.tar.xz
+sha256  ad2c9d12fc36e2dde4796a3eec8f4ddca2e278098f4e555b6e6f5f03ef6964ce  linux-6.1.61.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  9749b21609f9e7ad9c46160c2c107db823b99cef77fa6cb080b6c2dc685fb2f7  linux-5.15.137.tar.xz
 sha256  a0ea77a1f5eeb1387d62e7a8df585ffc53758e4da153d98224ccd833bd2624c1  linux-5.10.199.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 74d445ff27..236f6f5d62 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -417,8 +417,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.259"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.199"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.60"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.9"		if BR2_KERNEL_HEADERS_6_5
+	default "6.1.61"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.10"	if BR2_KERNEL_HEADERS_6_5
 	default "6.6"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
