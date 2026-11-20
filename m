Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1B606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HN6hoshO;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=ZfMwcofL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB19815DC;
	Fri, 20 Nov 2026 07:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IK-h8P41hip; Fri, 20 Nov 2026 07:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F952815D2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795158467;
	b=IUcX6CWPaOj6EuVJ3/zEpK5biNTAxbpHuDpre+daIJSF1+1Q2i7Wdx+fOUZkD8wYdjR3
	 YVCyZX8SATrEBtve7SyXec05RGb3+doEXtzZIbEMwyxJfQQv42VO5Oya4qVu0VxAa9Jr8
	 /4MzvNzpqPO0qt/m8ZoPx0gfj8NLyZCBUg2xbL/3ZdrBp21puuYf15O+WoWyecNj6aYVG
	 uUbf+EC7lOqoU8hHpshlUEmfddlPTbPfsMHLXkAo2mhILbsAX++dKMw+Tm9EBdK0b7pGP
	 tuvQzppMEVHsge9Pxg++cUgJ5EfEBu3WEde+ZX1TjdIO8QanS1lux1LLgnU260cf4Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795158467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lyoSb7SSUbJ0Qi7BtPSfXWbltqgwthU6i5gi5QvAe9E=;
	b=pk8liluJeq7RCos1N0EYC6etLsspRiz6nL1lPHwOf8hlz1hSm6POPpml9q/tq3ue9oqO
	 4MoANYK62Ipc40mUUADxDoEymZQolibIJf+89jY2GYuK7K+XZcNHyu2Ek/OUgvioU53yE
	 miyTdoHlbbxddPH0QIn7eZNSBb8ZLQ/uOqE+irAavkujqSfkw+ioXHFJFWGtTu1X0uXWL
	 L91/ot2Dv41W7r+woHPCJUdrbBPvRZ0vpGpzo3RpvtoMA8GG34TvLdb3Wxql12ZOTreeJ
	 yOv0UlVqGFJpCduhmci6cIkckeL9QexsEm6w90DncqD/VzLl+RIssIWgvLTPb1aoJfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795158467;
	bh=lyoSb7SSUbJ0Qi7BtPSfXWbltqgwthU6i5gi5QvAe9E=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HN6hoshOCq2qF+SI/HKyO6IlDcH9mK8+Dgy+8/BWPGqTlcGQY6BH8H2SpATROr/j/
	 ulGCI5YT2LWKL+doakwZ46woMVdeNULgDmLKoRyhO1iDDxTfOU0xxqBhisAl7qJtK+
	 a0kfI4+mVIicyjsZLEwEEwPZcnLICFSTkl5M4zJDj8JypmGakn/7ObLtdPEGY7qYCW
	 m1xO0Li3B6q2iGja0wO0Bip6QgG/o+xuA0A5zINKjOczmNe1yAC7TwWWL1Ta5CFxq3
	 bcS1KAf6YUmtily3gWveTLIhjE4jqmzgGFjpEQXzhKyteCiC1F/Ux1Rr9XBe4ivevi
	 q/+pbMFKA5Zow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F952815D2;
	Fri, 20 Nov 2026 07:07:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E56822B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FFBD4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTDl9CyUmT07 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 07:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 48CB7400D6
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48CB7400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795158462; bh=yzaTHsOxVzIXN41yyXWRNqsmTFtwJnXYtz5qxIbYxSw=;
 h=Date:From:To:Cc:Subject:From;
 b=ZfMwcofLo3zLsIQ7ME0jzfHCTdx8SpJUrJIWWB83FMm/B3bhrXZUvgUnY+LN0T9p5
 9DD+m6T/r7L/2SHUQCA0ZXwh2SGt43Qkse/X/FjrKPAph1nQkoOy8XflgyMTeEtP6x
 MTxbpr+sVjWJvWmw11anoRU/7s/kw9e8yAvXrxpgGKyAz9zM3tiZiTQyYBfHI76Rue
 PJWNcyyRmN782SqELT3dM+hqGWwV0FeMA9EHHif8LzeK1tW6kYJ2kv9L+pH1NNSivI
 xRAZcb0+J41iluIeSUzboUU8LO2MU1JZov2wJLEfHencMX4DUHEVWlBdO6DhTOIdo2
 z4bumZZQ1Oc5A==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6EB9531E0B83; Fri, 20 Nov 2026 08:07:42 +0100 (CET)
Date: Fri, 20 Nov 2026 08:07:42 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <av_xvqN923r-qYUE@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: add renameat2 syscall wrapper
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...02-renameat2-add-new-syscall-wrapper.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/uclibc/0002-renameat2-add-new-syscall-wrapper.patch

diff --git a/package/uclibc/0002-renameat2-add-new-syscall-wrapper.patch b/package/uclibc/0002-renameat2-add-new-syscall-wrapper.patch
new file mode 100644
index 0000000000..86818452ce
--- /dev/null
+++ b/package/uclibc/0002-renameat2-add-new-syscall-wrapper.patch
@@ -0,0 +1,70 @@
+From 8201708234efe3ce182beaac42cee84166bea78b Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 20 Nov 2026 05:37:52 +0100
+Subject: [PATCH] renameat2: add new syscall wrapper
+
+Upstream: https://github.com/wbx-github/uclibc-ng/commit/8201708234efe3ce182beaac42cee84166bea78b
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ include/stdio.h                       | 16 ++++++++++++++++
+ libc/sysdeps/linux/common/renameat2.c | 21 +++++++++++++++++++++
+ 2 files changed, 37 insertions(+)
+ create mode 100644 libc/sysdeps/linux/common/renameat2.c
+
+diff --git a/include/stdio.h b/include/stdio.h
+index a48fa9b78..5069bc65e 100644
+--- a/include/stdio.h
++++ b/include/stdio.h
+@@ -157,6 +157,22 @@ extern int renameat (int __oldfd, const char *__old, int __newfd,
+ libc_hidden_proto(renameat)
+ #endif
+ 
++#ifdef __USE_GNU
++/* Flags for renameat2.  */
++# define RENAME_NOREPLACE (1 << 0)
++# define AT_RENAME_NOREPLACE 0x0001
++# define RENAME_EXCHANGE (1 << 1)
++# define AT_RENAME_EXCHANGE 0x0002
++# define RENAME_WHITEOUT (1 << 2)
++# define AT_RENAME_WHITEOUT 0x0004
++
++/* Rename file OLD relative to OLDFD to NEW relative to NEWFD, with
++   additional flags.  */
++extern int renameat2 (int __oldfd, const char *__old, int __newfd,
++		      const char *__new, unsigned int __flags) __THROW;
++libc_hidden_proto(renameat2)
++#endif
++
+ __BEGIN_NAMESPACE_STD
+ /* Create a temporary file and open it read/write.
+ 
+diff --git a/libc/sysdeps/linux/common/renameat2.c b/libc/sysdeps/linux/common/renameat2.c
+new file mode 100644
+index 000000000..efab4e019
+--- /dev/null
++++ b/libc/sysdeps/linux/common/renameat2.c
+@@ -0,0 +1,21 @@
++/*
++ * renameat2() for uClibc-ng
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <stdio.h>
++#include <fcntl.h>
++#include <sysdep.h>
++#include <errno.h>
++
++int
++renameat2 (int oldfd, const char *old, int newfd, const char *new, unsigned int flags)
++{
++#ifdef __NR_renameat2
++  return INLINE_SYSCALL (renameat2, 5, oldfd, old, newfd, new, flags);
++#else
++  __set_errno(ENOSYS);
++  return -1;
++#endif
++}
++libc_hidden_def (renameat2)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
