Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6339606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rCZDR0/N
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8411C60623;
	Sun,  1 Nov 2026 21:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMglRwgCBYHL; Sun,  1 Nov 2026 21:29:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87D106060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793568543;
	b=hD0m3WBH2ZVDpoNMnz/0ewOc24BDL9dfjC2ItqpYXD5Tfpm2nHG5nHkovz+XDVc7jmbf
	 7G1coFRxT8Y8AptvldI5H+jRHAtZ6riQb7LQ0+ufEbXjdPlpksExfTqOU3v3ZhxcGkMyK
	 fNmAcVFXCAXm0Blc8scdVzzzXQMSJ94chNPtpJ9SJDoqKBzeJbS2lOnawmzGimi0w/huD
	 orTotTsAsT/ahgh7eolemNgnT8z/tzqUIWK6q6hfYdgd0gbbyTAPW9NR39o8VCNVd3X41
	 MMEKheRqNYXN7vgJpmtcX7RLoWFS4QUGI96jZ3xKlAHHVA29TV/JLStmXIlb4IW1TAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793568543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/Yk1/spPcwtqvZyzHxKKYUJ908dhuJHwdE3qzW5/lWw=;
	b=F5bkosHnYtG9S6Smwt9jaSB/Uxr9bEY4Lyo4yDfIpZbOc271I3qaFHBxHdrxvf1n8Byz
	 bNHoqLHvoC+1RalHWHfQM4JCAf/JAprwGyEbTVnrXFoH80K/ZIqjskMCmUbu4W9fqdLH1
	 d1KoOh1+sO64gliKP/FLJctmZ05KH3g1yDu5QQtcsiKHkwc17siMujfnZG5CR/GsSQm7e
	 AoxXLxJPPbze/7uk3hGdXXDIlx08sKz97dP+gXDBAH6TsnldnHdi1iASYZwFvB707sEG9
	 ht+6eoEiU+d10/WPYI5Fi4QKoC9Z4VaMVpyTATQH9yqZE5lui5o6RxWFN+c2Vsg+dCg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793568543;
	bh=/Yk1/spPcwtqvZyzHxKKYUJ908dhuJHwdE3qzW5/lWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rCZDR0/NL51mKwFZrNL81dNBBi9K46FfpwdukQVXCfAfIpo2s4rO7Jw+1jLfklEmj
	 UsHW0CCEWQvvnM7r09B691vIt9sVl6TTkzBj6S1oZxXplNBltNZBAzA4qLYC9+IUen
	 wP3YqnHoOEJnobsOzSOrNbA0jgmt/llAPgnMkMtN98Z7f/S/+FtzvtwlOae93HkKVu
	 LAXG6HHR76qBL3c6DPs5lJVTlg2YwMRfACgForgs82WuWtJriCvVGN7z06X+qcnqCa
	 TFQRG8GRpTFSV5aGV9XB7J9rhe5hzqCW0JzF6zrmIGzwt9SzzaUTYmlVu2BMn8/p20
	 Gdt5dYc1JWB7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D106060D;
	Sun,  1 Nov 2026 21:29:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DE28356
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6416240042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tAM244tM0Xz for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C3CE24004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793568537;
 b=JFLCmCd4f+0O5160dMJexBcoo9kg628uOHnJi5uOyA3u5/yCDedX6BTq9QY9qaHVDm+N
 ncE8bPUcqwijOYqWJ2vqCur8hJHqtPnT4D7Wk82U04p+kXI3q7W/sJaN4HvavSnqe4lsd
 ignT36AeQpvPYxjHNu6Jq+wOWGG+XLEamnILYD6Ufeh10N+I7bydhYeWMt0bTGQGRZnjY
 CF6/hMSt2MOs8ra3ywWnzA/wqYVFJEcmLKxcdPh5hROuGWvHNp4MaeT+QrWeEXzZ4YoVR
 LihyyGS8wI69/lE8GZFSfsTLP+yteb4MboAm32RLhQhKxRek72g5t1tVOlfpjX+XMow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793568537;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uEMTAvs8V08ZtSmBTDVDH1SzDRhRcwYgp6bd9b+GWf0=;
 b=dPRgbsP5Sfp6LeXHTk8KUiRm8aMYf+VFswbnCjSKV/LEBMMVOIg2JXrmA7uT+ot95dSb
 F0A2iE4VpTn7fP9IyzChkQMhD7Oft9Eu/H6GZ4DZoKuVJ1jR8Zs4LGcVZv/7IhKZJ6iru
 4yto67a4uOfW5QyBYr69/dBbv4nwMjqUCNqrnyrw4dWIYhrXdnR3DAv7RpyQCoXOM2K3Z
 AdJEIWzrKk85qr7TJlfgBJFZvkBw0+qnakUt7xdzrhCUR2ECDrRzrE/pGAQ47IQ3uhoBV
 dA+0k6pybjOnIUnf03f7qPMmIOF61uyxBoI5uM27AbLJOrsSQfd3cmOE5DdHVKDz8GQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3CE24004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52E449D598; Sun,  1 Nov 2026 21:27:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 22:26:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16f3674cc7b29c1a24e89ad74aa4a95ca7991335
X-Git-Newrev: 8bace47b057ee8bbd165b69c876af02c2d894dc0
X-Patchwork-Hint: ignore
Message-Id: <20261101212728.52E449D598@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webrtc-audio-processing: fix build
 with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8bace47b057ee8bbd165b69c876af02c2d894dc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

webrtc/rtc_base/system/file_wrapper.h uses int64_t without including
<stdint.h>. With glibc it is defined anyway, as <stdlib.h>, included by
the C++ <string> header, includes <sys/types.h>, but not with musl:

  ../webrtc/rtc_base/system/file_wrapper.h:86:21: error: 'int64_t' has not been declared

Backport the upstream fix adding the missing include.

This was not noticed before, as webrtc-audio-processing selects
libabseil-cpp, which was not available on musl.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
