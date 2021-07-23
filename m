Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE33C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD2B260F25
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD2B260F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 899C483B06;
	Fri, 23 Jul 2021 20:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faD2RUPbaXic; Fri, 23 Jul 2021 20:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2BED83AFE;
	Fri, 23 Jul 2021 20:09:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71ACD1BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60B58405A5
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTT2VZvT6UGq for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:08:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC9DF400D4
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 20:08:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 71TKmoURu0K6n71TLmx4GK; Fri, 23 Jul 2021 22:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627070919; bh=0UwAib3/1EuK02TKdSdBMZm+hLS1amj2B8YnZdxH5Yo=;
 h=From:To:Subject:Date:MIME-Version;
 b=P4+Mb2ThtipucwCj9F46zwsB8asZFuAUGpXUOXodmidoRKfapq29kzE24Y9SR+SB1
 CAhL/YxxdHdnVRjYIPn5IuNOKsmSGE9JKYbrXs+ttBVECq9B6IUjHc1Qhj6Pn5+ThK
 swjLTmVh8A4vWxyhxuSMuKC4ywQaRxtrfKCXVapr75Lp/TJRzJnYV5NHHWUsvXmReL
 I7zPMp4DnnREyziMGwvHiCga/oyfymfKbzZrAYdKV74u+D8/wJ5ydoQt2x0K1yWiMM
 FiPBWMUb0cwpAN+hTtANjfUFSgmEOoIQJjqe+LydlIqpJnUCRfncL9GLrd2SmY8uo6
 mVuiFsF7tmOZA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Jul 2021 22:08:36 +0200
Message-Id: <20210723200837.1802930-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723200837.1802930-1-giulio.benetti@benettiengineering.com>
References: <20210703221223.4194738d@windsurf>
 <20210723200837.1802930-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEmcMIimO2S3tgYLWc3LawtliEq4o7/zlCYwLXUaFoqGEVqWst6CDmqnGtHGAXQDE2aAAjdPWhShoPvBeStIHVYtLDXfhhWmHQLnuTWEBJF5trY64CxO
 QWYxy27PWahGjY7keFXggT6pfITDlskP1PJobmLWk61hskHXCJkawwV2MlriBHZns4X183RTDSc3XZ6XLv8lz9FYrwJXVwdOR4ypXyp3kszMAi1KviSmgL+2
 nW2EjzUIaIBZlrqhn+6EnkAvORdJhOjmL/1KZzRGP5wqFRmSl/xwmokROJJF4rjbBitYSNlaOrm7nRVpD5a1lQ==
Subject: [Buildroot] [PATCH 1/2] package/at: convert local patches to git
 format
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Convert local patches to git format. Note that some of them change name
because of use of 'git format-patch'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...Makefile.in-replace-IROOT-by-DESTDIR.patch | 21 ++++++++++---------
 ...ake-install-for-non-root-don-t-stri.patch} | 16 ++++++++------
 ...tloadavg.c-compilation-revert-to-3..patch} | 21 +++++++++++++------
 3 files changed, 36 insertions(+), 22 deletions(-)
 rename package/at/{0002-Makefile.in-make-install-fix.patch => 0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch} (90%)
 rename package/at/{0003-getloadavg.c-fix.patch => 0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch} (54%)

diff --git a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
index 856b6c8d08..f595bce9cf 100644
--- a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
@@ -1,25 +1,26 @@
-From 195d30e2e01fe2f91ed3bdaeec3982aa66b309dd Mon Sep 17 00:00:00 2001
+From d2bdcff4748f4c1961118b9467bab302b403ef9f Mon Sep 17 00:00:00 2001
 From: Marc Kleine-Budde <mkl@pengutronix.de>
 Date: Tue, 1 Dec 2009 20:57:45 +0100
-Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
+Subject: [PATCH] Makefile.in: replace IROOT by DESTDIR
 
 This patch replaces IROOT by DESTDIR, which is the autotools standard
 variable. For backwards compatibilty IROOT overwrites the DESTDIR.
 
-[Vincent: tweak the patch for the new version]
-
 Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Vincent: tweak the patch for the new version]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: convert patch to git format]
 ---
