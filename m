Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A194C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB986819F5;
	Fri, 25 Aug 2023 16:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB986819F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAJ0aYg0JThs; Fri, 25 Aug 2023 16:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E53581E21;
	Fri, 25 Aug 2023 16:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E53581E21
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5A3A1BF2CB
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F0B41903
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F0B41903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6eWN9VXUdps for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:33:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58D98418FC
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58D98418FC
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80FA6A4C0432
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 18:33:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43728)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZZkd-0007C0-0q
 for buildroot@buildroot.org; Fri, 25 Aug 2023 18:33:35 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 18:33:35 +0200
Message-Id: <20230825163335.403433-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692981215;
 bh=gW3Y86dlsyuXeEhH6dey+Uts77Y4hkPkIMArdrnkRh4=;
 h=From:To:Subject:Date:From;
 b=GTVlKrAvYWiX5cqC5vu8xGYnxUkhBrgFPNyH5MlRwtvQNiloNRaw+CTtZLU0u0PC6
 Jfu+52Tq+Yca6N6+eJYAfKGluv/lJMyZV0aAwQQpNyiWXqbFxHqBMhDLEAjIEVf2Ou
 8YEZbJaMp9P3ygWKQ0sJdL2XtcWWm/n8sKLQqNKDPbmvOm6UwrTvuK2kid/oh3Jg3h
 3w9WUSKY1DBuWZ04BbUNMI5SI5nKgxWj7o3MZQcHFwnUaNXU7wd1f/dZaaOlMb7AJa
 apRfE8/SHnF+yN7DPBbx+cFbUH9xnWZ1Gk2biBOTI8gRxIuEw8b2Jos4mtOoGxm9YG
 9fJqCT8BdUTFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GTVlKrAv
Subject: [Buildroot] [PATCH/next 1/1] package/ytree: bump version to 2.05
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

Release notes: https://www.han.de/~werner/ytree.html

Removed patch which was applied upstream in a slightly changed way.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore               |  1 -
 package/ytree/0001-fix-musl.patch | 26 --------------------------
 package/ytree/ytree.hash          |  2 +-
 package/ytree/ytree.mk            |  2 +-
 4 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 package/ytree/0001-fix-musl.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d4e3c61ebe..cf5619af54 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1592,7 +1592,6 @@ package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch Upstream
 package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch Upstream
 package/ympd/0001-only-c-language.patch Upstream
 package/ympd/0002-added-forward-declarations.patch Upstream
-package/ytree/0001-fix-musl.patch Upstream
 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch Upstream
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch Upstream
 package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch Upstream
diff --git a/package/ytree/0001-fix-musl.patch b/package/ytree/0001-fix-musl.patch
deleted file mode 100644
index 0a24744669..0000000000
--- a/package/ytree/0001-fix-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix musl build
-
-Fixes
-
-  match.c.text+0x9c): undefined reference to `re_comp'
-  match.c.text+0xca): undefined reference to `re_exec'
-
-by forcing to use the 'modern' regex methods implementation instead of
-the obsolete re_comp/re_exec ([1]) one?
-
-[1] http://man7.org/linux/man-pages/man3/re_comp.3.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr ytree-1.99pl2.orig/match.c ytree-1.99pl2/match.c
---- ytree-1.99pl2.orig/match.c	2019-09-29 12:37:57.000000000 +0200
-+++ ytree-1.99pl2/match.c	2019-10-01 19:46:56.193815327 +0200
-@@ -10,7 +10,7 @@
- #include "ytree.h"
- 
- #if defined( sun ) || defined( linux ) || defined( __NeXT__ ) || defined( OSF1 ) ||  defined( __OpenBSD__ ) || defined(__NetBSD__) || defined( __FreeBSD__ ) || defined( __GNU__ )
--#define HAS_REGEX
-+#define HAS_REGCOMP
- #endif
- 
- #ifdef linux
diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 88ca8282bf..f3fbba8673 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e7a8b7f68efe6d365abe33a1d06d739ad85f22a3d54ddd0aec24a3478d66642  ytree-2.04.tar.gz
+sha256  8cf8b151e4913b5b7f7a91dffd5c7306106a42477ec44e71d62c75f66ab61a57  ytree-2.05.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index a64ebe83ed..1bd2df46b6 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.04
+YTREE_VERSION = 2.05
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
