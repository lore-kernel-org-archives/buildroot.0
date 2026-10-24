Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA90606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XFf2N+/a
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8C160611;
	Sat, 24 Oct 2026 21:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxGmxlejMong; Sat, 24 Oct 2026 21:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A39E60626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875894;
	b=T7feRUHBAhTRuW/qCTya6LfmxqOwf6zSi7Wixrm5kyTqiALaA9SfG5O0RTQ4ADDjebjj
	 JyNbl+6CtuuYUGaTYzt7O3pC+IkrvzfHIHGO9zWGczR90YydKXp6b/W5aiT1XBnRmTeJS
	 lzDZq5p+GHtaziHqJ4GjboCuo/k01kIa/tpEZOqRZU0H7iXn+OsSQPGpf2+QQzheydT7C
	 TUKJWvBz6Gy1xUdMnc1Tq/hCsZ4dxJ9sUqEjeJ/I2jAHpYYbgqPzHgTdhfYKF6S75zwqP
	 s7AgQxUUJmBM2xixPWT/B6Pix/0HElznBpyd5f/m8oeVN40CJYb2Uolq6Kmc3BXgBUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XMmWgjt9qaYnACtBwMghX1k+CJPgXrR4KepHXmZujYE=;
	b=O62lWGqAsiZ2PsZ4KMVttlj2e/+JmM8dw4/waczqcO8e0eL6cknqfgRnWdPM+KzPBAja
	 TAclzpDg15AYylKsiAXRbdlpA8r1x+jaZrbhzLxha2YiENZhF4q6tmGXNrvD9orNzH0Bx
	 lSkE4FDEao5Lj9Q6ZBmJdiruKqcX9HyDBtaHloXe8fGu0m1V46nExs+1eNZMpO8hNxpXh
	 kMvFFKTvi7N6IBglKjKO1DiMXRg4wWc9LEyxHxwEVuxxoa3jYErSnAl71tMpyt8v3I5fm
	 TiO01dvTRMZ4Qv+BoWH5+BJRBbwkP1zE083PpcQ2CDFq0LD+n4wmPQOoptAeHML3FiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875894;
	bh=XMmWgjt9qaYnACtBwMghX1k+CJPgXrR4KepHXmZujYE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XFf2N+/aP05uwQuNbZln4GRKfynayMJR9U3eIifmmXqNKqDeun4xPFuZMpoLactEj
	 z57dz1u7UN2IBZ97ADjLrVuLa8gwc8fVci4yQ1Ffg11eK+9bqOvb4S5pGrD32Au27j
	 naUYvuuQbYk+F7YezCsoyl3pED3VXCStcdxtC2d+ZXcTw9WnU0NznwLwyjZ5tmfSzX
	 rcrbvFcuDaU1fAWd+bND860N633pirUoDVaiQUsVA1eBwvZQoMJeLHDs3MfVZL2fku
	 OOrXailPPBTTfXV9YTUned7GwrFQZkupKGaxSu1nxj+eU+Ks5UnH0eaMslU9j8KX6K
	 /E7cNe/A52G6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A39E60626;
	Sat, 24 Oct 2026 21:04:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B8AC3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 716F360626
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id facVmqhCzUns for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:04:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B677C60611
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875891;
 b=CYr1T6qAHrfXo3l1kN8joEE2R/aGhw44T+oMGFkRChFNC4bHQWYf8DadRZdxiEZb5ET/
 ba9o0uKtPpE9QJmLTKSjN0Hh7xHkhIc5esLDzeLAkPQOCdZYM3Tn0QPhDdu53oSpBiPuz
 qaehEhCq/bge0xsQetgTlfGh4PvspCz34O3KtkJ5IuioZwGW/BtZH/rCasv4VCNFJGFqA
 vfWsgEKaeMbM2t1kQPf/DlsDGv3xareYJHSJEx+rba7VQJUMQW2rZGN+oT5SbPbBxkevM
 kSDes1D3TxzmPV4kHn+maH/qfyTon7wPmS5YuW5NgUr11+qrV92gA+jfpFwi5ItClAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aAZAFoZPkQ5PCrAIDzlqgDwAlVhgYy5zCl/A2a7gMWM=;
 b=c/vRfs4B4SSXpCWkpIaS3MAu2XKWWy7bLnQnned3SuSV/zibNXV0ZTVSLAE2p35YXGsz
 xeFjDT/jhO00My/LbOAU+pDsWoyv/ejzFyhZfYxCzt/eXhQMJJLNxUUZYommwkYhm80ZM
 fQanxwHq3zIJPvWRwtOJLIK4pkUrs0AhqFHbkL+fpasGo6EIxZB9gOfNmfqjK1NjcZkoW
 dDlSa3UCNiWDy34qkAZnSJXgY0GbZE0Eby0qoV6Ok7T4YRTuxf2gLbDfkANLuX5VmMoTx
 H1mX/OJiGPSd/7GkxZPQ35kpE9zP+EQCLC9Cy6rISnMCR1x11a6is57b+lTyEP6ysDg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B677C60611
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:04:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CB799CC81; Sat, 24 Oct 2026 21:03:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ba3feb93ad1a98c72c856a1cecbd195bf98a37d
X-Git-Newrev: 3272ba790b30561d923cf8ad1548ad22d5c109c3
X-Patchwork-Hint: ignore
Message-Id: <20261024210326.8CB799CC81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump version to 7.3
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
Content-Type: multipart/mixed; boundary="===============8988208736247196329=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8988208736247196329==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3272ba790b30561d923cf8ad1548ad22d5c109c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strace/strace/releases/tag/v7.3

