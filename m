Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAC4606A331
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AVKatyuc;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=t5ozeTGE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D72AD80CCC;
	Fri, 20 Nov 2026 07:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cJsa5nUwq4K; Fri, 20 Nov 2026 07:48:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2A7D80CCE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795160909;
	b=rsPJvc9dNz0qiV50I7F9J5Ig0dK7czSCZPBh+R6NO/xJ5udbx4HndEJtuvAmZ1aDvU0I
	 sGRV2a2ZYDpI3ahCsa/8uqzeVa0SXkDFy3/DDhrP+0Xk7ZZssI6IJ9prpbWcO3GOTS975
	 VbxoR0Y+o7/+8mclvrkVyXGFtiRy3dKZzvaE/iydEHBpQG/vJjU9XuT6FG6dMIPLQtgvX
	 5IwR7PSwdgxfbKKuA9y/BVRWX1913tYza0SeNZvVTqfqn1RmIaDt3LStMnl0jojzYyEPz
	 euKaUtQfzgAkSUpP/RW4XxK/r409LRZ/AGm74zI88ag8RSCNFHlYJlXV3Llw3UZpNMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795160909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z+OZlRi5WdymM7D+lEHBzTQ78o+/COB/vJQXCeFLIOQ=;
	b=kQRW7482VwM4h2O0EowiFfKYgWzp8asjcKJ/hxmigN6JvcRXZFfxY7M2JG8o7YF5LqQ9
	 QYP6JoDYC/6zRfAHYIlhzmQ4o/qcfi9LKi5yCq4tg8GtrdxHzn5kPoNA4P+r7liqca65x
	 5VPkpvuR1E3jrHxo2IEBraFsDpAijxH/NuutttBREAi539OYN4lykocjWujPVvAT16Lhq
	 fPvTwCr5VVYSoMv2EB2+I50JWRXjWfigPhmDtyg2jdhmbVXSCCo0s+/SMWuME/ha/OLxo
	 WkhZcXMXgF97DnhdbfTrQLzSn7l9jdqn+GZ3LJg5k1m97SLJNWNhd0LWRU7OF9CQRQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=openadk.org;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795160909;
	bh=Z+OZlRi5WdymM7D+lEHBzTQ78o+/COB/vJQXCeFLIOQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AVKatyucNUF2OLHYd2llW5H6pIC68zUlYPfpMDh1Mwlno48VEIENtjeqJlw+qp8RR
	 nJvaGORRZfRSSPtVszG1eGJI1XAudbGcVueMMrzMt/in08DeBC5g33JraTHux+pcdV
	 J+Fv32YOj+Ywi+HoP0ceVxAfVzm6tF9S+zAc68eLgNctW/xxzzTLmqi2Fb4pqdhIyB
	 hyWhrox/b13dQ5BBCaHZ9KTj5hSIJPSpOwd9NMcLrEFW0Ycu75Rf5zuROtkp5kjbzR
	 Yyb0XC/v5pwD04oZYEs/AVTFtWSOVkXwJW8QTBVn/mxksHn+ol7WJdHgJW7aeCDRHE
	 pUt64SpZWbZHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A7D80CCE;
	Fri, 20 Nov 2026 07:48:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60C3F79D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F4C380CCE
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWRwiFnHBPEh for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 07:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2773380CA9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2773380CA9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795160902; bh=uB8W76s/Cmvax79WdFsynNaEK9oBGSVCx59VXIecDig=;
 h=Date:From:To:Subject:From;
 b=t5ozeTGEskyau0TpfT4wG8siXu9fv0tnECaknJzkUy9f+c63/GD8IYIPCGVjflmC2
 yCo1w8i+CFAPLnWxiEJzk84TX+OthKXdmaJtXr0YZVMUj2CmPBxTxLYT/9XkQUdkwl
 lFQbsKfKVTrs6oPOSNJ7rRjOwhinjK9ZlaSHhHyXCK32in4fyQQ4hd4Ut3TIpL1QL6
 y9Dk65Nv3BH1JE8jG31454xM+OUUKsRB1VObXq/JwjU+kpYwP+sOp0oITs0Ko1bboB
 2vVvuWrBuPs8Yr8VA+8XsyEwEmWvLSmMCAAFAUce9jtS2Yld8DOiLoFUNRL9pCRknO
 yL7dp7dM+Q0Hw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E067B31E0B9B; Fri, 20 Nov 2026 08:48:22 +0100 (CET)
Date: Fri, 20 Nov 2026 08:48:22 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <av_7RuEyLtyqiVcr@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH next] package/uclibc: add renameat2 syscall
 wrapper
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

optee-client needs renameat2() since 4.8.0.

Fixes:
 - https://autobuild.buildroot.org/results/a1776b9fb064aea72e37965e9c04d44ab1743b2c

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
