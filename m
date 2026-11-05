Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C609606A33B
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iHyPwFbV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609C3817AC;
	Fri,  6 Nov 2026 16:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6MnNGr33ALd; Fri,  6 Nov 2026 16:09:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E339D816E5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981368;
	b=ijR3GYspxl5YPh5J2FjzEVNXwmfMzc9ECZ4W741p0SJz0Ae0e3NQsOdpt6BgJ0BMZc+r
	 h+BDOn72pwojphIxhpueZUziRirwGBDToN6f58TqJosgTCtIlYeU4GfXkCsk8ctztibD1
	 RSmfdVfk2rxVSAJF5fNDatK8fy7HJ+zimZcVH2i1TKH041SHPz+QOj/GHTGYkCnGrBIxx
	 1RQv9ZiajFKP8GyqxVXj1dMhn2V1CBo5BHjfX3j4vHYZsPxFAkgyxfts48IBXFYl45ndw
	 MycgLxQoHlDeh6cL71aURN1zQd9sGzGTcTwCXd8w8YgxuyB1jMgp+gtDh8LLRXGUREQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981368;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vEpuUIFrMBCoQv7mZ3A0IgyLXiWq34+3TQsGDOZPA5U=;
	b=rvvhQqs8B9kpRfT5Df1fbvDjzSe6zO73m8K1XJQaGBC5tfmiOmALQNLkuZAB9jBgCFsi
	 SJGcc74t5TEUIwXT4up+JdjbASTxeY4AYVVcyLleHOqbaMYscrHT9Qfbv/o2f7t1pffPW
	 mu+QMDxu36N7P3cgoKmY5woTD7Q980+U36zUdmeXnLbmvo/OD21NW1Gt4FtO4Rh7Z1ydi
	 BZdI9dTcYIf0928Z513I54VeoyqGxHEMswEJk39ltEUnGCX1Re92GsbWl8bIgsWLVMMaU
	 0+b2xYp/MzZU39vwLt6/t4Q9QP5+Sosr1WievQYIIt7lp76eIEY1+8cYLUDUtdJ/84w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981368;
	bh=vEpuUIFrMBCoQv7mZ3A0IgyLXiWq34+3TQsGDOZPA5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iHyPwFbVda4T0yHN2zGjoFtR61vdLMf/+CRIwPW4dVtV9APm5LLPmnHljRR6tWAzN
	 o8K6JNWKkh5QpBUIL/mC6uOgJU377tPBM8q3PGH3XFAMOzNEO9ws3dqO5hTWGPMcE8
	 TMaCih7ZbIwV/gDL2jf/9Fmoq29vB0GGTG3pcJKG0lz7zsxIJZTpYOFtq7B7eYeOU3
	 M2sx77L89AKeGXCMN95F/dllN08WdgUpCGk16+Hm8xnsNmVV5Qm5ibliHZ41hBLiWb
	 fntqhGihzkZOX1FwLCDo6t5vkn1c+2oRHl4GnwcuqYLaExBEdbMD2eLfSfQqkVOgCR
	 d0eKVMhRzchvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E339D816E5;
	Fri,  6 Nov 2026 16:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79CAD7AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C08681539
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgsqbwwNhQ5l for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A305081496
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A305081496
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD8369E0B0; Fri,  6 Nov 2026 16:07:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:59 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d8f295b7972bd077857f21565d305cb8bb554fba
X-Git-Newrev: 4f3ae18c6b56e83be34c50bdb009957884bc7f1c
X-Patchwork-Hint: ignore
Message-Id: <20261106160711.CD8369E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/webrtc-audio-processing: fix build with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0420180834173009984=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0420180834173009984==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f3ae18c6b56e83be34c50bdb009957884bc7f1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

webrtc/rtc_base/system/file_wrapper.h uses int64_t without including
<stdint.h>. With glibc it is defined anyway, as <stdlib.h>, included by
the C++ <string> header, includes <sys/types.h>, but not with musl:

  ../webrtc/rtc_base/system/file_wrapper.h:86:21: error: 'int64_t' has not been declared

Backport the upstream fix adding the missing include.

This was not noticed before, as webrtc-audio-processing selects
libabseil-cpp, which was not available on musl.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8bace47b057ee8bbd165b69c876af02c2d894dc0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0002-file_wrapper.h-Fix-build-with-GCC13.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch b/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch
new file mode 100644
index 0000000000..deecb8e3c6
--- /dev/null
+++ b/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch
@@ -0,0 +1,30 @@
+From 9a202fb8c218223d24dfbbe6130053c68111e97a Mon Sep 17 00:00:00 2001
+From: "L. E. Segovia" <amy@centricular.com>
+Date: Sat, 23 Mar 2024 16:34:50 -0300
+Subject: [PATCH] file_wrapper.h: Fix build with GCC13
+
+It is a missed instance of cdec109331de34958a892a1418d67806b171b862 (!31).
+
+Fixes #32
+
+Upstream: https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/commit/9a202fb8c218223d24dfbbe6130053c68111e97a
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ webrtc/rtc_base/system/file_wrapper.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/webrtc/rtc_base/system/file_wrapper.h b/webrtc/rtc_base/system/file_wrapper.h
+index 42c463c..bfd8fcd 100644
+--- a/webrtc/rtc_base/system/file_wrapper.h
++++ b/webrtc/rtc_base/system/file_wrapper.h
+@@ -13,6 +13,7 @@
+ 
+ #include <stddef.h>
+ #include <stdio.h>
++#include <stdint.h>
+ 
+ #include <string>
+ 
+-- 
+GitLab
+

--===============0420180834173009984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0420180834173009984==--
