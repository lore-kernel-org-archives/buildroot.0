Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372B1C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2CC6607DE;
	Sat, 11 May 2024 07:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YueKftejsHQx; Sat, 11 May 2024 07:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8AC06082B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AC06082B;
	Sat, 11 May 2024 07:28:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4851BF47E
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73C7A424E2
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZC-OT3rEDzL for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90007424D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90007424D4
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90007424D4
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:28:11 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2B563352828B; Sat, 11 May 2024 09:28:08 +0200 (CEST)
Date: Sat, 11 May 2024 09:28:08 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zj8eCPC1/IXZ6X9Z@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715412489; bh=uo3UeOpBgeyqzpuVcKRm2oVYTQyttML57yTCoNk6w5k=;
 h=Date:From:To:Subject:From;
 b=jLbRm6g0jOLvpKPazwVhdbMVYn4Vc2qVYj4Frda8VG592KzTtFP8Ikfp+p3u5X0hV
 YQHot0E2JT3GAiJwRKRvy+VuPYiMGA6t6511rocxjTSiHTpzBXsFPAl33R6xv7ddSl
 MDlprY+g51Ua/XMUZbW0v3UvP5bfasBkVtlm3bytC0smEROgaDJRaG0+arlbEtQoF6
 zGw+pWzKvQ0g9zfaancJvA2IOIpmIWdlnKmGyXz7S2wX2TcA1gO7MOjBJACn33Stsb
 0aTxoA5BlLUsIimFEglzkLbhuxNEIlCkYJAFAahJ9EpLvsDbf5xjHzywqcZhYpkijy
 XSFf9GaR4ZzDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=jLbRm6g0
Subject: [Buildroot] [PATCH] package/elf2flt: update to 2024.02
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

Upstream added riscv32 support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/elf2flt/elf2flt.hash | 2 +-
 package/elf2flt/elf2flt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index 4dc040645e..e338ff6780 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  735482d8c5fd76191e86ff2d6985dd68c232a7b8bdac11fdb480385c6a75ca8f  elf2flt-2023.09.tar.gz
+sha256  e1d419c463431ff1af7fdc76a402f628744ad10dff063bea76a386942255119c  elf2flt-2024.02.tar.gz
 sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index aa5595843f..d5a7b9b5fd 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 2023.09
+ELF2FLT_VERSION = 2024.02
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
