Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A6606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YhULEu6N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KvCk75T0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0432810EC;
	Thu, 22 Oct 2026 19:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VW8HBOtkVUEv; Thu, 22 Oct 2026 19:50:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A2C0781225
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792698647;
	b=egiZpmT5L0TnkOyxpcNEBYhnt8biReSswRAEkt0XaQ3eo+AUH5yPj/hvfxkoJQ7xMLZs
	 Tp2+mgXyV2klcAagD8kj12Y0boh/IhW7sgs2BXC2y29SA+UF4/eXcp07aMGna/4DJQ3lm
	 IU9PmpKcOiee433jdpu1uvXLG7gufYaDxg5xh4qURX2s1NIawakMju2PYML+dymcP8KTh
	 lfvcLu4WV+ecPOS39QdtQ4xBg4aDl9EkX7ACH3Sf/5YC1EyiQyQgw2hhnSpWgiTVNHlRN
	 Ms1eM2QNilteUqUb8JIbL6Y6Rl4QWq6wsSW3ao9J81kK+fNuPV3SWDVvRlg2KfLv2Hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792698647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nl54lLdlF0TjrdIbhdF+xwLOV8rOCUxiqXdPwr+WMJI=;
	b=HsVMLvjC1Chz3W1upAlBi9GvKCdYhTgpCQrNH6mBAyFoF49MyO9vYoX3VrxRXO/At+s2
	 8URF3P2bHSS3wm6GA34oqE22ga5E7hGZVU4LTsL2QVZDHrcAhJAmkbxCMcgX0kFxFjWp1
	 JA0o965T0fOVH1djkRxAVrryQiPweX74ACIwc0QrOYrAPoe94sHg1uMLox1jONshZVAKe
	 LfArv++e6+tWBjV1hDLPvQEwEmFSDQdh6Wk9O5DydyDEsVp83fpGg40wOoith7D8ZP4tK
	 c1vFEOcALdZ5BMKJPVl7YjfEIXvISGoU7OfAHqyRuKjQypIcZnjdfjdcvhi2W2A9Klg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KvCk75T0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792698647;
	bh=Nl54lLdlF0TjrdIbhdF+xwLOV8rOCUxiqXdPwr+WMJI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YhULEu6N0j0OD3giOF2Py1/ObF6uLgbSe6lVCxo31nFSTJI0wlCKtlBK0vC92htEH
	 h5PK2nRzQe9jyv8Ss8W7ZPO3xmZJqmPwMRtQF6100fFXrY1U8MDTXAaNvUXbBqjuxN
	 09jB0ZXjC9FNPEvqej0uhYs2T7BuRZs3HGaw8VpkxFrLalk+GbOQElDcsebepabCc8
	 oin6t93LltdG8PL/9PCFESEf+/qWwp3qYllKEuvtW7TvHPcqz+FytiEYOXgSnGXVna
	 Wm0cMObkZppHoY/h6rI/S5w/my3k0VmZM9ZpnESYjxv85x2ESN4fOQ8IVS47iOWndl
	 MhVHWGoQyAU3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C0781225;
	Thu, 22 Oct 2026 19:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8FC0499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F09381239
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSK0kBW8NL5a for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 19:50:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC441810EC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792698644;
 b=ZhO1rehEVH+8JEnIwOgDeQ20TU/q7yACCkpS5FuFkE2LHWRf796fVk+Q9ZeC0z20GuXW
 8tB4XLo1K/93JlvNVMVp1T+ApEGapXbiKC9b++03wztDzUpIJEekwzukydBI83877XLDs
 B/2T7DWVmLYvJ52OHVAXPilwSiteOh4h26N6h0u4jbEZJ2l1nOD5hDgYX+FIwn05icpbM
 Iral+oJNink5Fm90efUd4z6hkb8yKAkbNgQBRC5LpwjT9fkI1hKq0yWdD1J83jVaK0sG0
 LNLztZMQBo6gVOSSGv2OaUMUtJXOsRMlwldfIQ2SZ0t3qWgcJinCMJ+mUnmUP4V+2Sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792698644;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5msadPeHdsQbhZwKAYl0/VWdLWLkWuq8nRawV/N5ZZo=;
 b=i5IHYf4f1GrQOE8rMDgjPFWXBzt+NQmF1Y+Gpr9vEU+F0fvAJpSb4UiObUhakqiRr7lQ
 OFwuORI98mAHFj1f+5A9YBRbKpa4hQ+xDaLah2SFetaCkyLcyAMtevpgDF5rFfOLih3Lr
 seq0wy/Xz4DeTihOO8esFwBiksjN3IzkgV+DN3l4aC0CEG71gPUmzw8NRBfunA3p3I1pR
 GxYQnH3JkeQltgLPYRPRSN0geM2b2y5FhEL1BQyHB+svF4eNoKYPtkZYsQZIlqik/WrmM
 lJjt68QYrqEG52UKB+JJ63aqw2l7SKcudV++VXmkozXNGdzAeD3qT0rJFaP/LXgikwg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KvCk75T0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KvCk75T0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC441810EC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792698640;
 bh=5msadPeHdsQbhZwKAYl0/VWdLWLkWuq8nRawV/N5ZZo=;
 h=From:To:Subject:Date:From;
 b=KvCk75T0c/3zlpqj972hSZ7hCsv00yq9CWamaxf/cIfzuzYx2pph3tk5V90oohdxN
 oAqS1m1/r6QxnEUHX2rRGVMs4mQDwFGIMTUp2uZSp6qe96UkgYZcDL1PhxnCdIF/YW
 /jNJpe7kioKxk3J51lHKQnDEIoSZOah4dUPOTeT1E/Po95heOxKkcCXqxB4q0OCpLF
 hIqoNDzcNaiwADaQr+B1V9uJh0u9tFZ5WIzE1gTc8DqwpgfiZ7+RvN7zAu1XYGNwRf
 wAT0APH8KtrBOlni5m9+vW2d5ibjIKj9ScktOV82SBIo+XlgIcsY7/vo7YHEFNnJax
 S7Z7yphrTbBRQ==
