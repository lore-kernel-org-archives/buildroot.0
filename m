Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97E1C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4358C40114;
	Tue, 26 Dec 2023 21:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4358C40114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eF4pXf9u7AFp; Tue, 26 Dec 2023 21:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01752409DD;
	Tue, 26 Dec 2023 21:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01752409DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B68AB1BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DBA981FA6
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBA981FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU7O4cs_nUzD for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF6E881F34
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6E881F34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A5D18361E; Tue, 26 Dec 2023 21:33:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 22:29:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f6146acb8d7165d4e06bee6e140cd96984db563
X-Git-Newrev: 6d8c7aecbb28f1703b8eec1ffb6f555c1b422b31
X-Patchwork-Hint: ignore
Message-Id: <20231226213332.9A5D18361E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flickcurl: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d8c7aecbb28f1703b8eec1ffb6f555c1b422b31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is causing some build issues, which are probably due to
the recent libxml2 upgrade:

  http://autobuild.buildroot.net/results/34d6f6c02f884ab9a2578a38ee8646e14632d6ff/

There has been no new commit upstream for the past 8 years:
https://github.com/dajobe/flickcurl, and the last release, 1.26 is
from 2014. So let's kill the package.

Fixes:

  http://autobuild.buildroot.net/results/34d6f6c02f884ab9a2578a38ee8646e14632d6ff/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                 |  7 +++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/flickcurl/Config.in      | 21 ---------------------
 package/flickcurl/flickcurl.hash |  7 -------
 package/flickcurl/flickcurl.mk   | 23 -----------------------
 6 files changed, 7 insertions(+), 53 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d46bd97442..e5822eec24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_FLICKCURL
+	bool "flickcurl package was removed"
+	select BR2_LEGACY
+	help
+	  The flickcurl package was removed because it was
+	  unmaintained upstream and causing build failures.
+
 config BR2_PACKAGE_ONEVPL
 	bool "onevpl package was renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f4adda40a8..cc089e8ff6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2386,7 +2386,6 @@ F:	package/dfu-programmer/
 F:	package/docker-compose/
 F:	package/dump1090/
 F:	package/fatcat/
-F:	package/flickcurl/
 F:	package/fscryptctl/
 F:	package/ifmetric/
 F:	package/jo/
diff --git a/package/Config.in b/package/Config.in
index 98653ff29d..14af880cb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1934,7 +1934,6 @@ menu "Networking"
 	source "package/dht/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
-	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
 	source "package/freeradius-client/Config.in"
 	source "package/gensio/Config.in"
diff --git a/package/flickcurl/Config.in b/package/flickcurl/Config.in
deleted file mode 100644
index 426ceecba1..0000000000
--- a/package/flickcurl/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_FLICKCURL
-	bool "flickcurl"
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBXML2
-	# Ensure that libcurl is built with crypto support, since
-	# flickcurl must access https:// URLs.
-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)
-	select BR2_PACKAGE_CA_CERTIFICATES # runtime
-	help
-	  Flickcurl is a C library for the Flickr API, handling
-	  creating the requests, signing, token management, calling
-	  the API, marshalling request parameters and decoding
-	  responses.
-
-	  http://librdf.org/flickcurl/
-
-config BR2_PACKAGE_FLICKCURL_UTILS
-	bool "flickcurl utilities"
-	depends on BR2_PACKAGE_FLICKCURL
-	help
-	  Install flickcurl utilites (flickcurl + flickrdf) to target.
diff --git a/package/flickcurl/flickcurl.hash b/package/flickcurl/flickcurl.hash
deleted file mode 100644
index 8c3ea1682a..0000000000
--- a/package/flickcurl/flickcurl.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  ff42a36c7c1c7d368246f6bc9b7d792ed298348e5f0f5d432e49f6803562f5a3  flickcurl-1.26.tar.gz
-# Locally computed
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE-2.0.txt
-sha256  3590f30b0fb9446a1f0a7ea5bcbb5786fa66fa362800f53d2575875d74b91909  LICENSE.html
diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
deleted file mode 100644
index 610b81f4d4..0000000000
--- a/package/flickcurl/flickcurl.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# flickcurl
-#
-################################################################################
-
-FLICKCURL_VERSION = 1.26
-FLICKCURL_SITE = http://download.dajobe.org/flickcurl
-FLICKCURL_LICENSE = LGPL-2.1+ or GPL-2.0+ or Apache-2.0+
-FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
-FLICKCURL_INSTALL_STAGING = YES
-FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
-FLICKCURL_CONF_OPTS = --without-curl-config --without-xml2-config --without-raptor
-FLICKCURL_DEPENDENCIES = libcurl libxml2 host-pkgconf
-
-ifeq ($(BR2_PACKAGE_FLICKCURL_UTILS),)
-define FLICKCURL_REMOVE_UTILS
-	rm -f $(TARGET_DIR)/usr/bin/flickcurl $(TARGET_DIR)/usr/bin/flickrdf
-endef
-FLICKCURL_POST_INSTALL_TARGET_HOOKS += FLICKCURL_REMOVE_UTILS
-endif
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
