Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B49C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 17:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A3481DE7;
	Sun, 14 Jan 2024 17:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A3481DE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjGbKfo1LSw5; Sun, 14 Jan 2024 17:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D23381D5C;
	Sun, 14 Jan 2024 17:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D23381D5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC9721BF316
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95DAC60ABD
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95DAC60ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2Iai5jvKwne for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 17:48:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5686E60AB2
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 17:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5686E60AB2
Received: from fli4l.lan.fli4l (p5b3a01c2.dip0.t-ipconnect.de [91.58.1.194])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F334A4C018D
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 18:48:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42764)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rP4au-000000003DZ-03Gx
 for buildroot@buildroot.org; Sun, 14 Jan 2024 18:48:24 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 18:48:22 +0100
Message-Id: <20240114174823.2732695-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705254504;
 bh=qYofA3EvE3OrgFS87L2N/RdKTozgi2dmoJc1TKCsMBg=;
 h=From:To:Subject:Date:From;
 b=yLQryXdKQNF4BjU78f7DvU/Z0bvq0dstIBqwnqBIwzyVvx8tFrZf4s0ZE6/ybH1sE
 uIHqi2qecJQpUGnQMIH5i7GDpIQAn9jrKngwfdotYMO8q9DKeojCAGWkFUFCz+0i2R
 jslAGsV5KK00LpKQprIDCYwoghYUbYxuWhGSmV1IXMtJG3xR1MhpVB63GBhbRoVdQ0
 0qeKh2EeSONtDyoRUfYPjvEeVcPHxn1DHRc7p76Hu+3VYHbHGzu17h+pUQicg3aNZD
 jwXnaDox3Iu/PQ8o7aertoI52Z6uA8rPZ3agf+SnkgCkJ9wVHUT3WIXoDjWzslzKWH
 XIniEOLUpyL4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=yLQryXdK
Subject: [Buildroot] [PATCH 1/2] package/kodi: needs host-cmake >= 3.26
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

Fixes build error on Debian bookworm with

$ cmake --version
cmake version 3.25.1

-- Found Python3: /home/buildroot/br2/output/per-package/kodi/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/python3.11
 (found suitable exact version "3.11.6") found components: Development Development.Module Development.Embed
-- Could NOT find Python3 (missing: Interpreter)
    Reason given by package:
        Interpreter: Cannot run the interpreter
        "/home/buildroot/br2/output/per-package/kodi/host/x86_64-buildroot-linux-gnu/sysroot/usr/bin/python3"

CMake Error at cmake/scripts/common/Macros.cmake:432 (message):
  PYTHON enabled but not found
Call Stack (most recent call first):
  CMakeLists.txt:214 (core_optional_dep)

-- Configuring incomplete, errors occurred!

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6b68e6d504..181db55571 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -66,7 +66,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON3_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
-	select BR2_HOST_CMAKE_AT_LEAST_3_24
+	select BR2_HOST_CMAKE_AT_LEAST_3_26
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