X-KAS-Sym: v3:f51bdf72230551df:kVrIfMo3eO1hjO7C0zOo2fKTW1RBA676R6zT6GFXn69U7
 1/umnJqLYuQBygmpz2bsv7O1QafDWxgTVbYqCaQrn/NJk6NJ/a/+1ba7NjCcDNaDAuDOQXxmQwF
 Sl9Hwn/vKAxUAdWjF+pG7oD2maVZ54v/p+J1uGpQWlkKfqPIFl41IC9f+Q9qluRmkDkja9XevUG
 GJOtqGTMHjcakhScZ4akjIpJZzwkDBJtTftfPGQQV5yCou0g6cbxhDX9Kgx7I1gLtUS+ycGlzyp
 V4qXwNUdVFp2jwKQ8onuLwjy+WXuF/PrPKJtveUrHW84q40YyS+hmA+Bk6QkwkT1Ql8jUQXA==:
 cJ9T//uZZBVlMi++NaR+5gaLc2j3FzmYhpXawxGa3puz6032PiWPjXcH4kieZwKY+yd/M3mX3I2
 0JhZ3CFPHhHhoY3qigDeVgijmipuxrtShmT36+xh4VVJkptKWDbqEKdauU0FIVZAhsKNsW2Av4Q
 dVctkGxZWq+eoNWNn0wzsytig2b9uNTNx+vplc5ACzU0Teil45QRLHIMgMpF8ch6mWZbHpigCWn
 cBVzDbdpev4FfZH+mTbb3x7APZrbokXK8XDlOAmZRlq+CNsiIuRjV8HQYQtMwWwRkkKJgAhPJXK
 sg6pW+AJuLn76ZGzq7wbGggJPeYWjYCY0/XRei6fz4Zv1vyjO6/Zc1dwehw49alOFtUQy8bJf6N
 H/aBeb9yZQJsRWsy9FjrxBILFOrDm7tMG0oYwGeOv0Obn6YzORSmpjzpIskGzvV3qY86yanBzIE
 evIw7H5v12DKAuXqLysR1v20DFnjln9bYStdu61U5jj2onIIl0L0MTqR4zGPaPSl8RGj8sCjrjQ
 TkwNMs5FDUUaQziTQhCfVMH47IzRLzBxhG4h+8Hi8YmYyeSo3f96OHbPLj48g4CCnddIZr0x5+1
 MZhV0g==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7DF3AA4C66FD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:50:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42096)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJyoB-000000007C1-339Y
 for buildroot@buildroot.org; Thu, 22 Oct 2026 19:50:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 21:50:40 +0200
Message-ID: <20261022195040.3750619-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/wget2: bump version to 2.3.0
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://lists.gnu.org/archive/html/wget-dev/2026-09/msg00031.html

Added upstream patch to fix a build error detected by the Gitlab
pipelines with defconfigs br-arm-full-static, br-arm-full-nothread &
bootlin-aarch64-glibc-old that would be introduced by this bump:

