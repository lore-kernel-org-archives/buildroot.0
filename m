Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DC7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA5960F55
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EA5960F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD4C83834;
	Sun,  1 Aug 2021 21:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZ37q-haYwEm; Sun,  1 Aug 2021 21:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 654F18376E;
	Sun,  1 Aug 2021 21:03:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF2BB1BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A7440465
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILxObwsROXZI for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 21:02:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F09AE40452
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 21:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E66D38A500; Sun,  1 Aug 2021 21:02:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:59:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b149b05cdb5cb1c54b3b78aeb2a2537f2e34fcb
X-Git-Newrev: 9fc9841db8a643858a79906438b994890690582b
X-Patchwork-Hint: ignore
Message-Id: <20210801210231.E66D38A500@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: fix build with curl
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fc9841db8a643858a79906438b994890690582b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with curl is broken since bump to version 2.17.0 in commit
eab9110afbef9c39569c4cc988aed15c48f7ce44 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e

Fixes:
 - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...kmipclient-Makefile-add-CURL-XML2-_CONFIG.patch | 71 ++++++++++++++++++++++
 package/s390-tools/s390-tools.mk                   |  1 +
 2 files changed, 72 insertions(+)

diff --git a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
new file mode 100644
index 0000000000..2f6ea5a11c
--- /dev/null
+++ b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
@@ -0,0 +1,71 @@
+From 49cd01dc97740b299119f32c822ccfd989ea7ec9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Aug 2021 21:50:21 +0200
+Subject: [PATCH] libkmipclient/Makefile: add {CURL,XML2}_CONFIG
+
+Add CURL_CONFIG and XML2_CONFIG to allow the user to configure the
+binaries used in check-dep-libkmipclient
+
+This will allow the user to avoid the following build failures raised
+since version 2.17.0 and
+https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:
+
+/bin/sh: 1: curl-config: not found
+Error: libcurl is not built with the OpenSSL backend
+make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ibm-s390-linux/s390-tools/pull/121]
+---
+ libkmipclient/Makefile | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/libkmipclient/Makefile b/libkmipclient/Makefile
+index 36efecb..addd096 100644
+--- a/libkmipclient/Makefile
++++ b/libkmipclient/Makefile
+@@ -50,6 +50,9 @@ detect-openssl-version.dep:
+ 	echo "}" >> $(TMPFILE)
+ 	mv $(TMPFILE) $@
+ 
++CURL_CONFIG ?= curl-config
++XML2_CONFIG ?= xml2-config
++
+ check-dep-libkmipclient: detect-openssl-version.dep
+ 	$(call check_dep, \
+ 		"libkmipclient", \
+@@ -67,14 +70,14 @@ check-dep-libkmipclient: detect-openssl-version.dep
+ 		"libxml/tree.h", \
+ 		"libxml2-devel", \
+ 		"HAVE_LIBXML2=0", \
+-		`xml2-config --cflags` `xml2-config --libs`)
++		`$(XML2_CONFIG) --cflags` `$(XML2_CONFIG) --libs`)
+ 	$(call check_dep, \
+ 		"libkmipclient", \
+ 		"curl/curl.h", \
+ 		"libcurl-devel", \
+ 		"HAVE_LIBCURL=0" \
+-		`curl-config --cflags` `curl-config --libs`)
+-	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
++		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
++	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
+ 	touch check-dep-libkmipclient
+ 
+ skip-libkmipclient-openssl:
+@@ -104,8 +107,8 @@ tls.o: check-dep-libkmipclient tls.c kmip.h utils.h $(rootdir)include/kmipclient
+ names.o: check-dep-libkmipclient names.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
+ utils.o: check-dep-libkmipclient utils.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
+ 
+-libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `xml2-config --cflags` `curl-config --cflags`
+-libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `xml2-config --libs` `curl-config --libs`
++libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `$(XML2_CONFIG) --cflags` `$(CURL_CONFIG) --cflags`
++libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(XML2_CONFIG) --libs` `$(CURL_CONFIG) --libs`
+ libkmipclient.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libkmipclient.map \
+ 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libkmipclient.so.$(VERM)
+ libkmipclient.so.$(VERSION): kmip.o request.o response.o attribute.o key.o ttlv.o json.o \
+-- 
+2.30.2
+
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 3b35b70dc1..578d391b74 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -19,6 +19,7 @@ S390_TOOLS_MAKE_OPTS = \
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
 S390_TOOLS_MAKE_OPTS += \
+	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
 	HAVE_CURL=1 \
 	HAVE_LIBCURL=1
 else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