- Makefile.in | 68 ++++++++++++++++++++++++++++++++-----------------------------
+ Makefile.in | 68 ++++++++++++++++++++++++++++-------------------------
  1 file changed, 36 insertions(+), 32 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 06544f9..1f699d9 100644
+index 4c11913..61e7b1d 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -17,6 +17,10 @@ atdocdir	= $(docdir)/at
- etcdir		= @ETCDIR@
+@@ -18,6 +18,10 @@ etcdir		= @ETCDIR@
+ atjobdir	= @ATJBD@
  systemdsystemunitdir = @systemdsystemunitdir@
  
 +ifdef IROOT
@@ -29,7 +30,7 @@ index 06544f9..1f699d9 100644
  DAEMON_USERNAME	= @DAEMON_USERNAME@
  DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
  LOADAVG_MX	= @LOADAVG_MX@
-@@ -91,41 +95,41 @@ atrun: atrun.in
+@@ -93,41 +97,41 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
@@ -104,5 +105,5 @@ index 06544f9..1f699d9 100644
  
  dist: checkin $(DIST) $(LIST) Filelist.asc
 -- 
-2.4.10
+2.25.1
 
diff --git a/package/at/0002-Makefile.in-make-install-fix.patch b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
similarity index 90%
rename from package/at/0002-Makefile.in-make-install-fix.patch
rename to package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
index 831ea1a3a9..866175ddb4 100644
--- a/package/at/0002-Makefile.in-make-install-fix.patch
+++ b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
@@ -1,21 +1,25 @@
-[PATCH]: Makefile.in: fix make install for non-root, don't strip
+From 2dd7c3c5b590a3115568175acc888f8e36919d71 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Fri, 23 Jul 2021 16:47:56 +0200
+Subject: [PATCH] Makefile.in: fix make install for non-root, don't strip
 
 Buildroot will ensure all files are owned by root and stripped anyway
 (if needed) before the rootfs is created.
 
-[Vincent: tweak the patch for the new version]
-
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Vincent: tweak the patch for the new version]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: convert patch to git format]
 ---
  Makefile.in | 43 +++++++++++++++++++++----------------------
  1 file changed, 21 insertions(+), 22 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1f699d9..f313f9b 100644
+index 61e7b1d..9f89b1f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -95,41 +95,40 @@ atrun: atrun.in
+@@ -97,41 +97,40 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
@@ -79,5 +83,5 @@ index 1f699d9..f313f9b 100644
  
  dist: checkin $(DIST) $(LIST) Filelist.asc
 -- 
-2.4.10
+2.25.1
 
diff --git a/package/at/0003-getloadavg.c-fix.patch b/package/at/0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch
similarity index 54%
rename from package/at/0003-getloadavg.c-fix.patch
rename to package/at/0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch
index e0739271ef..fb515af8d9 100644
--- a/package/at/0003-getloadavg.c-fix.patch
+++ b/package/at/0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch
@@ -1,17 +1,23 @@
-[PATCH]: fix getloadavg.c compilation, revert to 3.1.10 version
+From 4eda31cea9fb3c77fe2748a65960f24ffb42f9ff Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Fri, 23 Jul 2021 16:51:17 +0200
+Subject: [PATCH] getloadavg: fix getloadavg.c compilation, revert to 3.1.10
+ version
 
 getloadavg.c shipped with 3.1.13 doesn't compile because it references
 headers not shipped. Fix it by simply reverting to the 3.1.10 version.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: convert patch to git format]
 ---
- getloadavg.c |    7 ++++---
+ getloadavg.c | 7 ++++---
  1 file changed, 4 insertions(+), 3 deletions(-)
 
-Index: at-3.1.13/getloadavg.c
-===================================================================
---- at-3.1.13.orig/getloadavg.c
-+++ at-3.1.13/getloadavg.c
+diff --git a/getloadavg.c b/getloadavg.c
+index cf5869f..23d18eb 100644
+--- a/getloadavg.c
++++ b/getloadavg.c
 @@ -66,11 +66,12 @@ Boston, MA  02110-1301  USA */
  
  /* This should always be first.  */
@@ -28,3 +34,6 @@ Index: at-3.1.13/getloadavg.c
  
  #ifndef HAVE_GETLOADAVG
  
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
