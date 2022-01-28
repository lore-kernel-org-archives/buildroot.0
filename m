Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D40C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 11:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DAD60B0E;
	Fri, 28 Jan 2022 11:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wy198FeHLtFy; Fri, 28 Jan 2022 11:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADB460AF1;
	Fri, 28 Jan 2022 11:05:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0DC41BF338
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CDCC401CC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaRGLLqyCjFR for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 11:05:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0539940167
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:05:47 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DP4anjjgTc6LXDP4cnuiLj; Fri, 28 Jan 2022 12:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643367946; bh=0Vdnzm0JeS238e5aEiAiBWeGsD5I5TjYCf5wei042WM=;
 h=From:To:Subject:Date:MIME-Version;
 b=iw9W3LB+aXV8vEqHTq+FafBRPDGtDkL0Xo/jReU8BljFRNSP2prWbKO0O+76cLkzR
 JLH1syylsSURrjn5BFOaDgQ51DC8jb299hV+r0pZjaKPWTaYo6Wsa3cRlx1x8zIu/0
 zKsXgXkE8DA41EnaCItxNavNsnep5aUUwNqg5x2ym8l/iK2xhaOjVrR2UhvGIVbIRs
 34jB1RQIrhmFSVz/jKrqcGyS+W3ss6MnXwUUZJOM6gVqc7zm7m0T5fmTZOqukzrEyr
 WlpaMbwugfTDgRU9w3/8HB//Zys2c2DE1EKB3h0UIojAubsYAo3LfAZYK3Mxy8hJEa
 TJTI5dHt5aEEw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 12:05:41 +0100
Message-Id: <20220128110542.1101197-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
References: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPjVGYSujVgPPbDQrgVzdxD2IPUDYZr3P1YFH8zAx5hS0iS0JU8VdTawB5cJNofezdHDdw3cODKHtpoA3UqP9mUViux2Mkun0Gp3xXIOEbVztTf62KLY
 ZAdnucxeuRlHdr56eMl+j/+IMcGj0vQbe4eITe+zrbVPN6Z/qf7GyF/40639Gu7u+l9i2xD9aVfJsnIhFeqZu+bLv2kIWFlCVbRFkQg6XxJMTBYKiSSEq3qN
 1S+LlomipzyuooMuXHCUjRJsBAvvk6nOPUjQI3+oJkapxOI1vy94BbZRrryTnkttgvk5TssnMpmxOF0Mg4td+YCZG+jovg4pjPpL6drxGsU6E/LSM3SmCZSL
 JxvWXODZ
Subject: [Buildroot] [PATCH] package/libcamera: fix missing comment for
 binutils-bug-27597
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libcamera/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 23a0040abf..88db054975 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -92,7 +92,7 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7, not binutils bug 27597"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
