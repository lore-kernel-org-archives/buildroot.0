Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905FEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5393860EE3
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5393860EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CEF4066C;
	Sat,  9 Oct 2021 10:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2OczcSdoTp2; Sat,  9 Oct 2021 10:08:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626B740419;
	Sat,  9 Oct 2021 10:08:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FABB1BF844
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EE2D83A0A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWZtOexOqv9i for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 10:08:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 550A681BC2
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 10:08:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B69F98F29E; Sat,  9 Oct 2021 10:05:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 12:06:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec87e249237ed0ece942c277e15fcfaa4901e2e9
X-Git-Newrev: 4cb815189227bb2619d7400420351451868d52c6
X-Patchwork-Hint: ignore
Message-Id: <20211009100541.B69F98F29E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndisc6: bump to version 1.0.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cb815189227bb2619d7400420351451868d52c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS;h=e0281e4f98149f25bf6d91fbf790bf8371c9f875;hb=b706f5f01aa82aa0db678fffd15a1527f330c507

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ndisc6/0001-Fix-musl-build.patch | 34 --------------------------------
 package/ndisc6/ndisc6.hash               |  4 ++--
 package/ndisc6/ndisc6.mk                 |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/ndisc6/0001-Fix-musl-build.patch b/package/ndisc6/0001-Fix-musl-build.patch
deleted file mode 100644
index 6a13a435c5..0000000000
--- a/package/ndisc6/0001-Fix-musl-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 12787f5936c79b56b24ffe0a92f4370804070223 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 7 Nov 2019 21:41:34 +0100
-Subject: [PATCH] Fix musl build
-
-Fixes
-src/trace-tcp.c:67:24: error: 'TH_SYN' undeclared (first use in this function); did you mean 'TH_CWR'?
-  packet->th.th_flags = TH_SYN | (ecn ? (TH_ECE | TH_CWR) : 0);
-
-Musl guards TH_SYN with if defined(_GNU_SOURCE):
-https://git.musl-libc.org/cgit/musl/tree/include/netinet/tcp.h#n82
-
-Patch sent via email to upstream.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/trace-tcp.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/trace-tcp.c b/src/trace-tcp.c
-index 5aba9d4..1b367ae 100644
---- a/src/trace-tcp.c
-+++ b/src/trace-tcp.c
-@@ -21,7 +21,6 @@
- # include <config.h>
- #endif
- 
--#undef _GNU_SOURCE
- #define _DEFAULT_SOURCE 1
- 
- #include <string.h>
--- 
-2.20.1
-
diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index 381667c2cf..d76e831208 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 abb1da4a98d94e5abe1dd7b1c975de540306b0581cbbd36aff035118b2f25c1f  ndisc6-1.0.4.tar.bz2
+sha256  36932f9fc47e2844abcda7550fa1343b3af4b4208dfb61e0c9d9224aad5df351  ndisc6-1.0.5.tar.bz2
 # Locally computed
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 9845aa2c9a..ff6439e310 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.4
+NDISC6_VERSION = 1.0.5
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
