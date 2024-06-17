Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7217C27C6E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 09:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC9C40258;
	Mon, 17 Jun 2024 09:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POCryyLxk5XB; Mon, 17 Jun 2024 09:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D13B740263
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D13B740263;
	Mon, 17 Jun 2024 09:37:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F38961BF2A4
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 09:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFF0440835
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 09:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCOzOUlR_zAV for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 09:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F2A440825
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2A440825
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F2A440825
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 09:37:33 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso479904166b.0
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 02:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718617050; x=1719221850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5J2VkY1xbLXoMsvcq3IKqpx1Hjl0PHy3EPSnnLzyR6c=;
 b=GSYX8UkNL0a0kQqagq8HR9eZ+iIxkOmruU6PRilfm8FzS6isAx43uBJvLfaQEHzYVh
 UeFS5sWO9B5GaF+Xw6RFUiMGQcdRe56ezwFz0ZjmsQXHW3BrjQ3HOzjmzZsHT59TcPSs
 ca1mqsnDBL79qW2mO+DvzJtzv3DvtDn+bg4VS5gVZb73LltKBHUhmevHRM++WayjRbbk
 yc3h/tbfT5/jPQ36APqbUDLQS/WBKIFK8YAHlcv6/WdnNy/DFQ7YheK8jFdNDkFHXz1v
 /WlrsMSC4Q5Lca4rGUoHP7FVbLMFZ2US9kvh9SMsNGhSTtWv/gX0oKapbDSPfGVYwrFj
 4b5g==
X-Gm-Message-State: AOJu0Yx5jcpempTgY2+lMe6Z7xqAD19BaNkGCmmp3PjdMMeTHheDI2qH
 bLBLuATrEp2gzbM2CC4lSQ3vRvAmmA+sM3JNGZK8CbXr9bbOG5yEbqgMSQ==
X-Google-Smtp-Source: AGHT+IGF+6nD/W1VirILJMs6s0b8Fyc2rCbchF6F0bwPeJqZHIrvc0ZrAN3l0f7Ut/EPWyyUlFfG7Q==
X-Received: by 2002:a17:907:c00f:b0:a6f:6721:b06d with SMTP id
 a640c23a62f3a-a6f6721b860mr686890866b.24.1718617049730; 
 Mon, 17 Jun 2024 02:37:29 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f6ac22e57sm358091066b.177.2024.06.17.02.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 02:37:29 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 11:36:26 +0200
Message-Id: <20240617093626.38573-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1718617050; x=1719221850; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5J2VkY1xbLXoMsvcq3IKqpx1Hjl0PHy3EPSnnLzyR6c=;
 b=RYfkv7ivAk7WmM6CPNgkD/xIHrl/V32D+Xx0ejP2kVZ8bs/81jL8jDDd+qpKHDQBs7
 HAVA79Uag8ZoT4GbyPoCjFE6Wo8bpDn0davgL21P83BgqwK+VRwXI07gvhtlTptcSXlQ
 DDPK67yjLAlPM3sDBYBjR7S4vCRWWfhfhpsQ5KAvs5dfICFD4QzlqHYiM3AI03P5jW+K
 Pj53KnCDv//Gf6JtJ7R9J2Xgdd+oXt7GlXsm3ZC1xzUwb4oPJJLpYk+mRj7z2zO/3t/l
 6NkkHpy7D/1/g0+67/bhusQNZrHPXNI6+84Vsjz+UlKOJZx8NNII+7ddLyeqSIUBEYIQ
 wFSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RYfkv7iv
Subject: [Buildroot] [PATCH v2] package/ncftp: fix GCC 14.x related build
 errors
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
Cc: yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Patches were taken from Gentoo:

https://bugs.gentoo.org/921487
https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch

Fixes:
http://autobuild.buildroot.net/results/058578eae885ce6e206c25b5a24aa11b625adf88/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
    - add Upstream tags to the patches (Yann E. MORIN)

 .../ncftp/0001-ncftp-3.2.7-fix-gcc14.patch    | 19 +++++
 .../ncftp/0002-ncftp-3.2.7-fix-clang.patch    | 72 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
 create mode 100644 package/ncftp/0002-ncftp-3.2.7-fix-clang.patch

diff --git a/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
new file mode 100644
index 0000000000..e2cda631d4
--- /dev/null
+++ b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
@@ -0,0 +1,19 @@
+fix select arg detection
+
+Reference:
+ https://bugs.gentoo.org/921487
+
+Upstream: N/A, unresponsive contact email address.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -4196,7 +4196,7 @@
+ #include <sys/select.h>
+ #endif
+ #include <sys/socket.h>	/* MG: always incl */
+-extern select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
++extern int select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
+         [ac_not_found=no ; break 3],ac_not_found=yes)
+       done
+      done
diff --git a/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
new file mode 100644
index 0000000000..bed103609c
--- /dev/null
+++ b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
@@ -0,0 +1,72 @@
+Fix compilation with clang-16
+
+aclocal.m4 contains code that no longer compiles: missing headers and missing
+return types.
+
+Reference:
+ https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
+
+Upstream: N/A, unresponsive contact email address.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -3057,6 +3057,7 @@
+ #include <sys/uio.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <string.h>
+ ],[
+ struct sockaddr_un uaddr;
+ 
+@@ -3285,6 +3286,7 @@
+ #ifdef HAVE_RESOLV_H
+ #	include <resolv.h>
+ #endif
++#include <string.h>
+ ],[
+ 	/* function-body */
+ 	int len;
+@@ -3363,6 +3365,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ 		 
++			int
+ 			main(int argc, char **argv)
+ 			{
+ 				/* Note:  don't actually call readline,
+@@ -5145,6 +5148,7 @@
+ #ifdef HAVE_STDLIB_H
+ #	include <stdlib.h>
+ #endif
++#include <string.h>
+ 
+ #ifdef HAVE_NCURSES_H
+ #	define NCURSES_OPAQUE 0
+@@ -5176,6 +5180,7 @@
+ #endif
+ 
+  
++int
+ main(int argc, char **argv)
+ {
+ 	/* Note:  don't actually call curses, since it may block;
+@@ -6510,7 +6515,6 @@
+ #endif
+ #endif			/* MG */
+ 
+-int
+ int  main(void)
+ {
+ 	char *data, *data2, *data3;
+@@ -6607,8 +6611,9 @@
+ 	AC_CACHE_CHECK(whether setvbuf arguments are reversed,
+ 	  ac_cv_func_setvbuf_reversed,
+ 	[AC_TRY_RUN([#include <stdio.h>
++	$include <stdlib.h>
+ 	/* If setvbuf has the reversed format, exit 0. */
+-	main () {
++	int main (void) {
+ 	  /* This call has the arguments reversed.
+ 	     A reversed system may check and see that the address of main
+ 	     is not _IOLBF, _IONBF, or _IOFBF, and return nonzero.  */
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
