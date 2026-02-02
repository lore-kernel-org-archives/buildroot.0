Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5025E7FDD0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EDC94079D;
	Mon,  2 Feb 2026 21:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUghL_-um8he; Mon,  2 Feb 2026 21:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D956407EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770066826;
	bh=dhYhcA3AtUaK1iLh5Cq1C6W9MG5b08Y/tKjN0XjSTYM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OhenyYz1cCzEEHSYhXeChAe2HtvZaYcLKzVd/EAkn6spzfd0OPKtGsE/8YbzOAVRR
	 lTPYFYjyox+ZsFzqtKbMw+GNmp19haMFq8GM94c5P6saFUxNCPy5tucA7QCnCsUtVV
	 11C/iwXYxtXbE/E1vvk5ow62smakFBRlClGb9LhEFjMXQd1N38CBhXHRDYanGzBSIC
	 8gCdwdHYyI/ez1zp2tzd2sSSwHtzysP2z52LIvWTBRxNfBDiAGLqivykkEAK+SjyET
	 bEpD/POEY6MgY7803HSfzjmtX+v3vgcSXQkqvb/U7qd2VMK/FrZnFJ9da2FpJrRDvH
	 6eezjnNMmc6Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D956407EE;
	Mon,  2 Feb 2026 21:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B78F2149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C42407EE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL9bUtOHysW2 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92154079D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B92154079D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:13:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DEA6864BE; Mon,  2 Feb 2026 21:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 22:12:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b3bdcf75ecefb98a3d2c9203c7c8ad45a620029
X-Git-Newrev: 56254f6cbb8b08c25088577c5d45ed97b10097d2
X-Patchwork-Hint: ignore
Message-Id: <20260202211344.9DEA6864BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hddtemp: bump version to 0.4.4
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8120889001526230133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8120889001526230133==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=56254f6cbb8b08c25088577c5d45ed97b10097d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/vitlav/hddtemp/releases/tag/v0.4.4

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hddtemp/0001-fix-build-without-nls.patch | 40 ------------------------
 package/hddtemp/hddtemp.hash                     |  2 +-
 package/hddtemp/hddtemp.mk                       |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/hddtemp/0001-fix-build-without-nls.patch b/package/hddtemp/0001-fix-build-without-nls.patch
deleted file mode 100644
index 356b94b010..0000000000
--- a/package/hddtemp/0001-fix-build-without-nls.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c9d0d249ff013d33cf1fd5a586c16ee30095cc90 Mon Sep 17 00:00:00 2001
-From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Date: Fri, 14 Feb 2025 10:08:43 +0100
-Subject: [PATCH] fix build without nls
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-> hddtemp.c: In function ‘main’:
-> hddtemp.c:274:3: error: implicit declaration of function ‘bindtextdomain’ [-Wimplicit-function-declaration]
->   274 |   bindtextdomain (PACKAGE, LOCALEDIR);
->       |   ^~~~~~~~~~~~~~
-> hddtemp.c:275:3: error: implicit declaration of function ‘textdomain’ [-Wimplicit-function-declaration]
->   275 |   textdomain (PACKAGE);
->       |   ^~~~~~~~~~
-> make[2]: *** [Makefile:496: hddtemp-hddtemp.o] Error 1
-
-Upstream: https://github.com/vitlav/hddtemp/pull/16
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/hddtemp.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/hddtemp.c b/src/hddtemp.c
-index 64d000e..bfea556 100644
---- a/src/hddtemp.c
-+++ b/src/hddtemp.c
-@@ -270,9 +270,11 @@ int main(int argc, char* argv[]) {
-   backtrace_sigill();
-   backtrace_sigbus();
- 
-+#if ENABLE_NLS
-   setlocale (LC_ALL, "");
-   bindtextdomain (PACKAGE, LOCALEDIR);
-   textdomain (PACKAGE);
-+#endif
- 
-   show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = foreground = 0;
-   unit = DEFAULT;
diff --git a/package/hddtemp/hddtemp.hash b/package/hddtemp/hddtemp.hash
index cd82d7f89b..0348a05990 100644
--- a/package/hddtemp/hddtemp.hash
+++ b/package/hddtemp/hddtemp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  592322c64f0d5f035132249e3d051b752f5d24867514522a17285d5e72d21075  hddtemp-0.4.3.tar.gz
+sha256  e4a60223fdec5adcbf4cf6d2fe5c4a5c2eef256c7b89f8deab0e921a1f631daa  hddtemp-0.4.4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  GPL-2
diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
index 42dcb3d416..56c04331c7 100644
--- a/package/hddtemp/hddtemp.mk
+++ b/package/hddtemp/hddtemp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDDTEMP_VERSION = 0.4.3
+HDDTEMP_VERSION = 0.4.4
 HDDTEMP_SITE = $(call github,vitlav,hddtemp,v$(HDDTEMP_VERSION))
 HDDTEMP_LICENSE = GPLv2
 HDDTEMP_LICENSE_FILES = GPL-2

--===============8120889001526230133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8120889001526230133==--
