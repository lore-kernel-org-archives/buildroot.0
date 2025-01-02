Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4510FC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CCA81753;
	Fri, 28 Feb 2025 16:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYECjMWL8gV3; Fri, 28 Feb 2025 16:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F30DD8476C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F30DD8476C;
	Fri, 28 Feb 2025 16:50:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF8068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1E7842EA0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFKj8i04W43L for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A23D342753
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23D342753
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9546586612; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 20:06:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 65127a8a772132c3d0905241563d1978a2b332ba
X-Git-Newrev: d58574af1cc94f5fb1f61f49d648041f0f405ac5
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.9546586612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnuplot: bump version
 to 6.0.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d58574af1cc94f5fb1f61f49d648041f0f405ac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
http://www.gnuplot.info/ReleaseNotes_6_0_2.html

patch 0002: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
[Julien:
  - add link to release note
  - fix sha256 file name in gnuplot.hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-check-for-defined-FE_UNDERFLOW.patch      | 32 ----------------------
 package/gnuplot/gnuplot.hash                       |  8 +++---
 package/gnuplot/gnuplot.mk                         |  2 +-
 3 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch b/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
deleted file mode 100644
index e84c72aaed..0000000000
--- a/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 806641b5ef504488f871b5cbd9e5c356d67d0bd1 Mon Sep 17 00:00:00 2001
-From: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Date: Tue, 24 Sep 2024 20:03:18 -0700
-Subject: [PATCH] check for defined(FE_UNDERFLOW)
-
-According to fenv(3), the macro FE_UNDERFLOW is defined by fenv.h only
-if the implementation supports handling of the underflow exception. Do
-not assume the presence of fenv.h implies FE_UNDERFLOW is defined.
-
-Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/926d2c26d31f4b69feda372c76a28643ef45359d/
-Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/806641b5ef504488f871b5cbd9e5c356d67d0bd1/
----
- src/complexfun.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/complexfun.c b/src/complexfun.c
-index 7a5d9a13f..7ddb4ed60 100644
---- a/src/complexfun.c
-+++ b/src/complexfun.c
-@@ -86,7 +86,7 @@
- 	int_error(NO_CARET, "%s: error present on entry (errno %d %s)", who, errno, strerror(errno));
- #endif
- 
--#ifdef HAVE_FENV_H
-+#if defined (HAVE_FENV_H) && defined (FE_UNDERFLOW)
- #define handle_underflow( who, var ) \
-     if (errno) { \
- 	if (fetestexcept(FE_UNDERFLOW)) { \
--- 
-2.34.1
-
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 4072338885..980fe6858d 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.1/
-md5  744fde2362fb20db6cfc58de73f96e9c  gnuplot-6.0.1.tar.gz
-sha1  ce1aaeff632c78cba2b3ca8142cf130bfd411478  gnuplot-6.0.1.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.2/
+md5  ea0931758fc180e3b1950931b9869921  gnuplot-6.0.2.tar.gz
+sha1  be803916e4ea32720b4a646f2ffc98d6ad3a0dc2  gnuplot-6.0.2.tar.gz
 # Locally computed
-sha256  e85a660c1a2a1808ff24f7e69981ffcbac66a45c9dcf711b65610b26ea71379a  gnuplot-6.0.1.tar.gz
+sha256  f68a3b0bbb7bbbb437649674106d94522c00bf2f285cce0c19c3180b1ee7e738  gnuplot-6.0.2.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index adb9ce6ad1..b363e761ef 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.1
+GNUPLOT_VERSION = 6.0.2
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
