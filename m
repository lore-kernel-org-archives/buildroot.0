Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74846C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C3070DFB;
	Mon, 19 May 2025 11:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2zNYlKj5xsh; Mon, 19 May 2025 11:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 119C270E0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 119C270E0E;
	Mon, 19 May 2025 11:00:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B50A5E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3A22417E6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4qOSV2gLZPw for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18763417FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18763417FF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16A0782A2E; Mon, 19 May 2025 10:40:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 13:54:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c230eef9075a37248488ecf0a877012115f7b58
X-Git-Newrev: fa5771d9759868365823dcaf3f8a8fc6673b681c
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.16A0782A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libiio: bump to 0.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa5771d9759868365823dcaf3f8a8fc6673b681c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch that is now merged upstream.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-xml-Fix-compatibility-with-libxml-2-12.patch | 33 ----------------------
 package/libiio/libiio.hash                         |  2 +-
 package/libiio/libiio.mk                           |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch b/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch
deleted file mode 100644
index 56c272aad3..0000000000
--- a/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b1170cacff24cdfd3858edc2285c51cadef11488 Mon Sep 17 00:00:00 2001
-From: Jan Tojnar <jtojnar@gmail.com>
-Date: Sun, 10 Dec 2023 21:52:05 +0100
-Subject: [PATCH] xml: Fix compatibility with libxml 2.12
-
-libxml 2.12.0 reorganized includes, resulting in the following no longer being in scope:
-
-- XML_PARSE_DTDVALID
-- xmlReadMemory
-- xmlReadFile
-- xmlCleanupParser
-
-Signed-off-by: Jan Tojnar <jtojnar@gmail.com>
-(cherry picked from commit bb688d04294dda45e68dfaf13e3bc1187841e52a)
-
-Upstream: https://github.com/analogdevicesinc/libiio/commit/b1170cacff24cdfd3858edc2285c51cadef11488
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- xml.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/xml.c b/xml.c
-index 33f026103..3eaed92b3 100644
---- a/xml.c
-+++ b/xml.c
-@@ -10,6 +10,7 @@
- #include "iio-private.h"
- 
- #include <errno.h>
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
- #include <string.h>
- 
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index 0f024af78c..65b4d5e5fb 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  21972599a3c143ab1f98002ad2b3f28f4aff927fde5f677478311cd4e517730c  libiio-0.25.tar.gz
+sha256  fb445fb860ef1248759f45d4273a4eff360534480ec87af64c6b8db3b99be7e5  libiio-0.26.tar.gz
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 733a0c90ed..b85bb9786a 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.25
+LIBIIO_VERSION = 0.26
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
