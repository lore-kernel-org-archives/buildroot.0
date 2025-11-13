Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB1DCD5BB1
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35A360FA6;
	Thu, 13 Nov 2025 09:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9eUg1KirT_V; Thu, 13 Nov 2025 09:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CFF460FA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CFF460FA7;
	Thu, 13 Nov 2025 09:53:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72D9E36E
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E382D40D14
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7GIpo5XBbqn for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B2240D19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B2240D19
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5184845F4; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 10:51:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0343a58a70baccc72843b18490344b37ccb04ceb
X-Git-Newrev: 411d5fa06aa5d70bcb2553796cf894f00ad32c45
X-Patchwork-Hint: ignore
Message-Id: <20251113095342.B5184845F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dvbsnoop: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=411d5fa06aa5d70bcb2553796cf894f00ad32c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is causing build errors with newer gcc versions:

sectables.c:331:22: error: initialization of 'void (*)(void)' from
 incompatible pointer type 'void (*)(unsigned char *, int)'
 [-Wincompatible-pointer-types]
  331 |      {  0x00, 0x00,  section_PAT        },

and many more.

The latest release dates back to 2007, the latest change in the CVS-
based source repository[1] (downloaded as dvbsnoop.zip) is also from
2007. No newer or maintained forks were found.

State of upstream ticket system[2]:

  Bugs: last update 2012
  Support Requests: No open tickets found.
  Patches: last update 2010
  Feature Requests: 1 from 2021, the rest 2012 and older

Instead of fixing build errors for an unmaintained project which is not
used by any other package we remove it from buildroot.

Fixes:
https://autobuild.buildroot.net/results/ea6/ea6786248b9ecf0eb1c1c1f7cdd0202462b75e00/

[1] https://sourceforge.net/p/dvbsnoop/cvs/
[2] https://sourceforge.net/p/dvbsnoop/_list/tickets

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                      |  1 -
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/dvbsnoop/0001-musl-types-h.patch | 15 ---------------
 package/dvbsnoop/Config.in               | 21 ---------------------
 package/dvbsnoop/dvbsnoop.hash           |  3 ---
 package/dvbsnoop/dvbsnoop.mk             | 12 ------------
 8 files changed, 6 insertions(+), 54 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a6a6da598d..68882f3061 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -333,7 +333,6 @@ package/dt/0002-dt-default-source-define.patch lib_patch.Upstream
 package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch lib_patch.Upstream
 package/dvblast/0001-missing-lm.patch lib_patch.Upstream
 package/dvblast/0002-fix-int-types.patch lib_patch.Upstream
-package/dvbsnoop/0001-musl-types-h.patch lib_patch.Upstream
 package/dvdrw-tools/0001-limits.h.patch lib_patch.Upstream
 package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch lib_patch.Upstream
 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 856ae58c67..24e627a28b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_DVBSNOOP
+	bool "dvbsnoop has been removed"
+	select BR2_LEGACY
+	help
+	  dvbsnoop is unmaintained and has been removed
+
 config BR2_PACKAGE_PROCRANK_LINUX
 	bool "procrank_linux has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 50bdc3b2b1..f1da3c231a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -583,7 +583,6 @@ F:	package/jailhouse/
 F:	package/sunxi-boards/
 
 N:	Carsten Schoenert <c.schoenert@gmail.com>
-F:	package/dvbsnoop/
 F:	package/libdvbsi/
 F:	package/libsvg/
 F:	package/libsvg-cairo/
diff --git a/package/Config.in b/package/Config.in
index f42e7cc96c..f256b9356f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -495,7 +495,6 @@ endmenu
 	source "package/dtbocfg/Config.in"
 	source "package/dtv-scan-tables/Config.in"
 	source "package/dump1090/Config.in"
-	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
diff --git a/package/dvbsnoop/0001-musl-types-h.patch b/package/dvbsnoop/0001-musl-types-h.patch
deleted file mode 100644
index 1149df0d07..0000000000
--- a/package/dvbsnoop/0001-musl-types-h.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix musl build
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr dvbsnoop-1.4.50.org/src/misc/helper.h dvbsnoop-1.4.50/src/misc/helper.h
---- dvbsnoop-1.4.50.org/src/misc/helper.h	2006-01-02 20:04:56.000000000 +0100
-+++ dvbsnoop-1.4.50/src/misc/helper.h	2016-01-24 14:35:02.000000000 +0100
-@@ -16,6 +16,7 @@
- #ifndef __HELPER_H
- #define __HELPER_H
- 
-+#include <sys/types.h>
- 
- u_long outBit_Sx (int verbosity, const char *text, u_char *buf, int startbit, int bitlen);
- u_long outBit_Sx_NL (int verbosity, const char *text, u_char *buf, int startbit, int bitlen);
diff --git a/package/dvbsnoop/Config.in b/package/dvbsnoop/Config.in
deleted file mode 100644
index fb63fa4e8b..0000000000
--- a/package/dvbsnoop/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_DVBSNOOP
-	bool "dvbsnoop"
-	help
-	  Dvbsnoop is just a simple tool to analyze, view or debug a
-	  transport stream (TS), program elementary stream (PES) or even
-	  a program stream (PS). Dvbsnoop is trying to get input mostly
-	  direct from a frontend (satellite or cable tuner inside a
-	  set-top box for example) via DVB APIv3 to view into a TS, or a
-	  demux to view PES or PS (also mostly inside the set-top box or
-	  even PCI Card or USB Plug) but also from a file (recorded TS).
-	  Dvbsnoop is working well on SD transport streams but may have
-	  some limited functionality on HD transport streams
-	  (DVB-{C,S,T}2 because of missing knowledge how to handle it.
-
-	  Dvbsnoop itself doesn't do the tuning on the frontend, this
-	  has to be done by external helpers or manually driver call.
-	  The dvbsnoop tool was written while developing the software
-	  Neutrino on the set-top box DBox2.
-
-	  http://dvbsnoop.sourceforge.net
-	  http://en.wikipedia.org/wiki/DBox2
diff --git a/package/dvbsnoop/dvbsnoop.hash b/package/dvbsnoop/dvbsnoop.hash
deleted file mode 100644
index 0d88afe154..0000000000
--- a/package/dvbsnoop/dvbsnoop.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  7658498b26a5d2a0242e81f0cfafa0e43a2bec56f8674e7ac197dfc310866ec6  dvbsnoop-1.4.50.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/dvbsnoop/dvbsnoop.mk b/package/dvbsnoop/dvbsnoop.mk
deleted file mode 100644
index fdc483d22c..0000000000
--- a/package/dvbsnoop/dvbsnoop.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# dvbsnoop
-#
-################################################################################
-
-DVBSNOOP_VERSION = 1.4.50
-DVBSNOOP_SITE = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
-DVBSNOOP_LICENSE = GPL-2.0
-DVBSNOOP_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
