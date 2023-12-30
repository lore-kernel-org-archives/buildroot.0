Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEF7C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF4A60BE3;
	Sat, 30 Dec 2023 17:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBF4A60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYsjMWaFznMr; Sat, 30 Dec 2023 17:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24BA060AAC;
	Sat, 30 Dec 2023 17:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24BA060AAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 065381BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF19A403BF
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF19A403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jwe4bheIrsrL for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAABC40189
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAABC40189
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9889F814D3; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:53:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00e5f52f2f3caf8f125bae400be026e7c7747c83
X-Git-Newrev: 55c80fdfb379c74c7f7e8c260dea02e0150d7614
X-Patchwork-Hint: ignore
Message-Id: <20231230175629.9889F814D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: bump to version 2.4.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=55c80fdfb379c74c7f7e8c260dea02e0150d7614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop fifth patch (already in version)

https://github.com/OpenPrinting/cups/releases/tag/v2.4.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0005-raster-interpret.c-Fix-CVE-2023-4504.patch | 45 ----------------------
 package/cups/cups.hash                             |  2 +-
 package/cups/cups.mk                               |  5 +--
 3 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch b/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch
deleted file mode 100644
index d1dff4e1fa..0000000000
--- a/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Wed, 20 Sep 2023 14:45:17 +0200
-Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
-
-We didn't check for end of buffer if it looks there is an escaped
-character - check for NULL terminator there and if found, return NULL
-as return value and in `ptr`, because a lone backslash is not
-a valid PostScript character.
-
-Upstream: https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31
-[Peter: drop CHANGES hunk]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cups/raster-interpret.c | 14 +++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
-index 6fcf731b5..b8655c8c6 100644
---- a/cups/raster-interpret.c
-+++ b/cups/raster-interpret.c
-@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
- 
- 	    cur ++;
- 
--            if (*cur == 'b')
-+	   /*
-+	    * Return NULL if we reached NULL terminator, a lone backslash
-+	    * is not a valid character in PostScript.
-+	    */
-+
-+	    if (!*cur)
-+	    {
-+	      *ptr = NULL;
-+
-+	      return (NULL);
-+	    }
-+
-+	    if (*cur == 'b')
- 	      *valptr++ = '\b';
- 	    else if (*cur == 'f')
- 	      *valptr++ = '\f';
--- 
-2.30.2
-
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 501d8c12a6..2d7bbf1aa9 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262  cups-2.4.6-source.tar.gz
+sha256  dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c  cups-2.4.7-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 4bc5eeedee..2ad5eeb5cf 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.6
+CUPS_VERSION = 2.4.7
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
@@ -13,9 +13,6 @@ CUPS_CPE_ID_VENDOR = openprinting
 CUPS_SELINUX_MODULES = cups
 CUPS_INSTALL_STAGING = YES
 
-# 0005-raster-interpret.c-Fix-CVE-2023-4504.patch
-CUPS_IGNORE_CVES += CVE-2023-4504
-
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
 define CUPS_RUN_AUTOCONF
 	cd $(@D); $(AUTOCONF) -f
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
