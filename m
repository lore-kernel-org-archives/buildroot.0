Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URI_NOVOWEL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FD8C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:05:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD2B613CF
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD2B613CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1090401ED;
	Wed, 21 Jul 2021 21:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f55q3NJxMejC; Wed, 21 Jul 2021 21:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 414DC40206;
	Wed, 21 Jul 2021 21:05:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5BB1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA0B3829F2
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AIlru11OTkj for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1837829EE
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:04:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A306F8879D; Wed, 21 Jul 2021 20:30:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:58:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e22d2101e1601d118b4003190f0c7e951cc932a
X-Git-Newrev: 17e7cb481eb11c44f476d70d0a619855298ef294
X-Patchwork-Hint: ignore
Message-Id: <20210721203031.A306F8879D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlrpc: bump version to 1.54.03
 (code/stable@r3120)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=17e7cb481eb11c44f476d70d0a619855298ef294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change to SVN download (according to [1] only 1.51.x available
  via Sourceforge download)

- remove 0001-use-correct-curl-config.patch
  (upstream applied)

Changelog ([2], [3]):

  - Build: Use 'curl-config' found at configure time, not at make time.

  - Build: fix bug: ignores LDFLAGS_FOR_BUILD, LDFLAGS_PERSONAL, and
    LDFLAGS_PTHREAD when building the build tool Gennmtab.

  - Build: fix bug: won't compile with --enable-libxml2, introduced with
    Release 1.44 (December 2015).

  - Abyss: fix bug: wild memory reference when server times out waiting for
    request header. Introduced with Release 1.44 (December 2015).

[1] http://xmlrpc-c.sourceforge.net/downloading.php
[2] http://xmlrpc-c.sourceforge.net/change.html
[3] http://xmlrpc-c.sourceforge.net/change_stable.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libxmlrpc/0001-use-correct-curl-config.patch   | 70 ----------------------
 package/libxmlrpc/libxmlrpc.hash                   |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  7 ++-
 3 files changed, 5 insertions(+), 74 deletions(-)

diff --git a/package/libxmlrpc/0001-use-correct-curl-config.patch b/package/libxmlrpc/0001-use-correct-curl-config.patch
deleted file mode 100644
index f2f1c557ba..0000000000
--- a/package/libxmlrpc/0001-use-correct-curl-config.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Use correct curl-config program
-
-Instead of calling directly curl-config in src/Makefile (which ends up
-calling the wrong curl-config: the one in the PATH instead of the one
-pointed at by the environment variables at configure time), let's
-define a CURL_CONFIG variable that contains the path to the proper
-curl-config program, and use it where appropriate.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/Makefile
-===================================================================
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -57,7 +57,7 @@
-   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
-   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
-   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
--  TRANSPORT_LIBDEP += $(shell curl-config --libs)
-+  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
-   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
- endif
- ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
-Index: b/config.mk.in
-===================================================================
---- a/config.mk.in
-+++ b/config.mk.in
-@@ -32,6 +32,7 @@
- LSOCKET = @LSOCKET@
- WININET_LDADD = @WININET_LDADD@
- WININET_LIBDIR = @WININET_LIBDIR@
-+CURL_CONFIG = @CURL_CONFIG@
- CURL_LDADD = @CURL_LDADD@
- CURL_LIBDIR = @CURL_LIBDIR@
- LIBWWW_LDADD = @LIBWWW_LDADD@
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -550,6 +550,8 @@
-     dnl So we don't do any check now.  If we find out there's a problem with
-     dnl older Curls, we will revisit that.
- 
-+    AC_SUBST(CURL_CONFIG)
-+
-     CURL_LDADD=$($CURL_CONFIG --libs)
-     AC_SUBST(CURL_LDADD)
- 
-Index: b/lib/curl_transport/Makefile
-===================================================================
---- a/lib/curl_transport/Makefile
-+++ b/lib/curl_transport/Makefile
-@@ -29,7 +29,7 @@
- 
- $(SRCDIR)/common.mk: srcdir blddir
- 
--CURL_VERSION := $(shell curl-config --vernum)
-+CURL_VERSION := $(shell $(CURL_CONFIG) --vernum)
- 
- # Some time at or before Curl 7.12, <curl/types.h> became an empty file
- # (no-op).  Some time after Curl 7.18, <curl/types.h> ceased to exist.
-@@ -43,7 +43,7 @@
-   CFLAGS_LOCAL += -DNEED_CURL_TYPES_H
- endif
- 
--CURL_INCLUDES := $(shell curl-config --cflags)
-+CURL_INCLUDES := $(shell $(CURL_CONFIG) --cflags)
- # We expect that curl-config --cflags just gives us -I options, because
- # we need just the -I options for 'make dep'.  Plus, it's scary to think
- # of what any other compiler flag would do to our compile.
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 7034773204..679098d8df 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  84d20ae33f927582f821d61c0b9194aefbf1d7924590a13fa9da5ae1698aded9  xmlrpc-c-1.51.07.tgz
+sha256  08af4372ef92cd33ddfe0d68a351f3c5c0702e39bcdaa3263f2c249d5c3eda96  libxmlrpc-r3120-br2.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 0871b6e710..2853edc2ce 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.51.07
-LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
-LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
+# 1.54.03 (code/stable@r3130)
+LIBXMLRPC_VERSION = r3120
+LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/stable
+LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
 LIBXMLRPC_LICENSE_FILES = doc/COPYING
 LIBXMLRPC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