net.c: In function 'wget_tcp_write':
net.c:996:24: error: 'sockfd' undeclared (first use in this function);
 did you mean 'socket'?

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5af147ae82e7f180a1a586f5f9577e59931ef5ad

 ...-of-legacy-TCP-Fast-Open-code-branch.patch | 55 +++++++++++++++++++
 package/wget2/wget2.hash                      |  2 +-
 package/wget2/wget2.mk                        |  2 +-
 3 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 package/wget2/0001-Fix-compilation-of-legacy-TCP-Fast-Open-code-branch.patch

diff --git a/package/wget2/0001-Fix-compilation-of-legacy-TCP-Fast-Open-code-branch.patch b/package/wget2/0001-Fix-compilation-of-legacy-TCP-Fast-Open-code-branch.patch
new file mode 100644
index 0000000000..6cc6419c87
--- /dev/null
+++ b/package/wget2/0001-Fix-compilation-of-legacy-TCP-Fast-Open-code-branch.patch
@@ -0,0 +1,55 @@
+From db600f40c51f0e612085f19351df3f9ad963bb5f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 23 Sep 2026 12:02:24 +0200
+Subject: [PATCH] Fix compilation of legacy TCP Fast Open code branch
+
+* .gitlab-ci.yml: Add libwget compilation with -DTEST_LEGACY_TFO_API.
+* libwget/net.c: Use legacy code branch if TEST_LEGACY_TFO_API is set,
+  (wget_tcp_write): Fix two compilation errors.
+
+Fixes https://github.com/rockdaboot/wget2/issues/391
+
+Upstream: https://gitlab.com/gnuwget/wget2/-/commit/db600f40c51f0e612085f19351df3f9ad963bb5f
+
+[Bernd: removed .gitlab-ci.yml part from patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .gitlab-ci.yml |  3 +++
+ libwget/net.c  | 10 +++++-----
+ 2 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/libwget/net.c b/libwget/net.c
+index 1cd7188c..fb7227bf 100644
+--- a/libwget/net.c
++++ b/libwget/net.c
+@@ -55,10 +55,10 @@
+ 
+ #if defined __APPLE__ && defined __MACH__ && defined CONNECT_DATA_IDEMPOTENT && defined CONNECT_RESUME_ON_READ_WRITE
+ # define TCP_FASTOPEN_OSX
+-#elif defined TCP_FASTOPEN_CONNECT // since Linux 4.11
+-# define TCP_FASTOPEN_LINUX_411
++#elif defined TCP_FASTOPEN_CONNECT && !defined TEST_LEGACY_TFO_API
++# define TCP_FASTOPEN_LINUX_411 // for Linux 4.11+: newer client API
+ #elif defined TCP_FASTOPEN && defined MSG_FASTOPEN
+-# define TCP_FASTOPEN_LINUX
++# define TCP_FASTOPEN_LINUX // for Linux 3.7+: legacy client API
+ #endif
+ 
+ #include <wget.h>
+@@ -993,11 +993,11 @@ ssize_t wget_tcp_write(wget_tcp *tcp, const char *buf, size_t count)
+ 				/* fallback from fastopen, e.g. when fastopen is disabled in system */
+ 				tcp->tcp_fastopen = 0;
+ 
+-				set_socket_timeout(sockfd, tcp->connect_timeout);
++				set_socket_timeout(tcp->sockfd, tcp->connect_timeout);
+ 
+ 				int rc = connect(tcp->sockfd, tcp->connect_addrinfo->ai_addr, tcp->connect_addrinfo->ai_addrlen);
+ 
+-				set_socket_timeout(sockfd, tcp->timeout);
++				set_socket_timeout(tcp->sockfd, tcp->timeout);
+ 
+ 				if (rc < 0
+ 					&& errno != EAGAIN
+-- 
+2.47.3
+
diff --git a/package/wget2/wget2.hash b/package/wget2/wget2.hash
index 0e5742aed4..63c90e664c 100644
--- a/package/wget2/wget2.hash
+++ b/package/wget2/wget2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d7544b13e37f18e601244fce5f5f40688ac1d6ab9541e0fbb01a32ee1fb447b4  wget2-2.2.1.tar.gz
+sha256  4f1915b2a55a789a15f2f9ada7cc44bca81418e648f76fd88a7f4dd028b2149f  wget2-2.3.0.tar.gz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/wget2/wget2.mk b/package/wget2/wget2.mk
index 21005bd708..58f95c2355 100644
--- a/package/wget2/wget2.mk
+++ b/package/wget2/wget2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET2_VERSION = 2.2.1
+WGET2_VERSION = 2.3.0
 WGET2_SITE = $(BR2_GNU_MIRROR)/wget
 WGET2_DEPENDENCIES = host-pkgconf
 WGET2_LICENSE = GPL-3.0+, LGPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
