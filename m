Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619AEE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB53F80AD4;
	Sat, 28 Dec 2024 10:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTDY1x7NvI9B; Sat, 28 Dec 2024 10:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E54C180A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E54C180A70;
	Sat, 28 Dec 2024 10:07:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53213E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 417E480844
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4Drh_9ZEohk for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8123180884
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8123180884
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:07:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6613487504; Sat, 28 Dec 2024 10:07:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 11:02:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61a0d5cb21e777fb4b2aa49edc626ef95140ce7d
X-Git-Newrev: 1125fdde17a2635c7345e312cf17f31a8ed218b2
X-Patchwork-Hint: ignore
Message-Id: <20241228100722.6613487504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: reformat patch 0001 as git
 formatted patch
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
Content-Type: multipart/mixed; boundary="===============3898350443619749308=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3898350443619749308==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1125fdde17a2635c7345e312cf17f31a8ed218b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will make it easier to edit the patch if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 +-
 ...force-building-a-statically-linked-binary.patch | 35 ++++++++++++++++++++++
 package/monit/0001-no-force-static.patch           | 22 --------------
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8b874d22bf..37cd4c9460 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -848,7 +848,7 @@ package/minissdpd/S50minissdpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/modem-manager/S44modem-manager Shellcheck lib_sysv.Variables
 package/mongrel2/0001-Do-not-run-tests.patch lib_patch.Upstream
 package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch lib_patch.Upstream
-package/monit/0001-no-force-static.patch lib_patch.Upstream
+package/monit/0001-Do-not-force-building-a-statically-linked-binary.patch lib_patch.Upstream
 package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_patch.Upstream
 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch lib_patch.Upstream
diff --git a/package/monit/0001-Do-not-force-building-a-statically-linked-binary.patch b/package/monit/0001-Do-not-force-building-a-statically-linked-binary.patch
new file mode 100644
index 0000000000..3b576f0502
--- /dev/null
+++ b/package/monit/0001-Do-not-force-building-a-statically-linked-binary.patch
@@ -0,0 +1,35 @@
+From 5beb7918daa46bcc5106e6302f0d8434fc5a23e6 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 27 Dec 2024 22:12:02 +0100
+Subject: [PATCH] Do not force building a statically-linked binary
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Statically-linked binary do not work well with glibc, because it
+still dlopen()s the NSS libraries.
+
+Reported-by: Peter Kümmel <syntheticpp@gmx.net>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6907706a..d2d123ba 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -98,7 +98,7 @@ monit_SOURCES	= src/y.tab.c \
+                   src/statistics/Statistics.c
+ 
+ monit_LDADD 	= libmonit/libmonit.la
+-monit_LDFLAGS 	= -static $(EXTLDFLAGS)
++monit_LDFLAGS 	= $(EXTLDFLAGS)
+ 
+ man_MANS 	= monit.1
+ 
+-- 
+2.47.0
+
diff --git a/package/monit/0001-no-force-static.patch b/package/monit/0001-no-force-static.patch
deleted file mode 100644
index 4634a951f3..0000000000
--- a/package/monit/0001-no-force-static.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Do not force building a statically-linked binary
-
-Statically-linked binary do not work well with glibc, because it
-still dlopen()s the NSS libraries.
-
-Reported-by: Peter Kümmel <syntheticpp@gmx.net>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-diff -durN monit-5.7.orig/Makefile.am monit-5.7/Makefile.am
---- monit-5.7.orig/Makefile.am	2014-02-20 09:00:42.000000000 +0100
-+++ monit-5.7/Makefile.am	2014-09-05 12:49:43.711104001 +0200
-@@ -97,7 +97,7 @@
-                   src/statistics/Statistics.c
- 
- monit_LDADD 	= libmonit/libmonit.la
--monit_LDFLAGS 	= -static $(EXTLDFLAGS)
-+monit_LDFLAGS 	= $(EXTLDFLAGS)
- 
- man_MANS 	= monit.1
- 

--===============3898350443619749308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3898350443619749308==--
