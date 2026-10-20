Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F0606A31C
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DKMYpP4j
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 081146076C;
	Tue, 20 Oct 2026 14:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id De9_ccOmHzPp; Tue, 20 Oct 2026 14:03:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 13630607ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792504994;
	b=GDZSJYLDuorrVAynnoRC/Zlo2LIrOded8fq1YKt/bdarczR/uOFDQGz3ZvTA+KdjdiEP
	 kMnWS3dDzyODvq285txM5Q2bxWNodna3v3skt8gUk4cppghxVP1QvwRwcP64QGtWZasxP
	 MvbCPZAj/az4TXy0TJNg/IdTxAyMa6mI0LwVph/SvpzqQxqaj92AbNwgXHnKqg9Kl+FZw
	 3HQkz4ZyKnwktcNzoUGodUSBtoObxfuZY/ghiCn8rkOsE1Lz4YwiIIlfzNCqlzJa1I/He
	 rUSk/xu0OnLeDGPvBLc8sB0Fwaynd+EVLFwnoauDLLKGPrvMQBCcL937MT+NHu0j+rQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792504994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MOm6rFN6jWuILq05UnrpohlUUC+XKt+Rt+Tc2CpUkUA=;
	b=ss9xph7EuC9t16BB26tDPmzD4fbI/zqAd7Ja9pBkhPRH+W86uODksIDLmvD3r4PXCoG8
	 iBepebxNVAiZymBgwuO/OdkUlQZ0dg0jXXEYCuXkktuaN5f3qsgwksdsGkrrP7tGq4u1U
	 kfz4HMtx+vakIPqJTZ9E28d4ES4wYOzQ9a8j3AEMIqUoFjCFLvu/pKYa7DtRQ7BkQ4h/M
	 RSsOdRxPNey7Z/8kZwlEWi7Bcqw2I897Z1x4SedZ1OhFVdQWaYT5JaPs77o256t71PAVt
	 zMJOLsAaP0ZXZ0T5PYITgd5oKmVyyZtvMwW/0Z1QbGPpYT/ojztuH0U67ZAlVFrmHeg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792504994;
	bh=MOm6rFN6jWuILq05UnrpohlUUC+XKt+Rt+Tc2CpUkUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DKMYpP4jgOj/Z0pFVv+iW5fB11mzsmIJxHY2OiWErr+W5iRS42GFSdICxYGzbpmAR
	 Eykvll9xM3JaevF6ojXLKLuCWWNy2Isq9Yudzw/WnhTiFMRYF3Hm3ZCJ+C0vMrk78Z
	 54kBvp8dMNkPzLps6+PiDM7zAF7EnuDDWSXyXNTcl8Hp9UNmB2C6e470uKmfDtNfLz
	 4PmzcVGBUFl7NXEeAaod54EgJOXp3gVz9kw+nZTgr+4heocXJVnYzZu6M1RdNvrHre
	 C9yVZgnEAfYJC52vfTrcBQ0fGhdgKRWXPmMU4BNJAivvdTLCv3+1bQVqPbRINAwH0S
	 Pe5q8tV2VYMiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13630607ED;
	Tue, 20 Oct 2026 14:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECDDBB88
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED5180DE3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD0OwR_kSB6H for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 145CE80DDB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792504990;
 b=j2FparyL1YEFgqo1BRAwRHUD7OPbI2mWYVLZpDIz6shWRQKUwco3NSzs1FL75wOBpTdL
 Nmp9IOcnxAPbP9UqeQ26YBRCJjIZF/4SnHy1Wwgl1pOf2OMiA3um9gCSeld5OEkADgMkF
 HazfiKEfYG+LKjLgos6kvrC8Powu4MEENrCWE+UAdIcNyBP4axteMOkDjffpl/pywNyQm
 bOcbIdWJhHYwdfWCg+brUfONXxhsXMAsGsWVfnq6RCEGNIXpCvGeCVNJlh9M3MamS61fX
 Y7BivedmbgLhiZGbL5TY1OqSz4kvoOVsPY5M/9f9Js7ukKKcJJcbBgCqMpKSAyglo9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792504990;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w04fvbkKWIOfjtYr1rK+esMGAdmW0VPw32L27mk6CNI=;
 b=K6bPa1K7LzGZTFvDydOO7NCkKzKqvxc0PG9eX/ikOgMm/Lu2FdGW+32DvObpZZsWXxiW
 mAB1SPU1qeYzZIk0Yz/7JYzUm1PDA01TQND3eI0eOa/ZQJWSccgxsqy8JyyImcS7QvWPL
 sdUqoOyzdgamTHYWA4VyolWctfuiLllIRkHW2H8FXpx24hLl7P9r1Rb1noH+g1jKWitTN
 2VclVKwieBcZLbjSXdijV7ySMpx3SS/m2IE4mPLYyNd8BGUSa9SW61RG/ag+W9tyVVp3L
 QolBEWZByxbMfJaRwEA+1AnPV+jQ/SMzteNiidnzA06X6OZZBuTVIgInIGBQCf3kcTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 145CE80DDB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3BD19974C; Tue, 20 Oct 2026 14:01:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 16:02:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e0cd646932be3631f87f37ee08e5d6c09e2565f
X-Git-Newrev: 600ce3a71e8284b55d4c385015136c2c5ccb4079
X-Patchwork-Hint: ignore
Message-Id: <20261020140146.F3BD19974C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mg: needs a toolchain with wchar
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/600ce3a71e8284b55d4c385015136c2c5ccb4079
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since version 4.2, mg uses iswalnum() from <wctype.h> to tell whether
a UTF-8 character is part of a word (upstream commit ee22ef729b16
"Tell UTF-8 words by their Unicode class"). This breaks the build with
toolchains that lack wide character support, such as uClibc without
WCHAR:

utf8.c:23:10: fatal error: wctype.h: No such file or directory
   23 | #include <wctype.h>
      |          ^~~~~~~~~~

Add a dependency on BR2_USE_WCHAR, together with the matching comment.

This issue has been present since commit 3b5fbe8f6e78 ("package/mg:
bump to v4.4"), which updated mg from 4.1, so it pulled in this
change. That commit is not part of any release nor of any maintenance
branch yet, so only master is affected.

Fixes:
https://autobuild.buildroot.org/results/9d55c1b27627118c4279d9aade9f65b45db57e52

Fixes: 3b5fbe8f6e7869c41616bb7e1e97b20f52f9976a ("package/mg: bump to v4.4")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mg/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mg/Config.in b/package/mg/Config.in
index 35e0e6f57f..7eb052d1a8 100644
--- a/package/mg/Config.in
+++ b/package/mg/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MG
 	bool "mg"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	help
 	  Emacs-like text editor (260 kiB)
 
@@ -16,3 +17,7 @@ config BR2_PACKAGE_MG
 	  and, in particular, no requirement on ncurses or termcap.
 
 	  https://github.com/troglobit/mg/
+
+comment "mg needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