Removed patch which is included in this release:
https://github.com/strace/strace/commit/ade09b7ac2dba43d7d9097a9c9cb8f6517393d9e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../strace/0001-defs.h-fix-build-with-uClibc.patch | 41 ----------------------
 package/strace/strace.hash                         |  4 +--
 package/strace/strace.mk                           |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/strace/0001-defs.h-fix-build-with-uClibc.patch b/package/strace/0001-defs.h-fix-build-with-uClibc.patch
deleted file mode 100644
index 120121a499..0000000000
--- a/package/strace/0001-defs.h-fix-build-with-uClibc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 1fd644054b06189871502b3fc02f98d97060125e Mon Sep 17 00:00:00 2001
-Message-ID: <1fd644054b06189871502b3fc02f98d97060125e.1788801670.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 7 Sep 2026 20:11:51 +0300
-Subject: [PATCH] defs.h: fix build with uClibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit ee5459531280f ("open: refactor sprint_open_modes64 to support
-multiple xlat tables") added a reference to va_list, but did not add the
-required header. This breaks build with uClibc:
-
-In file included from bjm.c:12:
-defs.h:1060:53: error: unknown type name ‘va_list’
- 1060 |                                    enum xlat_style, va_list xlats);
-      |                                                     ^~~~~~~
-
-Include stdarg.h to fix the build.
-
-Upstream: https://github.com/strace/strace/pull/420
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- src/defs.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/defs.h b/src/defs.h
-index 91aa32c085fe..3cdae04d19f2 100644
---- a/src/defs.h
-+++ b/src/defs.h
-@@ -24,6 +24,7 @@
- # include <unistd.h>
- # include <stdlib.h>
- # include <stdio.h>
-+# include <stdarg.h>
- /* Open-coding isprint(ch) et al proved more efficient than calling
-  * generalized libc interface. We don't *want* to do non-ASCII anyway.
-  */
--- 
-2.53.0
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 0be750c96b..cbf11ea68e 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
-# From https://github.com/strace/strace/releases/tag/v7.2
-sha256  4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e3c0d6d4b709fe5  strace-7.2.tar.xz
+# From https://github.com/strace/strace/releases/tag/v7.3
+sha256  529634c40910895a9a1f3c5c1e65da2ca9ed72fb158dfc4bcc89efdf05e39b72  strace-7.3.tar.xz
 # Locally computed
 sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 9634a6d02b..8eadb7eba4 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 7.2
+STRACE_VERSION = 7.3
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+

--===============8988208736247196329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8988208736247196329==--
