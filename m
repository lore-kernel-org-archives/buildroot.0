Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C81CC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8614419D7;
	Thu,  6 Oct 2022 20:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8614419D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-ZJVWvTgXbt; Thu,  6 Oct 2022 20:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6F2419CE;
	Thu,  6 Oct 2022 20:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F6F2419CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9671BF310
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54134419D2
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54134419D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXVd-3kWO70c for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F7F3419CF
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F7F3419CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D88386AD7; Thu,  6 Oct 2022 20:09:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 22:09:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f24029b561fbda0953c7dbd93d2485b03873996d
X-Git-Newrev: 5d52814f60d5ed6b981dabf0cf6d439a203560e2
X-Patchwork-Hint: ignore
Message-Id: <20221006200948.0D88386AD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efibootmgr: bump to version 18
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d52814f60d5ed6b981dabf0cf6d439a203560e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches which are already applied upstream.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../efibootmgr/0001-Allow-build-with-uClibc.patch  | 40 ----------------------
 package/efibootmgr/0002-remove-extra-decl.patch    | 28 ---------------
 package/efibootmgr/efibootmgr.hash                 |  2 +-
 package/efibootmgr/efibootmgr.mk                   |  2 +-
 4 files changed, 2 insertions(+), 70 deletions(-)

diff --git a/package/efibootmgr/0001-Allow-build-with-uClibc.patch b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
deleted file mode 100644
index fd29233dc3..0000000000
--- a/package/efibootmgr/0001-Allow-build-with-uClibc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From bbfcc60497c326576bb23cb01d90115ef3cf6947 Mon Sep 17 00:00:00 2001
-From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-Date: Fri, 25 Nov 2016 20:26:52 +0200
-Subject: [PATCH] Remove unneeded <uchar.h> include
-
-This fixes the build with uClibc.
-
-Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
----
- src/efibootdump.c | 1 -
- src/eficonman.c   | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/src/efibootdump.c b/src/efibootdump.c
-index 6ff8360..7c5a1c5 100644
---- a/src/efibootdump.c
-+++ b/src/efibootdump.c
-@@ -19,7 +19,6 @@
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <uchar.h>
- #include <unistd.h>
- 
- #include "error.h"
-diff --git a/src/eficonman.c b/src/eficonman.c
-index 2c2be38..9bfae79 100644
---- a/src/eficonman.c
-+++ b/src/eficonman.c
-@@ -17,7 +17,6 @@
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <uchar.h>
- #include <unistd.h>
- 
- #define  _(String) gettext (String)
--- 
-2.10.2
-
diff --git a/package/efibootmgr/0002-remove-extra-decl.patch b/package/efibootmgr/0002-remove-extra-decl.patch
deleted file mode 100644
index f838d50a20..0000000000
--- a/package/efibootmgr/0002-remove-extra-decl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Wed, 13 Jun 2018 09:41:01 -0400
-Subject: [PATCH] remove extra decl
-
-Downloaded from upstream commit
-https://github.com/rhboot/efibootmgr/commit/99b578501643377e0b1994b2a068b790d189d5ad
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/efibootmgr.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/efibootmgr.c b/src/efibootmgr.c
-index de38f01..4e1a680 100644
---- a/src/efibootmgr.c
-+++ b/src/efibootmgr.c
-@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
- 					       "invalid numeric value %s\n",
- 					       optarg);
- 			}
--                        /* XXX efivar-36 accidentally doesn't have a public
--                         * header for this */
--			extern int efi_set_verbose(int verbosity, FILE *errlog);
- 			efi_set_verbose(opts.verbose - 2, stderr);
- 			break;
- 		case 'V':
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index fdbc9a2732..71a9826331 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  22a95ebe0d5c9fb2915b3a100450f8f37484d1dbb8b296f55b343cc84f10397d  efibootmgr-17.tar.gz
+sha256  442867d12f8525034a404fc8af3036dba8e1fc970998af2486c3b940dfad0874  efibootmgr-18.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 7e09b5f659..672a93c282 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIBOOTMGR_VERSION = 17
+EFIBOOTMGR_VERSION = 18
 EFIBOOTMGR_SITE = $(call github,rhboot,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
