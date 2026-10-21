Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC3606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BXxYawcH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4C3410C0;
	Wed, 21 Oct 2026 19:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5B5nlrdYDTd; Wed, 21 Oct 2026 19:22:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C36CD41096
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610572;
	b=KonxZS0OqHzzAGQYbyNTQsGdfK5e++iRRItk+h7ckCnvaDNQWxCNPyEGpWcw27bPmPUB
	 EGRBnvNMCGgLWjtOgsfV2di7H6iQQ5rN+eeFf/piKOAFba/zAtFwyg+wz8DZYd1PFFXrf
	 QKvvyd25m5JUrswKTSFEiJDGHTRQ596VZm9jVd9htNUa3p1UNHvUtR9F3Z8WsfIoZwnVb
	 oBXumA/3Hre6QUqmtEBBuY9U9e66JAum0csopiocfXD3q+SyDdxiIVvNTdh+1SpKo+RSi
	 u8jLl1d9Z0V5bWe50Sm2ND4o4zD+nzCkJ4WMcdHXr1hgfNp7h5uWLjhSD5nhPgxUGfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PS3j42pXEdMM0z8V73w65IvQ7X2gBXKBhlRW+Ihmpiw=;
	b=r/lmQDOQ8D2GXOp2YG04jAXb+uJenYn5PjpiGq3mVlgbnkECrlQunpMHnIqMY4Wvy24Z
	 NPoGJiz2rR26Um47LIkhpbh54Qu5YDKR1hmjuTVfYp7KcJvMr8+/gRpSvhA2cAu1BX0c1
	 ZbZA138F8sZ4nHUKP0+A5fXg4Wz0XiX9M+IaMOAzdJxry+Xv90Zv+b7bkG5Y8PNOpy7aD
	 uJrZEBa5PaqPQsOiptg3qB789Q5cdgZlBOrYICbWE4RvOWguckwQ1bWVtzVMsl7YulyG6
	 LIDl4Dv/b8R7UXNR1LeaRldmBMPL+d5tT4D9GSS9a4ySeadDLc5TYGuNsxwbduJ2Frw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610572;
	bh=PS3j42pXEdMM0z8V73w65IvQ7X2gBXKBhlRW+Ihmpiw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BXxYawcHq70ojO5ANHWsVk2b+I02gU9m/fxE3t6JFrf7xU68OOvob74C+t/9hIXWZ
	 XO64mjJuTtdewwtcykeytRudsqI+yvQOdMkwGpMZVVKdzSN8NDbmxN8bF1OtS11FVK
	 Co384rrNm3CU8v9VLUyW77rnlgTJfrNi9g1X5l8z5vVOl5NwqAtLhcMDp24bMkB/YY
	 lpo5hiKSIEOCQ0RmUiWSeNNfMX+spvmjiB+MVZvM2rhHQQumyEmLAALkj7ZpQ06x18
	 Yntw5ft3H59r+b5ckn2LGLKWYR/ig8s98SgofeaN2WPgCMtOVlEMJO963aUVRmGasf
	 VCBnyEh5WRd7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C36CD41096;
	Wed, 21 Oct 2026 19:22:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0466B3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA7D741083
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWRUyDz42nk3 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:22:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 314D14100E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610570;
 b=SuH+QnNraoJfePaKyx06okwVigAOhwIANMpBD7ibtZ7ULnRhvN5oKWZ3qCeyTX9O1m6n
 qb3rZzwmUU8DX0r3u5yzxd0KP+xc/OSSsF2odv02JVlUh/UpUT5z7JgvpyjEX8cFuX7bY
 Owhclyk//rwWq49BfiViveC3kGu139R/3I/r+EdM4xAKn9Hm7LHJ8/cDTZ/xZKGPAT8GN
 FJcOfnOWpcXsRSkOkHan9AloDVSertNv6YCAbyktd/CU9/S7F/msslzbvdcR/ezDQ8+ry
 ct47Y6RaBq/IkLNHrIT+zKxzTbr5PnVkGUQk7NLmSep60O1wiN96pJavjLVME5NNhsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610570;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mnRuLesHvm4xMJA6SlW8k1s7vm3JspVkweo8xz4Cp0g=;
 b=JiqlSkvl6s3OzAhXiqTcZ7L2DE4vFBim2N/UZ5cQA0udm11+3yFezE+iXeT8uRaA/ROs
 FFSvqBRo1Zw7z0ltC5HqXgcgqVcc8Vk0olA9iKQTqyoK1GVG4dcQeFvO9MTFiAOpUhSwH
 Ls3pYETtNVbQOSao2OUPhEEIngHlU3JrtLlAG20IrNY1M+tBeLalrGT1FkNZhfzckPbm6
 +Y4kJXu2o5qU7krGHGeC4LZcUV/ezVdPX/u1+8j8E2vS76yaMXdWQhRviIaMeMqtq0I3Y
 jcdy6xckwRo6+kFZzIsfUHkRm6bLAR+xIR4BI48jX/4gcBY9nBEOGmF9mboTgtehB/A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 314D14100E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8286899AB2; Wed, 21 Oct 2026 19:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:22:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41f52f982a2c974258f23cf16c3722aba1bcb343
X-Git-Newrev: 07c23d76938c403ce3d1e6b4ca8849c07a3d7712
X-Patchwork-Hint: ignore
Message-Id: <20261021192126.8286899AB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "Config.in,
 Makefile: add BR2_HIDE_SECONDARY_TARGET_OPTIONS"
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07c23d76938c403ce3d1e6b4ca8849c07a3d7712
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit 4642f903cd613bc52f9bb8ea94c4d0ab18464c92.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 4 ----
 Makefile  | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/Config.in b/Config.in
index 34e9ec6705..208aa476da 100644
--- a/Config.in
+++ b/Config.in
@@ -15,10 +15,6 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
-config BR2_HIDE_SECONDARY_TARGET_OPTIONS
-	bool
-	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
-
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
diff --git a/Makefile b/Makefile
index 490f1d419d..9b62da3e40 100644
--- a/Makefile
+++ b/Makefile
@@ -258,13 +258,6 @@ export LANG = C
 export LC_ALL = C
 endif
 
-# we set a default value here to avoid a Kconfig warning about unset
-# environment varilable. This option is passed as an environment
-# variable to be controlled by autobuilders. The purpose is to test
-# less frequently some uncommon configurations which tend to generate
-# more build failures.
-export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
-
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
