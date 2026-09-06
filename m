Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D03C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD8780E72;
	Sun,  6 Sep 2026 12:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyUNV_E2daJ7; Sun,  6 Sep 2026 12:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8160480E7A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697135;
	b=MDGRXowQ0nFRAIthstdFDmjSl8vgfaEwFVBXRtwama0fxaxoKW4AIyQedeEpTgTG2bIx
	 3X/Kk49B8/CxFa2sflaVsqNtR02AnTr5+K3SoJm/D+8FMuqA+GLRfG2PYN6/CU3Fqp7lG
	 CeNARF8my7gMVMnJtOAR98a7C7VwEGxmXy6OUHoJvatA7F4VlnVH8TTzOe8KXWP5d0H5I
	 lU0bIjrBwZpZSuettGgUb+38eXhXtiafpHp6cCVZ31zr8uyoDcHtPvGwgnG2AszqCkHXF
	 vt6XYnaVhHvArPJvTUv/2Sq99BW1Vq12yz+TXDx0EMOg5UiekWh/55lrOQC8XY11fjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tvUxT87PFFHdNn1nZ5VRNAttWUJPJic0bIXgz9Y9IhQ=;
	b=PlyJYHGgjPlULLIVeWmbFLhF/oOoYxnsX5sM4r7IYsb7Kmxnco1//g1zf3OjspFnF9UC
	 WRXyhzQ+MOiWoN3Wj7tXhw78C7qIgGWy+DHR5JIPBuOA8hI8ZGsLtfRggNSi3VONkAvXC
	 q78L8q7r2G8Gl320pOeNCiSjb9pL/s6axorkiObSjXL2SOJ8pirsPsDvB52wYZ1GoLyU1
	 68NNQejjdl43u+JnjZ8a6tSTwMyufPn/9KkW5DQfJ+1XwTevoneMQLY7CM1aXK/lMzpwG
	 l4Iilk+pBli0GKGSsoYD99HNfOJWRrUkK4T8D1dBNjeZGrNJexyATyw8PjMFyvXJKwg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697135;
	bh=tvUxT87PFFHdNn1nZ5VRNAttWUJPJic0bIXgz9Y9IhQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FHmXsVDFTKpF+2wCSUsZTwXOEB3ih1I208iaiAiLbwq6jL4j/ZfrKPFdrBhBSKnAc
	 P/7igaaLr6gIONqWvByuxH0CPsnBMzlUUN0hTCAN9n8Z+QEOpNwsRa0+t1l/kaTDKT
	 XSvShXc5bDqOP6UWm3nogLsNzmTig+G/DSgGjykhI7J8DnJ/e+d9FfttbTsTa8pSXP
	 Umz8pokGkcTGqxP8QJtJibF9djzVIYe549BN4Co/ZuEy6fOJnODem98ytgk8HvseOT
	 Yuc8WYIU0/i3xtY8Weuzt7EAE/IEF+HmI0oz38d4FP0TIyu+AYi6owZYNa6K7NjOGQ
	 BO0hG98PL7QSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8160480E7A;
	Sun,  6 Sep 2026 12:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69CAB3AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50A8F40068
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noGusv81uZsE for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F14AD4000B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697128;
 b=DslTREiCcLR+LdlNYye4G121jw+NmZx9NSGDc8Rm2RRWWWxzcDCNWrs005oLXDVWZS9j
 RrMFHP+xOdTY8GBTXvfrckaIKm9K5l5+I191YmE8l6kPhVjvb05ZMC+FnUoUGkQ0jF99Z
 1Miv+2P+O8BOoo0mFpsvsEpW+2gtMW7bksmYl4vGPKxrnj5BT27mJq3LfkWvHoF/oo54a
 Kug3id8LjoGvML/dtTLEuNCKZAvPnkH0/zYLNPXB9fJzmvflrLRokJ4P2rHirv+OUxvTI
 hURq/Gfq4yPX/9ys5d4E3+I8eRFbDCPHrc0hlSwB8zYZE3EOZh+egD3AliuXGgMzo5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697128;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QoBFRKPl7/AwVbOXySQ5uHDTMhvWT9EhjGFIpGZGF5I=;
 b=ZTIvj/S22RgRGLSCyStgnA84PX3zA17hVb7gquGY147sNYbwphgE9ZSVEmPrDpNMrAdy
 ti8zae9qUXIc+Fnl/g4+eQmVb5h1isOlIK9FngdZhgnDvigXzeLCGjtNtI/i06b0/Wvuo
 Twl0moHFtoeLM7FkpZAM/mhfWgmfHn7KZfjX1kvOKdfytSEJq57DGODIFNNuLlu/dCTJ0
 KDW+t3Art5ITy0eyVcieyHJ/rbDkVque9Qx9TyuUGYKyHeMN+H0PzkU0dBrUXSKT8u5lN
 1vXxaD8CVm/NMipS9a9GDZlVrV/sgiz8Tlgrk9RJP5iK8X+IpyPdO13TvZNRQQZ/Kog==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F14AD4000B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84C7095355; Sun,  6 Sep 2026 12:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 13:56:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e2c62319303f14a5cd835a2b1f21083dc536878
X-Git-Newrev: f7e943bf42224dafb4d8e28f49de63f31a42ac80
X-Patchwork-Hint: ignore
Message-Id: <20260906121746.84C7095355@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 7.1.x option
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7e943bf42224dafb4d8e28f49de63f31a42ac80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 7.1.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/7.1.13         | 1 -
 package/linux-headers/Config.in.host | 5 -----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6975f1f15f..e4824231fc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_KERNEL_HEADERS_7_1
+	bool "kernel headers version 7.1.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 7.1.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_WESTON_SCREENSHARE
 	bool "weston screenshare option removed"
 	select BR2_LEGACY
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3aecea4fad..f362bced0d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
-sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ae826f33111fea6f1d279dde7299d7463c8dfd204aeb75a8fb5432bc60a28191  linux-6.18.49.tar.xz
diff --git a/package/linux-headers/7.1.13 b/package/linux-headers/7.1.13
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/7.1.13
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 365fe11931..2ba298090f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_7_1
-	bool "Linux 7.1.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
-
 config BR2_KERNEL_HEADERS_7_2
 	bool "Linux 7.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
@@ -486,7 +482,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
