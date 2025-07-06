Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFE6C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 06:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1727881F6B;
	Sun,  6 Jul 2025 06:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JGNwE9EQq6I; Sun,  6 Jul 2025 06:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 554C581F73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 554C581F73;
	Sun,  6 Jul 2025 06:44:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AA3F19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CBC840227
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFv-IYYFHS9z for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 06:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77BD440205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77BD440205
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77BD440205
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:44:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CECAA4C3AE1
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 08:44:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49540)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYJ6m-000000008SG-46nc
 for buildroot@buildroot.org; Sun, 06 Jul 2025 06:44:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Jul 2025 08:44:15 +0200
Message-Id: <20250706064416.276504-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250706064416.276504-1-bernd@kuhls.net>
References: <20250706064416.276504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751784257;
 bh=Unu5I6A1TyfxdnCmrel4Fw0JtH4w4bZsPyz2jCXztiY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=0dnpJKFjLQi7z30x+yKt7UPPCHMYbH5lrRxzIMHNkq6oDjWCTn4JOnGHKmvhJ/b3H
 nRFwxMHwslAcWMcy/XuWj/Rvt05OZ9mMmiAP/5RKG3oqIats8Ctz4ELiAH67wG/c75
 vakw4suQ3bpP3oAwWFJrCizieDuXsAlIt8JoDFVs/sp+r8LSgRgF8aE6o7t4NiwDzQ
 F53bvIvVtV50M3iaRKGG1/Poo2bXvwUjg9T38IzU0hjX1aOVD772lX51xf15dZrGtT
 3BQ2vTr4NS5BoRxpUFHTvS5kAE9TLCJRbRUaBEXXoIsagvhop6x7avwW6CD4HX+pst
 fSOMZSU5JD7Rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=0dnpJKFj
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
