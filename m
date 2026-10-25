Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34DA606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TnLZPQuw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC2DE403A1;
	Sun, 25 Oct 2026 17:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmBozOEAvIj3; Sun, 25 Oct 2026 17:39:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BCF11403B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949974;
	b=bAGIvc6p0T5sKO3ELVKGFRADlcz2koy/zQRVuTTqbngZeU/bMR+GI2nqsqTOG74urq6I
	 n58HycTdZZReByAIDmWwAZH2gvNTraWcLjZTbtuugW1US2aO8NNnX6ei2LpR8IjwG4jL3
	 xCJO7i9oJ1MlzNQMA7ZT7+sxVGqf9sn25w3MN4PKJU1aUfQRWDsqthRzJP0wO3GlyPnQ2
	 bCLIp0A0TY+qg/V0+77x1nbcsCr+6lMx64PC5cihJsgPWMM4aaRZbUl73+thkHwpvmOX9
	 Q6tFs1qftK8F513o0f75RlJivjSO738tfTB083pxfEyoMzzbTk4zsxku3cNPJEauR8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=W+3zVXmVDOfeyulMfI/Kx6nUX2YLQuvhDYCn+bHRfCI=;
	b=kcET8mnLGfPdwsk2zSffCtDssNOmvqKgxoe369wELK+r2CZIrXLhZamoJzUT11d5EQp9
	 K4xtPnTzIdWoj5aNs6F0N5Var9kDrp3+b1lGFmlPKXBe2XOqaQ07LhTQoyNCO2vu5cQ3i
	 Z7sb9q3bj42tUHHjL/o7RbvibzlSS4dgOuNJXRYaCT4krVQjQcH/hoPCaixECYNczQe+B
	 EhxwV1318sQhSjhfwD/nWpfxacPNTSnOp5miX0+Jn6OgtP+Nwj+tpI10JvCr2zxMWYRsM
	 JAN5rGVBGOFQW3i9kaoU+VO0UhNDO8pnMMM5XKRzEbLd7vCux6QYkOP4iVayqtZfEuA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949974;
	bh=W+3zVXmVDOfeyulMfI/Kx6nUX2YLQuvhDYCn+bHRfCI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TnLZPQuwGKCM4dWDJuRUFW4rSs1ZXeszhYFjOkB2b5++2ejJ2RXlZVix8NbSvxbCL
	 h4zoXt49lcWrc0axwYc8lQwgEDizCYJ9rG9h+D/Knfh2OaI2zNyiJvJ45A8rLMTZ1k
	 O5XPfn9jKz/PaEIjpyQTiZxM58StjVucPIOMKPPjR2rIo4JlWH1jUV13v8zfyU8HAV
	 UKvie7S8VhbIIXB1TiINxwMEEd3ShDEiDBOXUHRdUBG500GudPv/E0qlLf97PiWg5v
	 og5I6ttYFZK9A7ygaa+C+wY/QQ7HW6RGcWGZsoBHFIJCnuS0eU1v18WFACOqprvTbh
	 9baOIo86Vlc6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF11403B2;
	Sun, 25 Oct 2026 17:39:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C45D779F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1DD1605FD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhQmkfvAroUK for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:39:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15657605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949972;
 b=icy+HpdKc+OaYbtU7HIgzcMk45wOqCKjek4JjY4h5npoMnnW8b0RkOHprZ8wjHlZFy+A
 STw/W9RdurU8eXAmfsCyLbECCddV1kcrXK/GyhumhkoDtApAAOQc+LHYb71rVMy3DQOMS
 Ekb7bAagcWP11ec9K9KXOr8ACNs8L9j9UvPRTQDyOXOjjoNYRCraPkBXMKSYSj7xTHM8V
 ynjHU7x+424j3HMR+PhLxhYFkY4kTIQqkj26P3rc0GL8++QAJRPMY7cOfjQo4Qvc36ONT
 OE8IXJuMOgzFcVCssTW84Y+m01U08p4AEoy1EVUfd7z0e1+GKtJPDgbROrbNO6ZXzGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949972;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QIhfzbyTGQkjpfBdrYKSVdzAQDY+hcvxM4TnInmiJjs=;
 b=Pb1mRfu8YmQWYNC9YY/HewPm2M1hto5K5SxllJ2WBAoWUPOWe6/hRSB1UYHA3gwTTinD
 2ugipYGslAAs43ltDNDiE+rmYpLcslxUGuJrPAf1JglthgYZYCMYlsLbPUmpNaIOtyeTc
 yOwPVZb7LRvsrohram57DgrX/0wMRq03zbj1McpCw/8UB3jCR4KPFMNdZlh/+xLYYcxBd
 G8Uj/95Jx10iwvF4y7b5KgmyO9dc3I1vFZync3OQtr1RVMkNrQRyevqeF1G6Yi0pPMiiu
 isWbhDBegR+xZVtKeJeIk6cvfH/tQ3Ek+efv7CwllOhaGMf4+ys2cfky30Z07HdK76Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15657605F9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:39:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 863BB9525D; Sun, 25 Oct 2026 17:38:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:38:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 339a4809172efd1fe5a0f6e28d69c0bb9d4eb90a
X-Git-Newrev: 44f898e7c5e4657e6b2af19af992e9209f408bc9
X-Patchwork-Hint: ignore
Message-Id: <20261025173806.863BB9525D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xnnpack: add support for aarch64
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44f898e7c5e4657e6b2af19af992e9209f408bc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

XNNPACK officially supports aarch64, so it can be added to
BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS.

Because some NEON intrinsics calls are flagged as type incompatible by recent
GCC versions, do not consider them as errors. This issue was already
noticed and reported upstream some time ago; and this is the recommended
fix from upstream. See https://github.com/google/XNNPACK/issues/7733

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xnnpack/Config.in  | 1 +
 package/xnnpack/xnnpack.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
index 794c5c47d2..434cc823a7 100644
--- a/package/xnnpack/Config.in
+++ b/package/xnnpack/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386
 	default y if BR2_x86_64
+	default y if BR2_aarch64
 	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_XNNPACK
diff --git a/package/xnnpack/xnnpack.mk b/package/xnnpack/xnnpack.mk
index bb53188f9e..22f4b059e9 100644
--- a/package/xnnpack/xnnpack.mk
+++ b/package/xnnpack/xnnpack.mk
@@ -10,7 +10,9 @@ XNNPACK_LICENSE = BSD-3-Clause
 XNNPACK_LICENSE_FILES = LICENSE
 XNNPACK_INSTALL_STAGING = YES
 XNNPACK_DEPENDENCIES = cpuinfo fp16 fxdiv pthreadpool
+# GCC >= 14 errors out on some fp16 NEON intrinsics calls
 XNNPACK_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-error=incompatible-pointer-types" \
 	-DCPUINFO_SOURCE_DIR=$(STAGING_DIR)/usr \
 	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 	-DXNNPACK_BUILD_TESTS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
