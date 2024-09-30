Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC8DCE8375
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 17:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA6680E8C;
	Mon, 30 Sep 2024 17:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OADrrq4pBZ2; Mon, 30 Sep 2024 17:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01F9180E8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01F9180E8E;
	Mon, 30 Sep 2024 17:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 193441BF290
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 17:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1127180E8E
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 17:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKphEpjZiA33 for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 17:10:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D83080E8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D83080E8C
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D83080E8C
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 17:10:46 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a34517248dso13080825ab.2
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 10:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727716244; x=1728321044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nl8mjrX9cfgntiZWQzlfRtV7z75qTakj9/AbHtozinQ=;
 b=l02nCoDAXouNdTBRtZwkWoAOWXMVpLaDOC8tYPo0qAhomPq5VrXv15RJuJ0zx0sFSm
 rkVerXw58sjoxR+eK1ZoHxQupAqkugnnQESU6CCrEU68EQBGVhAcNTMpmV5oJOeTqMkC
 XcZT/IxgoVl/GVEWAruMmrNHg1vSCO2CqevqaIyN4zU8qK+sYGAIUY+GMURZ6MoCig58
 rBZJ/SM6iBCZu0/y1miY/cK66hRmoeJmQnDsF5T7xXzuYgXcp/xLz6nIjJCwvSFuC0Cm
 Qnxuir1esvJmtR+tYBNBdhoBGsBlSOqddlMSlYXQljCPetQLStXxgtoHu8PUkwXzvVbX
 xvTQ==
X-Gm-Message-State: AOJu0YyAj+LXNdIh8r2v8sU9zuKGnUTRa4+fQjepQhA39B4PEhMR9LKS
 lpC0NjJkqcGbLfbKVKLd6y2LEP8SEPw3iumpoDckEPrNodpnDf2RVm75cw==
X-Google-Smtp-Source: AGHT+IFj/SxudywtWln3FUtVs/J2UoglfCJZUCLYkFJUHbgstLpSFwToiA3AHBxnsxpl70WfiClQsw==
X-Received: by 2002:a05:6e02:1c24:b0:3a0:8eb3:5160 with SMTP id
 e9e14a558f8ab-3a34516a29fmr111618595ab.11.1727716243740; 
 Mon, 30 Sep 2024 10:10:43 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344df3e8dsm25323455ab.85.2024.09.30.10.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 10:10:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 11:10:41 -0600
Message-Id: <20240930171041.398061-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727716244; x=1728321044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nl8mjrX9cfgntiZWQzlfRtV7z75qTakj9/AbHtozinQ=;
 b=Xk0bLTAhKJoWhIMz6/qomMfB1fb2jN8CPTsVbI/P51y9XngufXpTMQq1FPjVpojuTT
 15In+aJdrOM7iyEYlJyE6ADZvSpwr0Ng4CNn2sFlo63aTecEj99Gz/HjfpEKU62L7AG1
 vjisB7p6ncYdgo7nwlxZoyefvVLmn4p4xAJxtFJ1NTCy6VtFGFdAja2KJq0yQOE1ndxM
 /f38dtSVlxYSSvGTUQOqI8xGzT9zCP5MaxAK43736Bj0Ybyo1Zt/JH3MFYsY0pVhclEv
 72tLEzNg2L32VP3g+YEDBAd8SrGmlgdNBLNmRF3FD3uFfZ4qBcGCTbcn8AGj2X7HbClo
 7Jxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xk0bLTAh
Subject: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.4.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop cups hash patches which are now upstream.

Rebase remaining patches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...move-man-from-BUILDDIRS-in-configure.patch |   7 +-
 package/cups/0002-Do-not-use-genstrings.patch |   8 +-
 ...03-Sanitize-the-installation-process.patch |  20 +-
 ...0004-Remove-PIE-flags-from-the-build.patch |   8 +-
 ...-support-for-MacOS-Win-SSL-libs-back.patch | 349 ------------------
 ...sion-does-not-support-several-hashes.patch |  30 --
 package/cups/cups.hash                        |   2 +-
 package/cups/cups.mk                          |   2 +-
 8 files changed, 23 insertions(+), 403 deletions(-)
 delete mode 100644 package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch
 delete mode 100644 package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index 6b81a93de2..30c3ddb48f 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -1,4 +1,4 @@
