Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD1606A32F
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SoD4mw6n
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82295605E0;
	Mon,  2 Nov 2026 22:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KaFdLJZSi8N; Mon,  2 Nov 2026 22:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 79520605E8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793657270;
	b=Lv07vvtSccw0iQ/FIhnb+v4Wlgaq3o6haf3z23DGStXmnNZbcixMD8149zSP+p9ekiUj
	 Y7t8L9jDhp83U9fzE8GZJX1cueo/KumwG8d8vaYlEqfNVuCOFD3LeXkt32Bil/g58W1nW
	 vmKxQZkf0OAFCrvCOUi6sH0p1Yv5MAppJoh7bNnbbcKdj6YaqfplvArGDBqzriZZDk359
	 hih9zajD8Un1xhGrafXLpxFXJacOF2p6YuNxFrDTt+zk5C83BLjVBohrvAKe2/BXl6TF7
	 KPQZYPA7QjhslAddjjQMi28LoRVe01B0h583SOyEn56nh1DYPhwXcofr6T4HXKa8YlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793657270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oPksP+Pn51UIeAgb4OC7pOwoCpYDEkpkBQvEmkx8skg=;
	b=sx4D4lpltRcS4UfrrZQDr+TKUnzVYrR0oLUM6feMSYYGLJKepI4DyUX+cnXWBfHZW7+w
	 dpYwN82dbrBk1ktHvgKIbRTzwK31Mpjbw0HW9YcpMipIq+ABHiM4p8TCQavgHBGfb/7J1
	 fexfF4VYNoTl7wrZOOhi01+zj8VSprVKrWAMrG3WPS1wjxgjaor6ATpYeXCBviT5YPso8
	 3YrwB8ioyw/0GCeg0d8gfyyyEYaQz7UR59DxW+7BkKtKQjSPr8bLA+5LyQQ1q0ICnPaLe
	 9mBiyDSnqLqjsd3UrS+qVzOoLg6NfFV+bNCIGhE8cDJIDQ/J9GMclC5i2cHSZ4sh2pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793657270;
	bh=oPksP+Pn51UIeAgb4OC7pOwoCpYDEkpkBQvEmkx8skg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SoD4mw6nV37VyQS+PGWC4BWxnjqw9eLEv1rCwD0jGunL+1zN0+Ur5jr6yxz25Tq9b
	 r38I3WHB8G5Ltsc0rcvZSBaEWyBvEljJjY15G7J+JPG/vk5JwOYkTD94hvGaZTtrJv
	 fyyGXd0orlOISvTYci3uDnim+0MjdOhkSMa5DqPC+F5eRKGpA8MPpmj1tIvKCSUV1R
	 h8NzzoAyM1+yXdxFPfCKuhq60d/AWcrCS55NqV6NdpFzF4Vci+HSxMQrhzr6HIMatN
	 J/gqEsynW95H3/OTQL9Xjm+k21+utnsKMdFSzpagMoSz7+LjZ80m+99Z1+7vLQdvDy
	 O5DdnIe2isHCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79520605E8;
	Mon,  2 Nov 2026 22:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 251142AC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E1F400BE
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjYi4rD2V0Q8 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 22:07:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D100E40098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793657266;
 b=gbJMd9uLoNvNXvLCiAACQUYy7sfDdJ1O8Z1pxpEqElF23WoIIjrz/mrWojNt976BzhoO
 S5NfJLdBSUHgOdN/ztqWlw3mxLOLr+Ev6sKJIDZdL3Coh+wiuAYNJ0U1u8kzuJIbHO8L+
 w6RSgGOsODm7q+whldt2cqZpJ/D9xvVGoQnq4otPj3JjYfM6Phgzd3Sf9eX8JICGH04nR
 VjEupAxSHKd7wY85m67t3sqeuvNPl41l6cBQhUqe7l8inFchd/hdHTkNFMHTaqUnuhDmP
 MnG1KVJjwrbUV6OanWlp171Z3UYT+MdeejHtqIyOwo48K+xz6FUglkdfVcTp50d1nJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793657266;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IahS4BnpwHOb3ocRkZ4TyhVzc/WWpZzRTnxluI10c0k=;
 b=HSuE18a1/HKSZS+o2mPHRLNUqTQdu0SCk4s6T6f292VFt515tRHjc6zvROgoAejG9gOO
 9Afw3b4g1ltG+KHrOn2ZetBV60fRWBb+oKnBrsW6xRKc9Cm6SaYWm6k9DOF6FWTfAvKx+
 mfqPa8qsMq8/OpuvI8E7agN0Rs2SL0dR65tditxnOO0g1GxVwUyR9yXFKh+cpBJ+smNgx
 oYagwpeD+cQdIoyy0GFaCKhf8xMBKpHRLecXjdvRmR7rr7lXUmoqPE5OUu3IatXrQKStz
 6dBcCR1MKFTriSghjNyRlkxDWfihbHC2dVxnTkGC+CCnfRgru01PXBylVtpgs4dUWuw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D100E40098
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:07:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA9E99D5DA; Mon,  2 Nov 2026 22:06:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Nov 2026 23:00:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ef33a635f58a0c3c4d6f222fc5f52f3983816cd
X-Git-Newrev: f03de2f6565bee2d53442d1a5358ec0fc400cf38
X-Patchwork-Hint: ignore
Message-Id: <20261102220616.EA9E99D5DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.2.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f03de2f6565bee2d53442d1a5358ec0fc400cf38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.2.14 -> 7.2.15

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{7.2.14 => 7.2.15}                 | 0
 linux/from-6.17/linux.hash               | 2 +-
 package/linux-headers/{7.2.14 => 7.2.15} | 0
 package/linux-headers/Config.in.host     | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/7.2.14 b/linux/7.2.15
similarity index 100%
rename from linux/7.2.14
rename to linux/7.2.15
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index b39e09f55c..3eabe22c9c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
-sha256  bb1b871ef95a8de10b3f7b7baf0e0d754abbf620f804b6caf860f226aa97647d  linux-7.2.14.tar.xz
+sha256  d0f6b1d7324c937ccaeb5c4ca7084bfcf71db2edb3e2d3a31f0ad83a681809ab  linux-7.2.15.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
diff --git a/package/linux-headers/7.2.14 b/package/linux-headers/7.2.15
similarity index 100%
rename from package/linux-headers/7.2.14
rename to package/linux-headers/7.2.15
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0856a2a211..2080c909cf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -488,7 +488,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.14"	if BR2_KERNEL_HEADERS_7_2
+	default "7.2.15"	if BR2_KERNEL_HEADERS_7_2
 	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
