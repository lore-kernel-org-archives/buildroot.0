Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC54606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SN+2oJ9o
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1DE81326;
	Fri,  6 Nov 2026 15:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjGTPQY4Bcre; Fri,  6 Nov 2026 15:59:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5D9C812F6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980759;
	b=i3J/4AfM075sGWB8i0qceh5DmAihtvcpnFqOpcRNgKUX1g2zWG+8qomZbXsQEaGDR5s/
	 bEWPzGS+XGC320Z6VwIp3wcs1u8nr/pufffXDjcBpn6SKf9jrvTXTfpkns7ywqmUifnJM
	 66wA28bv3THDDQYXFeXwKP/FKL2KFCMHk3J+V8lGcDfSs0fQ0+rWWRGpv9idMoGBMmIJa
	 89GdHNefcCgKULiEp+nLAUoK3s0CsaZnYZIrl5Mnntuv1sZ6I26VwrwegDeYtjfqr4+ur
	 aoCoHY3SFTQ5gnU1PcGVUaYkFXFt/rwHueY4AMwrbdDhzV6yvWU0z8jyYaoXXyuKY/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=HIojg9q5Ty3DwXVOTAtp9S/g4rGK+Ls7zS4SfpPi8o0=;
	b=aCpfEw/EzsK1Y8eII68YbdolDltZe8pOMfSRiAbErGpcTz2D7kPMDunjM9IUfPnikurs
	 e2wG3ZToDIHaRy1XisyJb1Hm6tGCi/KJgLM5SScPy1vHEXAG/5+GvQ9LxTkp1jpZVIn1t
	 +/c8RfSvy8TsSmIi5vn1Z2SKI+vftGZUXyTCErNguGARY+wKqWFDtXnLjadWFLPldt9A7
	 Gqqy0OSSiEjiDKeyiNuPB9tYKSmj52Go6grMiDp/05CuXSUJZf/l2QiBdYVkAsrCWoFVj
	 oGVtl1UWGizRG5NpcfDKDuNx4JnGLAa2/E3cepeVeQLZy2+Ab+JmLZngNcuLL12Dyew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980759;
	bh=HIojg9q5Ty3DwXVOTAtp9S/g4rGK+Ls7zS4SfpPi8o0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SN+2oJ9oG198hhjFBCk1ywAVZGImnjClgpCCOx6vDn2s40cRnQuZw5GtZid7WJBXv
	 EAnogbTiwup91nXOwXwJzbD5gus2ug6qd88smkppGBM/UhvUWbhu4OVvq9h5i+uVM0
	 +OZC2DMEPcn5qZ9uepDAu+WiQh8zzaxe/Gf4c+a7KZwLfVJf5lldRAm7zvANr0DApW
	 yXUUS2JD+XUajPEQXdgV9oxTcBVtNjdrG59Rs/visi5NTQzFNccCs56abU1xm9riNN
	 pNhYQmYSphr1xvvuVbbQLJTEiid+VegsNWPMy0h+OE9MNYGZ7cnekdspTmnso5b8aP
	 96txEErEd1hmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D9C812F6;
	Fri,  6 Nov 2026 15:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF3607AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93370403D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cy_VTy8n9rdG for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E9B21400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B21400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DF4C9E09B; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cff54b0884819ba0a81977e6d94e6ab43f56e7f7
X-Git-Newrev: 3113e844bd35bf36ffbfafd4ec7836826fc51ec7
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.2DF4C9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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
Content-Type: multipart/mixed; boundary="===============7279714511944640351=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7279714511944640351==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3113e844bd35bf36ffbfafd4ec7836826fc51ec7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============7279714511944640351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7279714511944640351==--
