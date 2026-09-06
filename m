Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368ABC79F9F
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 15:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9858E80C12;
	Sun,  6 Sep 2026 15:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEF5FpgvY6rn; Sun,  6 Sep 2026 15:19:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CEE9E80C0D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788707983;
	b=ZkD+OefaGuPLitIQNabpV2WP6iW8096qHRhfI+8gm3mXjBsW7mXkwT9fDWh2Ky9U7/AX
	 1MlRULM+BvSwrW8dDhG7B4xiLej9ijOzgYlZtt9b/NPP58otjokRRgoxxXT27DmMENoRI
	 nRH8SSFaNT60IKQigDZPcw707DBYDZFBkfuHlEG9irKxhk7f4sRDm7A3BpJrLhkYlvwMK
	 E/fVa7Xdoh7YjCwxn/JYwn+Mh862dkc+xDM4JA3V5x74CGgTggNd9Hv+eIVt/PyOS9oTf
	 /QgvS0D02YolqtG57WiCk2kwNmq8W4VYGYztR78B8Qrik3T+GsoA+PgVuzRYNb1TQxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788707983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nZW98jrmfpVvgr0JVgu9zKMXKGlKCsbdbkkWP9SQpc8=;
	b=EbPcts0jeFQZ7/4inyenElPUz1fZieNJJ3W2kFSMRLScbWfqpUq2UaslirKhZd/ucVpG
	 KYqwR7/f/cGP38rEMdDXj/hqiroMLY8DVkfTUVQTdGQLTEN5YBrMubfoSn3gbVZpYD9Xg
	 TLbdSsYOrYe8hieRdbQ7u2+WxkA4+MEKA+HNJALo8Vbx8hYnOntgLxAvtc4LP+f6t3yec
	 v6G2FTKHLxVVi7hRz56ylA46zoI0m5Esg9UzQlAevSmdC6ArKfrYqjAAs91wKU42kLkWj
	 TMEAFraK1uw4o0uakUVRKToAnfaUI4c4+tg7IhYUpllnIzqg4o8aoFmEJO+2aFpYHXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788707983;
	bh=nZW98jrmfpVvgr0JVgu9zKMXKGlKCsbdbkkWP9SQpc8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YY4NHI6VMKXaEMRvSe2gxg9vxdcQu6Pnj056yfOijF2KyDE5+vVcjoiHvkPGQfVV1
	 z6b3UjuUpfcwJP8T8H6XjhC67jcb5FCNrwCp3hH3mcZq7M2cQwe2kO1E/a9dVYfdOH
	 9Jbsmt02Y33/xUpDdMk5tommicOaUC+j/k40704xRV7C7hVI2Mk/TddvWf32Ik64Sl
	 8Y4lR+/rwcE9n8SPwX4glbA0x59uHBkYmnAAkHJBP8wef86lsxA7ll/BnCHR1CwbL4
	 t5OVxeYMMRU0zhcuPt+y9eNV8oyETD+O0JIdY7AaDGhzXYwUesphZhmTi6o1rcFdED
	 9rCTByHjgvt2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE9E80C0D;
	Sun,  6 Sep 2026 15:19:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2D90118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 15:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F04A74051F
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 15:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WwEB9-b7wKx for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 15:19:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0AD2040509
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788707981;
 b=Emsn9C7EAn8NTmxjYMS2tLQuChb0Khd56B91yJHIPX1rWF1AbuQdBN0ScXHI9KLKmjWx
 MY8NaOb4Zrs4TDQZYpGl9wlsYXMjOLLPdfXzr4wG2C5poTkUysDcPxqzDP3a7MiGvwaLD
 JNMTboGbSY8Psugnl7CDSXHnnAEz+FLSJmpYCb/Apj6tNTq4HTPSrwrgVg/J2LbRrClWF
 UJRWy61SCtqWdQrkkZZre3GV+rZo1i1RtmQ6tagVnaIrSK5tbDVE+j6dGmYdZZHiki4ea
 SkB8+w+SVImi95Rqlj0thaBtYR4Ry8xLkkyblRIEJulhY7PhLNUqZpU+bF+p98s8wLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788707981;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=b1xSXtPurlMEgUTmR9lYYk/E0p04wfZXXg1u2kIVVaM=;
 b=N9UQKvrdxEtyF/Y9zZEnV3dRBC5PwxJA5Fz7MgVtuS1p5UP1omoRHGFloH2T1+e66GIO
 Ch+jVOmlfdTViEp/iQR9cfyF8W0Sqf28aIYXhPc6Y3t70+W3ZqAU9712Uu7LVNPT/Ahjn
 nhZUxzC720xSzheWn/w+pJJMaX86/i4yGx8OhTVhb3OmC1Eqcs3nPIvJ+GYCEkE9Zv2OU
 u3Dsn6+kNDXnagQHKTOtrWSqx9X6cWeaBryaC4UAppJ7lw/Tbx2/h0ProM1XxXbjcwjyg
 JlAf4sz902uHzyJCM0Wme+bpnEF5Kmh+Y8udg99BkBl5j6N7e6c3aBVpAq8cL9EPULA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CDnt763f; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CDnt763f
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AD2040509
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788707976;
 bh=b1xSXtPurlMEgUTmR9lYYk/E0p04wfZXXg1u2kIVVaM=;
 h=From:To:Cc:Subject:Date:From;
 b=CDnt763f//AXgqjjP3AipwbiOqC5MtJvmitTsOo3eAIgw3EuUGYY+x+MhC8bYTOyn
 WyDEsab8CF9+Y0wlKkavwvWmGjbqo6Fb8VYrBRGygVuDaxMVgmnBbpe/vwdH365p60
 VBZltHCf/OcA+sdQ3vEHfzPWNf3DvligN0kf2nRzxnQxycL5HTm8NFyTrjnRvLu4QZ
 K+Wkgz28jIaqIKaCCPpsToIm+n7hXnpg4UTWvBQ7c1Ol3gpmsFdzIurk526YrSPINj
 M3vnlgbInm2hAOxucskGeXRL/GElN1l+6UZ5ZVyrUhgAyOoGb+iSZVxiwq2C/e8E4V
 9gYRu/NK648Sw==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 27D93A4C346D;
 Sun,  6 Sep 2026 17:19:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58042)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3Eed-000000004Px-3psM;
 Sun, 06 Sep 2026 15:19:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Sep 2026 17:19:35 +0200