-From 6bc1d15250841cf17d307cfb4f35c960c23d8797 Mon Sep 17 00:00:00 2001
+From d3c595f551d2efc516c879fd6553263bed5c1aac Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 29 May 2016 19:31:50 +0200
 Subject: [PATCH] Remove man from BUILDDIRS in configure
@@ -15,7 +15,7 @@ Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
-index 3a162b6d5..fb629fdfd 100644
+index 613f01ddf..6f1bcb07e 100644
 --- a/config-scripts/cups-common.m4
 +++ b/config-scripts/cups-common.m4
 @@ -462,7 +462,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
@@ -27,7 +27,6 @@ index 3a162b6d5..fb629fdfd 100644
  ], [core], [
      BUILDDIRS="tools examples locale"
  ], [corelite], [
-
 -- 
-2.17.1
+2.34.1
 
diff --git a/package/cups/0002-Do-not-use-genstrings.patch b/package/cups/0002-Do-not-use-genstrings.patch
index c7d6735b5f..d3edca2995 100644
--- a/package/cups/0002-Do-not-use-genstrings.patch
+++ b/package/cups/0002-Do-not-use-genstrings.patch
@@ -1,4 +1,4 @@
-From 193c8d8c55a3478ca5c9e161ce581e5794098c6d Mon Sep 17 00:00:00 2001
+From e028ca535e4150f53cd10a2deeb57b12be79fc8c Mon Sep 17 00:00:00 2001
 From: Olivier Schonken <olivier.schonken@gmail.com>
 Date: Thu, 21 Jan 2016 23:04:49 +0100
 Subject: [PATCH] Do not use genstrings
@@ -23,10 +23,10 @@ Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/ppdc/Makefile b/ppdc/Makefile
-index 32e2e0b..7b18879 100644
+index e36ed1190..d42d7e64e 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
-@@ -186,8 +186,6 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+@@ -187,8 +187,6 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
  	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
  		libcupsppdc.a $(LINKCUPSSTATIC)
  	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
@@ -36,5 +36,5 @@ index 32e2e0b..7b18879 100644
  
  #
 -- 
-2.17.1
+2.34.1
 
diff --git a/package/cups/0003-Sanitize-the-installation-process.patch b/package/cups/0003-Sanitize-the-installation-process.patch
index 75a68487c6..418653cfba 100644
--- a/package/cups/0003-Sanitize-the-installation-process.patch
+++ b/package/cups/0003-Sanitize-the-installation-process.patch
@@ -1,4 +1,4 @@
-From e35f809c435c224954a5c7bff3f5729c5b3bc0ba Mon Sep 17 00:00:00 2001
+From 61177952e054be9569ce011218ab032c03b4db5a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Thu, 21 Jan 2016 23:21:06 +0100
 Subject: [PATCH] Sanitize the installation process
@@ -30,10 +30,10 @@ Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
  4 files changed, 17 insertions(+), 18 deletions(-)
 
 diff --git a/Makedefs.in b/Makedefs.in
-index 3afef0a..3e4f1bd 100644
+index a2342d5c0..0d8df733b 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
-@@ -40,14 +40,14 @@ SHELL		=	/bin/sh
+@@ -46,14 +46,14 @@ SHELL		=	/bin/sh
  # Installation programs...
  #
  
@@ -55,10 +55,10 @@ index 3afef0a..3e4f1bd 100644
  #
  # Default user, group, and system groups for the scheduler...
 diff --git a/conf/Makefile b/conf/Makefile
-index 933d7d9..6ac5e19 100644
+index 62aa0c6fd..3cced869c 100644
 --- a/conf/Makefile
 +++ b/conf/Makefile
-@@ -72,11 +72,11 @@ install:	all install-data install-headers install-libs install-exec
+@@ -67,11 +67,11 @@ install:	all install-data install-headers install-libs install-exec
  install-data:
  	for file in $(KEEP); do \
  		if test -r $(SERVERROOT)/$$file ; then \
@@ -74,10 +74,10 @@ index 933d7d9..6ac5e19 100644
  	$(INSTALL_DIR) -m 755 $(DATADIR)/mime
  	for file in $(REPLACE); do \
 diff --git a/notifier/Makefile b/notifier/Makefile
-index 3206dd0..c34a4d7 100644
+index fa2c7f2f7..34f7a0d6b 100644
 --- a/notifier/Makefile
 +++ b/notifier/Makefile
-@@ -62,7 +62,7 @@ install:	all install-data install-headers install-libs install-exec
+@@ -57,7 +57,7 @@ install:	all install-data install-headers install-libs install-exec
  #
  
  install-data:
@@ -87,10 +87,10 @@ index 3206dd0..c34a4d7 100644
  
  #
 diff --git a/scheduler/Makefile b/scheduler/Makefile
-index 251f017..25f2f5f 100644
+index 57b169387..aefa89719 100644
 --- a/scheduler/Makefile
 +++ b/scheduler/Makefile
-@@ -146,28 +146,27 @@ install-data:
+@@ -142,28 +142,27 @@ install-data:
  	echo Creating $(SERVERBIN)/driver...
  	$(INSTALL_DIR) -m 755 $(SERVERBIN)/driver
  	echo Creating $(SERVERROOT)...
@@ -127,5 +127,5 @@ index 251f017..25f2f5f 100644
  		echo Installing init scripts...; \
  		$(INSTALL_DIR) -m 755 $(BUILDROOT)$(INITDIR)/init.d; \
 -- 
-2.6.4
+2.34.1
 
diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
index c2765dff09..e4081d0e07 100644
--- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
+++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
@@ -1,4 +1,4 @@
-From b341a1e1fce48012fc5bcf39337488fd33210616 Mon Sep 17 00:00:00 2001
+From 212275de62cd42ef71bbd37cebd9da6266ca5f15 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sun, 3 Jul 2016 12:20:21 +0200
 Subject: [PATCH] Remove PIE flags from the build
@@ -20,10 +20,10 @@ Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makedefs.in b/Makedefs.in
-index 5f1d32f..d669ea8 100644
+index 0d8df733b..2560c0c36 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
-@@ -155,7 +155,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
+@@ -156,7 +156,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
  			$(ONDEMANDFLAGS) $(OPTIONS)
  ALL_DSOFLAGS	=	-L../cups @ARCHFLAGS@ @RELROFLAGS@ $(DSOFLAGS) $(OPTIM)
  ALL_LDFLAGS	=	-L../cups @LDARCHFLAGS@ @RELROFLAGS@ $(LDFLAGS)  \
@@ -33,5 +33,5 @@ index 5f1d32f..d669ea8 100644
  ARFLAGS		=	@ARFLAGS@
  BACKLIBS	=	@BACKLIBS@
 -- 
-2.17.1
+2.34.1
 
diff --git a/package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch b/package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch
deleted file mode 100644
index 57c6b61437..0000000000
--- a/package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch
+++ /dev/null
@@ -1,349 +0,0 @@
-From c6cd5e9c10edc68caf6936a3d3274f758e9cd03d Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Tue, 3 Oct 2023 13:59:40 +0200
-Subject: [PATCH] cups/hash.c: Put support for MacOS/Win SSL libs back
-
-- I mustn't remove their support in patch release - this should happen in
-2.5 only.
-- I have put back support for several hashes as well - they
-should be removed in 2.5.
-- restrict usage of second block hashing only if OpenSSL/LibreSSL/GnuTLS
-  is available
-
-Upstream: https://github.com/OpenPrinting/cups/commit/c6cd5e9c10edc68caf6936a3d3274f758e9cd03d
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cups/hash.c | 271 +++++++++++++++++++++++++++++++++++++++++++++++++---
- 1 file changed, 260 insertions(+), 11 deletions(-)
-
-diff --git a/cups/hash.c b/cups/hash.c
-index 93ca552c8..c447bab4e 100644
---- a/cups/hash.c
-+++ b/cups/hash.c
-@@ -12,8 +12,13 @@
- #include "md5-internal.h"
- #ifdef HAVE_OPENSSL
- #  include <openssl/evp.h>
--#else // HAVE_GNUTLS
-+#elif defined(HAVE_GNUTLS)
- #  include <gnutls/crypto.h>
-+#elif __APPLE__
-+#  include <CommonCrypto/CommonDigest.h>
-+#elif _WIN32
-+#  include <windows.h>
-+#  include <bcrypt.h>
- #endif // HAVE_OPENSSL
- 
- 
-@@ -193,17 +198,18 @@ hash_data(const char    *algorithm,	// I - Algorithm
-           const void    *b,		// I - Second block or `NULL` for none
-           size_t        blen)		// I - Length of second block or `0` for none
- {
-+#if defined(HAVE_OPENSSL) || defined(HAVE_GNUTLS)
-   unsigned	hashlen;		// Length of hash
-   unsigned char	hashtemp[64];		// Temporary hash buffer
--#ifdef HAVE_OPENSSL
--  const EVP_MD	*md = NULL;		// Message digest implementation
--  EVP_MD_CTX	*ctx;			// Context
--#else // HAVE_GNUTLS
--  gnutls_digest_algorithm_t alg = GNUTLS_DIG_UNKNOWN;
--					// Algorithm
--  gnutls_hash_hd_t ctx;			// Context
--#endif // HAVE_OPENSSL
-+#else
-+  if (strcmp(algorithm, "md5") && (b || blen != 0))
-+  {
-+    // Second block hashing is not supported without OpenSSL or GnuTLS
-+    _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unsupported without GnuTLS or OpenSSL/LibreSSL."), 1);
- 
-+    return (-1);
-+  }
-+#endif
- 
-   if (!strcmp(algorithm, "md5"))
-   {
-@@ -223,6 +229,10 @@ hash_data(const char    *algorithm,	// I - Algorithm
-   }
- 
- #ifdef HAVE_OPENSSL
-+  const EVP_MD	*md = NULL;		// Message digest implementation
-+  EVP_MD_CTX	*ctx;			// Context
-+
-+
-   if (!strcmp(algorithm, "sha"))
-   {
-     // SHA-1
-@@ -244,6 +254,14 @@ hash_data(const char    *algorithm,	// I - Algorithm
-   {
-     md = EVP_sha512();
-   }
-+  else if (!strcmp(algorithm, "sha2-512_224"))
-+  {
-+    md = EVP_sha512_224();
-+  }
-+  else if (!strcmp(algorithm, "sha2-512_256"))
-+  {
-+    md = EVP_sha512_256();
-+  }
- 
-   if (md)
-   {
-@@ -262,7 +280,13 @@ hash_data(const char    *algorithm,	// I - Algorithm
-     return ((ssize_t)hashlen);
-   }
- 
--#else // HAVE_GNUTLS
-+#elif defined(HAVE_GNUTLS)
-+  gnutls_digest_algorithm_t	alg = GNUTLS_DIG_UNKNOWN;	// Algorithm
-+  gnutls_hash_hd_t		ctx;				// Context
-+  unsigned char		temp[64];			// Temporary hash buffer
-+  size_t			tempsize = 0;			// Truncate to this size?
-+
-+
-   if (!strcmp(algorithm, "sha"))
-   {
-     // SHA-1
-@@ -284,9 +308,32 @@ hash_data(const char    *algorithm,	// I - Algorithm
-   {
-     alg = GNUTLS_DIG_SHA512;
-   }
-+  else if (!strcmp(algorithm, "sha2-512_224"))
-+  {
-+    alg      = GNUTLS_DIG_SHA512;
-+    tempsize = 28;
-+  }
-+  else if (!strcmp(algorithm, "sha2-512_256"))
-+  {
-+    alg      = GNUTLS_DIG_SHA512;
-+    tempsize = 32;
-+  }
- 
-   if (alg != GNUTLS_DIG_UNKNOWN)
-   {
-+    if (tempsize > 0)
-+    {
-+      // Truncate result to tempsize bytes...
-+
-+      if (hashsize < tempsize)
-+        goto too_small;
-+
-+      gnutls_hash_fast(alg, a, alen, temp);
-+      memcpy(hash, temp, tempsize);
-+
-+      return ((ssize_t)tempsize);
-+    }
-+
-     hashlen = gnutls_hash_get_len(alg);
- 
-     if (hashlen > hashsize)
-@@ -302,7 +349,209 @@ hash_data(const char    *algorithm,	// I - Algorithm
- 
-     return ((ssize_t)hashlen);
-   }
--#endif // HAVE_OPENSSL
-+
-+#elif __APPLE__
-+  if (!strcmp(algorithm, "sha"))
-+  {
-+    // SHA-1...
-+
-+    CC_SHA1_CTX	ctx;			// SHA-1 context
-+
-+    if (hashsize < CC_SHA1_DIGEST_LENGTH)
-+      goto too_small;
-+
-+    CC_SHA1_Init(&ctx);
-+    CC_SHA1_Update(&ctx, a, (CC_LONG)alen);
-+    CC_SHA1_Final(hash, &ctx);
-+
-+    return (CC_SHA1_DIGEST_LENGTH);
-+  }
-+#  ifdef CC_SHA224_DIGEST_LENGTH
-+  else if (!strcmp(algorithm, "sha2-224"))
-+  {
-+    CC_SHA256_CTX	ctx;		// SHA-224 context
-+
-+    if (hashsize < CC_SHA224_DIGEST_LENGTH)
-+      goto too_small;
-+
-+    CC_SHA224_Init(&ctx);
-+    CC_SHA224_Update(&ctx, a, (CC_LONG)alen);
-+    CC_SHA224_Final(hash, &ctx);
-+
-+    return (CC_SHA224_DIGEST_LENGTH);
-+  }
-+#  endif /* CC_SHA224_DIGEST_LENGTH */
-+  else if (!strcmp(algorithm, "sha2-256"))
-+  {
-+    CC_SHA256_CTX	ctx;		// SHA-256 context
-+
-+    if (hashsize < CC_SHA256_DIGEST_LENGTH)
-+      goto too_small;
-+
-+    CC_SHA256_Init(&ctx);
-+    CC_SHA256_Update(&ctx, a, (CC_LONG)alen);
-+    CC_SHA256_Final(hash, &ctx);
-+
-+    return (CC_SHA256_DIGEST_LENGTH);
-+  }
-+  else if (!strcmp(algorithm, "sha2-384"))
-+  {
-+    CC_SHA512_CTX	ctx;		// SHA-384 context
-+
-+    if (hashsize < CC_SHA384_DIGEST_LENGTH)
-+      goto too_small;
-+
-+    CC_SHA384_Init(&ctx);
-+    CC_SHA384_Update(&ctx, a, (CC_LONG)alen);
-+    CC_SHA384_Final(hash, &ctx);
-+
-+    return (CC_SHA384_DIGEST_LENGTH);
-+  }
-+  else if (!strcmp(algorithm, "sha2-512"))
-+  {
-+    CC_SHA512_CTX	ctx;		// SHA-512 context
-+
-+    if (hashsize < CC_SHA512_DIGEST_LENGTH)
-+      goto too_small;
-+
-+    CC_SHA512_Init(&ctx);
-+    CC_SHA512_Update(&ctx, a, (CC_LONG)alen);
-+    CC_SHA512_Final(hash, &ctx);
-+
-+    return (CC_SHA512_DIGEST_LENGTH);
-+  }
-+#  ifdef CC_SHA224_DIGEST_LENGTH
-+  else if (!strcmp(algorithm, "sha2-512_224"))
-+  {
-+    CC_SHA512_CTX	ctx;		// SHA-512 context
-+    unsigned char	temp[CC_SHA512_DIGEST_LENGTH];
-+                                        // SHA-512 hash
-+
-+    // SHA2-512 truncated to 224 bits (28 bytes)...
-+
-+    if (hashsize < CC_SHA224_DIGEST_LENGTH)
-+      goto too_small;
-+
-+    CC_SHA512_Init(&ctx);
-+    CC_SHA512_Update(&ctx, a, (CC_LONG)alen);
-+    CC_SHA512_Final(temp, &ctx);
-+
-+    memcpy(hash, temp, CC_SHA224_DIGEST_LENGTH);
-+
-+    return (CC_SHA224_DIGEST_LENGTH);
-+  }
-+#  endif // CC_SHA224_DIGEST_LENGTH
-+  else if (!strcmp(algorithm, "sha2-512_256"))
-+  {
-+    CC_SHA512_CTX	ctx;		// SHA-512 context
-+    unsigned char	temp[CC_SHA512_DIGEST_LENGTH];
-+                                        // SHA-512 hash
-+
-+    // SHA2-512 truncated to 256 bits (32 bytes)...
-+
-+    if (hashsize < CC_SHA256_DIGEST_LENGTH)
-+      goto too_small;
-+
-+    CC_SHA512_Init(&ctx);
-+    CC_SHA512_Update(&ctx, a, (CC_LONG)alen);
-+    CC_SHA512_Final(temp, &ctx);
-+
-+    memcpy(hash, temp, CC_SHA256_DIGEST_LENGTH);
-+
-+    return (CC_SHA256_DIGEST_LENGTH);
-+  }
-+
-+#elif _WIN32
-+  // Use Windows CNG APIs to perform hashing...
-+  BCRYPT_ALG_HANDLE	alg;		// Algorithm handle
-+  LPCWSTR		algid = NULL;	// Algorithm ID
-+  ssize_t		hashlen;	// Hash length
-+  NTSTATUS		status;		// Status of hash
-+  unsigned char		temp[64];	// Temporary hash buffer
-+  size_t		tempsize = 0;	// Truncate to this size?
-+
-+
-+  if (!strcmp(algorithm, "sha"))
-+  {
-+    algid   = BCRYPT_SHA1_ALGORITHM;
-+    hashlen = 20;
-+  }
-+  else if (!strcmp(algorithm, "sha2-256"))
-+  {
-+    algid   = BCRYPT_SHA256_ALGORITHM;
-+    hashlen = 32;
-+  }
-+  else if (!strcmp(algorithm, "sha2-384"))
-+  {
-+    algid   = BCRYPT_SHA384_ALGORITHM;
-+    hashlen = 48;
-+  }
-+  else if (!strcmp(algorithm, "sha2-512"))
-+  {
-+    algid   = BCRYPT_SHA512_ALGORITHM;
-+    hashlen = 64;
-+  }
-+  else if (!strcmp(algorithm, "sha2-512_224"))
-+  {
-+    algid   = BCRYPT_SHA512_ALGORITHM;
-+    hashlen = tempsize = 28;
-+  }
-+  else if (!strcmp(algorithm, "sha2-512_256"))
-+  {
-+    algid   = BCRYPT_SHA512_ALGORITHM;
-+    hashlen = tempsize = 32;
-+  }
-+
-+  if (algid)
-+  {
-+    if (hashsize < (size_t)hashlen)
-+      goto too_small;
-+
-+    if ((status = BCryptOpenAlgorithmProvider(&alg, algid, NULL, 0)) < 0)
-+    {
-+      DEBUG_printf(("2cupsHashData: BCryptOpenAlgorithmProvider returned %d.", status));
-+
-+      if (status == STATUS_INVALID_PARAMETER)
-+	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Bad algorithm parameter."), 1);
-+      else
-+	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to access cryptographic provider."), 1);
-+
-+      return (-1);
-+    }
-+
-+    if (tempsize > 0)
-+    {
-+      // Do a truncated SHA2-512 hash...
-+      status = BCryptHash(alg, NULL, 0, (PUCHAR)a, (ULONG)alen, temp, sizeof(temp));
-+      memcpy(hash, temp, hashlen);
-+    }
-+    else
-+    {
-+      // Hash directly to buffer...
-+      status = BCryptHash(alg, NULL, 0, (PUCHAR)a, (ULONG)alen, hash, (ULONG)hashlen);
-+    }
-+
-+    BCryptCloseAlgorithmProvider(alg, 0);
-+
-+    if (status < 0)
-+    {
-+      DEBUG_printf(("2cupsHashData: BCryptHash returned %d.", status));
-+
-+      if (status == STATUS_INVALID_PARAMETER)
-+	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Bad hashing parameter."), 1);
-+      else
-+	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Hashing failed."), 1);
-+
-+      return (-1);
-+    }
-+
-+    return (hashlen);
-+  }
-+
-+#else
-+  if (hashsize < 64)
-+    goto too_small;
-+#endif // __APPLE__
- 
-   // Unknown hash algorithm...
-   _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unknown hash algorithm."), 1);
diff --git a/package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch b/package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch
deleted file mode 100644
index be4c6b469d..0000000000
--- a/package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0dd97fcaeeb16ed836e8542d75e2396fb1d129d9 Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Tue, 3 Oct 2023 14:39:33 +0200
-Subject: [PATCH] cups/hash.c: LibreSSL version does not support several hashes
-
-Upstream: https://github.com/OpenPrinting/cups/commit/0dd97fcaeeb16ed836e8542d75e2396fb1d129d9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cups/hash.c | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/cups/hash.c b/cups/hash.c
-index c447bab4e..5eefa1010 100644
---- a/cups/hash.c
-+++ b/cups/hash.c
-@@ -254,14 +254,6 @@ hash_data(const char    *algorithm,	// I - Algorithm
-   {
-     md = EVP_sha512();
-   }
--  else if (!strcmp(algorithm, "sha2-512_224"))
--  {
--    md = EVP_sha512_224();
--  }
--  else if (!strcmp(algorithm, "sha2-512_256"))
--  {
--    md = EVP_sha512_256();
--  }
- 
-   if (md)
-   {
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 2d7bbf1aa9..f826f96fe7 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c  cups-2.4.7-source.tar.gz
+sha256  9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71  cups-2.4.11-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 5d474d0fe5..31899114ef 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.7
+CUPS_VERSION = 2.4.11
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
