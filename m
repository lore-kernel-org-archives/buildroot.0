Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7377EC71157
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 08:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4640B816FF;
	Sat, 21 Jun 2025 08:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGdd1wRLV45X; Sat, 21 Jun 2025 08:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A36B81A1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A36B81A1C;
	Sat, 21 Jun 2025 08:41:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18327154
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 08:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F25C3606B8
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 08:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG93jhAH0Dmg for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 08:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E889A606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E889A606AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E889A606AA
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 08:40:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1619A4C2BF6
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 10:40:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47132)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uStmE-000000002Ts-3W5Y
 for buildroot@buildroot.org; Sat, 21 Jun 2025 08:40:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Jun 2025 10:40:41 +0200
Message-Id: <20250621084042.376001-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250621084042.376001-1-bernd@kuhls.net>
References: <20250621084042.376001-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750495242;
 bh=Unu5I6A1TyfxdnCmrel4Fw0JtH4w4bZsPyz2jCXztiY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dVGS7vArZ5o+/9GzW4ylEFxfw6ShMv1GkRYAxqv02+LHCn+dMAx+QiMahDaUXmjEk
 25I8QE92QgNJ19/tmXNm6vNVQphBnRAyaTtFcBm95wjiIXIKjBzIwbNGPh/C583qhz
 q6WSnCAO/NMZwP1AcEydztdOivhG6cJ1rmC9q56RL3tZSxpT9a/hODDFH1l0bpa79D
 F2bmlg7o//ztOa9pjlzXOdMILCdfieFJzZR+QgUUqE4iPiZWmw5aPaE73dfJbO3urh
 QVIf9Rab0tO838ueLTSV3gSCZya9B/Ts0Xvkyzu+YIPUyOlHKssJff5sQc703CUhdp
 TAtf4sagqWeBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=dVGS7vAr
Subject: [Buildroot] [PATCH 2/3] package/ntp: fix build with gcc-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Fixes:
https://autobuild.buildroot.org/results/114/114a81f216b44a00c5de830e21315df68a62987d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ntp/0006-stime.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/ntp/0006-stime.patch

diff --git a/package/ntp/0006-stime.patch b/package/ntp/0006-stime.patch
new file mode 100644
index 0000000000..7707231cf8
--- /dev/null
+++ b/package/ntp/0006-stime.patch
@@ -0,0 +1,21 @@
+Fix stime build error with gcc-14:
+
+machines.c: In function 'ntp_set_tod':
+machines.c:484:28: error: passing argument 1 of 'stime' from incompatible pointer type [-Wincompatible-pointer-types]
+  484 |                 rc = stime(&tp); /* lie as bad as SysVR4 */
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=3981#c2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/libntp/machines.c	2025-05-26 18:21:43 +0000
++++ a/libntp/machines.c	2025-05-26 18:21:43 +0000
+@@ -478,7 +478,7 @@ 
+ #endif /* HAVE_SETTIMEOFDAY */
+ #ifdef HAVE_STIME
+ 	if (rc && (SET_TOD_STIME == tod || !tod)) {
+-		long tp = tvp->tv_sec;
++		time_t tp = tvp->tv_sec;
+ 
+ 		errno = 0;
+ 		rc = stime(&tp); /* lie as bad as SysVR4 */
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