Message-ID: <20260906151935.1343650-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump version to 3.4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.haproxy.org/news.html
https://www.haproxy.com/blog/announcing-haproxy-3-4
http://www.haproxy.org/download/3.4/src/CHANGELOG
https://git.haproxy.org/?p=haproxy-3.4.git;a=blob_plain;f=CHANGELOG

Version 3.4.x is the new LTS release which also added OpenSSL 4.0
compatibility.

Removed patch which is included in this release.

Disabled static builds due to upstream commit
https://git.haproxy.org/?p=haproxy-2.8.git;a=commitdiff;h=eaba76b02dd41e0a1a2e85a3e71f91dfc529916d
which was added to version 2.8 and causes build errors during static
linking:

/builds/bkuhls/buildroot/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 /builds/bkuhls/buildroot/br-test-pkg/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../usr/lib/libc.a(free.os):
 in function `malloc_trim':
free.c:(.text+0x24c): multiple definition of `malloc_trim';
 src/pool.o:pool.c:(.text+0xa14): first defined here

as suggested by Julien:
https://lists.buildroot.org/pipermail/buildroot/2025-July/782675.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/31415f6b2f596562f3e26b72bd6c6b7d04ff0499

tests.package.test_haproxy.TestHaproxy.test_run:
https://gitlab.com/bkuhls/buildroot/-/commits/61aea38f365ef4ef9486c56e17d6201fd3e60970

 ...mic.h-may-need-compiler.h-on-ARMv8.2.patch | 36 -------------------
 package/haproxy/Config.in                     |  5 +++
 package/haproxy/haproxy.hash                  |  4 +--
 package/haproxy/haproxy.mk                    |  4 +--
 4 files changed, 9 insertions(+), 40 deletions(-)
 delete mode 100644 package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch

diff --git a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch b/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
deleted file mode 100644
index b3b1f732ab..0000000000
--- a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5ab3c61932af7619518169da744ba6346f060405 Mon Sep 17 00:00:00 2001
-From: Willy Tarreau <w@1wt.eu>
-Date: Thu, 8 Dec 2022 08:32:57 +0100
-Subject: [PATCH] BUILD: atomic: atomic.h may need compiler.h on ARMv8.2-a
-
-We get a build error in ncbuf.c when building for ARMv8.2-a because ncbuf
-has minimal includes and among them bug.h which includes atomic.h. Atomic.h
-may use "forceinline" without including compiler.h, hence the build error.
-It was verified that adding it doesn't inflate the total headers.
-
-Since all other C files include api.h which already covers this, there's
-no real need to bapkport this. The issue was already there in 2.3 though.
-
-Upstream: https://git.haproxy.org/?p=haproxy.git;a=commitdiff;h=5ab3c61932af7619518169da744ba6346f060405#patch1
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/haproxy/atomic.h |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/haproxy/atomic.h b/include/haproxy/atomic.h
-index f60be95..7e3c826 100644
---- a/include/haproxy/atomic.h
-+++ b/include/haproxy/atomic.h
-@@ -23,6 +23,8 @@
- #ifndef _HAPROXY_ATOMIC_H
- #define _HAPROXY_ATOMIC_H
- 
-+#include <haproxy/compiler.h>
-+
- /* A few notes for the macros and functions here:
-  *  - this file is painful to edit, most operations exist in 3 variants,
-  *    no-thread, threads with gcc<4.7, threads with gcc>=4.7. Be careful when
--- 
-1.7.10.4
-
diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index 320508f7ee..4db0ef00ce 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
 config BR2_PACKAGE_HAPROXY
 	bool "haproxy"
 	depends on BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	help
@@ -15,3 +16,7 @@ config BR2_PACKAGE_HAPROXY
 	  HTTP-based applications.
 
 	  http://www.haproxy.org
+
+comment "haproxy needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS
diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 2575c408d7..9f3a08c500 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.32.tar.gz.sha256
-sha256  8791585ee3bd24cde652d1d840ac7b1f73f086d5e9ec41c5e079592703ea52a4  haproxy-2.6.32.tar.gz
+# From: http://www.haproxy.org/download/3.4/src/haproxy-3.4.4.tar.gz.sha256
+sha256  b0c5053c4d46840ecdee3925736fe9a3de6472559b43c69183d70e593d9133df  haproxy-3.4.4.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index f75f18e031..d2fba7f920 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).32
+HAPROXY_VERSION_MAJOR = 3.4
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
