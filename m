Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBE606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f8MMFFcH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117CA605DA;
	Sun, 25 Oct 2026 17:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiZ0yhayOFQA; Sun, 25 Oct 2026 17:04:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3C1DF605F9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792947847;
	b=UVjBhN45AzXrXEVndiG8lofb0mdD6M6PCafwiaij/gYTwhlqVBVTO97Gz3LBnIzJHVKB
	 QnFW7xyNpduUDvUMcpsjbRz6V4ptt5PFMt3FcKEl66+Agneumend6koWSLdb+7ogZjZ15
	 Ckf+FDOdnZk7I5tBgQvkmUtx6X7bIPxTRNZOiirillf1yW+MX3KuHNg12t0QN4sET/wk5
	 pS34A5ekfFQ8nuw/N5nnT7nHi1FSC1e7fug9OQOEBENB6nKrDql7XSDjsaoXQQgPNY77O
	 vt7fbXuT3+Lko8J6B3Kf1Yx7RvqbiNgK2tgURXYsonRWH20aNYq2RGOcnY7qTEH3reg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792947847;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=XRJA5D0ALkZ2hfSCrQCJ2mjv51Vqif+eOFSFJHQWY+g=;
	b=QuRMLHPJr7l7yieCwaKwzHs5l/TC5ePIOp+R35DlqR9q/IwaYtjCTHdTDvIW0CTlDODv
	 XHyu2UIYQdoblBI2fZsch5MjAnIBBORAUcYiEsPweBMUAH5lnCsyqdtK7ezgTorYzNLLu
	 6ycdzJQEQ8J+ayPz4ST9+4/SCwjNvtwwQ2dvE3KmSvgGSUhnKEQNHS2O1GzUWATSE8f/N
	 4dTBMK82JSSCxjSViLbXWD/VukLw0X0Gqe0PfxPaXu2qX2othvg5fMUgKh9z+fb4OSocK
	 7dwWFApo94VnZK7WlHkvM3psjWIHZe2sxKcEX5LxBHM/lVMEqh82E54H7MhQRnfb6OA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792947847;
	bh=XRJA5D0ALkZ2hfSCrQCJ2mjv51Vqif+eOFSFJHQWY+g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f8MMFFcHtkltSyPeCHZ5Trn5TBsw61SC/cUnulP7qnqcXMDaf7X4o62OgAaUlDcIT
	 +BV8uzEgNDyJo/8enJFjxYxQWZzyrH6l8+pOBETkQW/YxOEWoabLZZXL0GyT4UWNEo
	 uQhbXin37e6tdl7anmvFKRCO5pkXqiLBLteoqSmJ0fxwDhWB6SJPK8blmLR0Zf0LYe
	 2FfFzDiTmddDQEhoScMHhhTLyXdmPCB/WlFAplLsHzfVxr9UJ0Aq2aV3tVJSv4KA+4
	 3Cm54tgTjyManQ2yB7F+MOwhkrNKkJo4f1dPUGjKWn/8AQfZUF+RftSfZMuzsbt8k2
	 74D4blaze8rTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1DF605F9;
	Sun, 25 Oct 2026 17:04:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B2E380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D78B5605F9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGRBp8rWMJoF for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3765A605DA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792947845;
 b=hjAMZ7WmF5B9mfzcHjjBowxIusb0aX/c43obRk+ukezDME8CSqdZkLcQ3FMP1fQB1d2C
 xhojeCIc6YqtwHADjXqMCoXMW5HnX0yAWYXe6yA1LKL8XZ+Pn1DipoVxEskjR0Duibea4
 IbtTEpjTMcYWtRXGArCTfDoSUZG+jwd/JTOyiStD9yEtAoLqSF75LfV2pJ5Jxq0ErC7CO
 5o7eRwlkQFdDHwUI5dnGHFRj+fMlR/wgMTW60Zz4H0W6GWnLO4XX0yGi8DIYn1I3zqA5s
 bSkEiwuPoNbVKSyLol+KDzjQqb/ASd8Qq8rbWg6jzdtCyoqjDYX9NuIS5hl9ziDXE5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792947845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=P+hrk95x0Qwcb0qHx2o8WzFu8nV9PYQpx5eKBy5VMWE=;
 b=RMX9xrargujZ+OUDRbHmow2IvL+YFVfl3u5lT1F0xzMTypmnMlZWYt5IDEAeYt9WEgB+
 CYOXev6Sp/Wp/Gg8p/VKiNDFg1FVKvM9Y1OwpvDxLc4WJKbPK2INvPTqTXKILCshtzqZc
 oadDftWAl4fulNib/Zwqg0n9Lp/S5tr9h7joBbk5x8ol75eh9R1ff/hEmoXlPBQ83ibuF
 YqcEwpJxGQzg7ooBswLegYpHAOmyEe7ybAOFMm6hPc/DS651HCodzU5duAi12psQbmM3E
 Odw5LfM/7S5+BvKPUPHsGOKxHcTBK87NbOkb3CRCOsodFN4/Ehs05C1qIu3lopHjGhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3765A605DA
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E692960BA; Sun, 25 Oct 2026 17:02:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 17:59:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44ed6fd12a207cf0d61e27460afdc9bc28001649
X-Git-Newrev: 4cbc360c77e339fafe9dba9c4dab3625d0a26c25
X-Patchwork-Hint: ignore
Message-Id: <20261025170239.9E692960BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btop: bump to version 1.4.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cbc360c77e339fafe9dba9c4dab3625d0a26c25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/aristocratos/btop/releases/tag/v1.4.8

Update the hash of src/linux/intel_gpu_top/intel_gpu_top.c due to
an upstream code change:

https://github.com/aristocratos/btop/commit/69c9dc7a72ad9c045660d1d3b686e5d230ae61b9

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
[Peter: reference specific intel_gpu_top.c change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btop/btop.hash | 4 ++--
 package/btop/btop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/btop/btop.hash b/package/btop/btop.hash
index e748dbb373..777ab6fdc2 100644
--- a/package/btop/btop.hash
+++ b/package/btop/btop.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  933de2e4d1b2211a638be463eb6e8616891bfba73aef5d38060bd8319baeefc6  btop-1.4.7.tar.gz
+sha256  67e07c21b770a6d884c5e50ba1d2cfc90732ea57459367d8732ec7ecbeb3be5f  btop-1.4.8.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  include/fmt/LICENSE.rst
-sha256  e0309e3ea5d2c839946816c557ac8da5ec022b3f0bb26a5b5de0f709567902b3  src/linux/intel_gpu_top/intel_gpu_top.c
+sha256  fd0e63f4a1b411fb8ae10107c1fb8919b6ceadf656bc9bfddd9f9f76b84ec4e4  src/linux/intel_gpu_top/intel_gpu_top.c
diff --git a/package/btop/btop.mk b/package/btop/btop.mk
index 50cdca90d8..4c4cb8712d 100644
--- a/package/btop/btop.mk
+++ b/package/btop/btop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTOP_VERSION = 1.4.7
+BTOP_VERSION = 1.4.8
 BTOP_SITE = $(call github,aristocratos,btop,v$(BTOP_VERSION))
 BTOP_LICENSE = Apache-2.0, MIT with exception (fmt)
 BTOP_LICENSE_FILES = LICENSE include/fmt/LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
