Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084BFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CFF61056
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5CFF61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C56760ADF;
	Wed, 13 Oct 2021 18:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqNAnOznBssW; Wed, 13 Oct 2021 18:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728B360AE8;
	Wed, 13 Oct 2021 18:28:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31E7E1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B4D74052B
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGRi1uyq5VLw for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93DFC40482
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 03901958EA; Wed, 13 Oct 2021 18:24:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 576440a1d8138f5b1bd4985e6244d001ef553cc4
X-Git-Newrev: 8a2ce9784e147eb2bc76bafe0738fcf5a0a14910
X-Patchwork-Hint: ignore
Message-Id: <20211013182445.03901958EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: bump to version 2.18.0
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
Content-Type: multipart/mixed; boundary="===============0984303349885576830=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0984303349885576830==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8a2ce9784e147eb2bc76bafe0738fcf5a0a14910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-Fix-compile-errors-due-to-use-of-non-sta.patch | 135 ---------------------
 ...-Fix-compile-errors-due-to-use-of-non-sta.patch |  49 --------
 .../0003-Makefile-add-CURL-XML2-_CONFIG.patch      | 104 ----------------
 package/s390-tools/s390-tools.hash                 |   2 +-
 package/s390-tools/s390-tools.mk                   |   2 +-
 5 files changed, 2 insertions(+), 290 deletions(-)

diff --git a/package/s390-tools/0001-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch b/package/s390-tools/0001-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
deleted file mode 100644
index 725a7f51f1..0000000000
--- a/package/s390-tools/0001-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From cf6d54b333a3495244ab7bf4939b933fa9fc2108 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar@linux.ibm.com>
-Date: Mon, 19 Jul 2021 11:49:31 +0200
-Subject: [PATCH] cpumf/lshwc: Fix compile errors due to use of
- non-standard 32/64 bit types
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use standard 32- and 64-bit C types.
-
-Fixes the following compile errors with buildroot:
-In file included from lshwc.c:41:
-lshwc.h:61:2: error: unknown type name ‘__u64’
-   61 |  __u64 version;   /* Version of interface */
-      |  ^~~~~
-lshwc.h:62:2: error: unknown type name ‘__u64’
-   62 |  __u64 data_bytes;  /* # of bytes required */
-      |  ^~~~~
-lshwc.h:63:2: error: unknown type name ‘__u64’
-   63 |  __u64 cpumask_len;  /* Length of CPU mask in bytes */
-      |  ^~~~~
-lshwc.h:64:2: error: unknown type name ‘__u64’
-   64 |  __u64 *cpumask;   /* Pointer to CPU mask */
-      |  ^~~~~
-lshwc.h:65:2: error: unknown type name ‘__u64’
-   65 |  __u64 counter_sets;  /* Bit mask of counter set to get */
-      |  ^~~~~
-lshwc.h:69:2: error: unknown type name ‘__u32’
-   69 |  __u32 set;   /* Counter set number */
-      |  ^~~~~
-
-Fixes: 27a562da ("cpumf/lshwc: Program to extract complete counter sets")
-Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
----
- cpumf/lshwc.c | 10 +++++-----
- cpumf/lshwc.h | 23 ++++++++++++-----------
- 2 files changed, 17 insertions(+), 16 deletions(-)
-
-diff --git a/cpumf/lshwc.c b/cpumf/lshwc.c
-index 39c9fbe2..c7755123 100644
---- a/cpumf/lshwc.c
-+++ b/cpumf/lshwc.c
-@@ -240,7 +240,7 @@ static char *show_ctrset(unsigned long set)
- /* Parse CPU list and counter sets */
- static void parse_cpulist(char *parm, struct s390_hwctr_start *start)
- {
--	__u64 *words = start->cpumask;
-+	uint64_t *words = start->cpumask;
- 	unsigned long i, no_a, no_b;
- 	char *cp, *tokens[16];		/* Used to parse command line params */
- 	char cpubuf[256];
-@@ -300,7 +300,7 @@ static void parse_cpulist(char *parm, struct s390_hwctr_start *start)
- 	/* no_b is highest used index, swap array */
- 	start->cpumask_len = (no_b + 1) * 8;
- 	for (no_a = 0; no_a < no_b; ++no_a, --no_b) {
--		__u64 tmp =  words[no_a];
-+		uint64_t tmp =  words[no_a];
- 
- 		words[no_a] = words[no_b];
- 		words[no_b] = tmp;
-@@ -525,7 +525,7 @@ static int test_read(struct s390_hwctr_read *read)
- 			}
- 			/* Iterate over all counters in each set */
- 			for (unsigned int k = 0; k < sp->no_cnts; ++k) {
--				__u64 value;
-+				uint64_t value;
- 				void *addr = base + offset;
- 				size_t idx = ctrset_offset(sp->set) + k;
- 
-@@ -608,8 +608,8 @@ static int do_it(char *s)
- 	int rc;
- 
- 	memset(&start, 0, sizeof(start));
--	rc = max_possible_cpus / sizeof(__u64);
--	start.cpumask = alloca(max_possible_cpus / sizeof(__u64));
-+	rc = max_possible_cpus / sizeof(uint64_t);
-+	start.cpumask = alloca(max_possible_cpus / sizeof(uint64_t));
- 	memset(start.cpumask, 0, rc);
- 	parse_cpulist(s, &start);
- 	errno = 0;
-diff --git a/cpumf/lshwc.h b/cpumf/lshwc.h
-index d8044dc7..2f6c51b8 100644
---- a/cpumf/lshwc.h
-+++ b/cpumf/lshwc.h
-@@ -13,6 +13,7 @@
- #ifndef LSHWC_H
- #define LSHWC_H
- 
-+#include <stdint.h>
- #include <sys/ioctl.h>
- 
- enum {
-@@ -58,27 +59,27 @@ enum {
-  */
- 
- struct s390_hwctr_start {		/* Set CPUs to operate on */
--	__u64 version;			/* Version of interface */
--	__u64 data_bytes;		/* # of bytes required */
--	__u64 cpumask_len;		/* Length of CPU mask in bytes */
--	__u64 *cpumask;			/* Pointer to CPU mask */
--	__u64 counter_sets;		/* Bit mask of counter set to get */
-+	uint64_t version;		/* Version of interface */
-+	uint64_t data_bytes;		/* # of bytes required */
-+	uint64_t cpumask_len;		/* Length of CPU mask in bytes */
-+	uint64_t *cpumask;		/* Pointer to CPU mask */
-+	uint64_t counter_sets;		/* Bit mask of counter set to get */
- };
- 
- struct s390_hwctr_setdata {		/* Counter set data */
--	__u32 set;			/* Counter set number */
--	__u32 no_cnts;			/* # of counters stored in cv[] */
--	__u64 cv[0];			/* Counter values (variable length) */
-+	uint32_t set;			/* Counter set number */
-+	uint32_t no_cnts;		/* # of counters stored in cv[] */
-+	uint64_t cv[0];			/* Counter values (variable length) */
- };
- 
- struct s390_hwctr_cpudata {		/* Counter set data per CPU */
--	__u32 cpu_nr;			/* Counter set number */
--	__u32 no_sets;			/* # of counters sets in data[] */
-+	uint32_t cpu_nr;		/* Counter set number */
-+	uint32_t no_sets;		/* # of counters sets in data[] */
- 	struct s390_hwctr_setdata data[0];
- };
- 
- struct s390_hwctr_read {		/* Structure to get all ctr sets */
--	__u64 no_cpus;			/* Total # of CPUs data taken from */
-+	uint64_t no_cpus;		/* Total # of CPUs data taken from */
- 	struct s390_hwctr_cpudata data[0];
- };
- 
--- 
-2.31.1
-
diff --git a/package/s390-tools/0002-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch b/package/s390-tools/0002-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
deleted file mode 100644
index d1af82180e..0000000000
--- a/package/s390-tools/0002-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 727e882d77804f687179df49d96a01b10a0cf56a Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar@linux.ibm.com>
-Date: Mon, 19 Jul 2021 12:10:19 +0200
-Subject: [PATCH] cpumf/lshwc: Fix compile errors due to use of
- non-standard __BITS_PER_LONG
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use LONG_BIT provided by C standard in <limits.h>.
-
-Fixes the following compile errors with buildroot:
-lshwc.c: In function ‘parse_cpulist’:
-lshwc.c:295:15: error: ‘__BITS_PER_LONG’ undeclared (first use in this function)
-  295 |    no_a = i % __BITS_PER_LONG;
-      |               ^~~~~~~~~~~~~~~
-
-Fixes: 27a562da ("cpumf/lshwc: Program to extract complete counter sets")
-Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
----
- cpumf/lshwc.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/cpumf/lshwc.c b/cpumf/lshwc.c
-index c7755123..13f63c4d 100644
---- a/cpumf/lshwc.c
-+++ b/cpumf/lshwc.c
-@@ -17,6 +17,7 @@
- #include <err.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <linux/limits.h>
- #include <stdarg.h>
- #include <stdbool.h>
-@@ -292,8 +293,8 @@ static void parse_cpulist(char *parm, struct s390_hwctr_start *start)
- 	/* Convert the CPU list to a bitmask for kernel cpumask_t */
- 	for (i = 0, no_b = 0; i < max_possible_cpus; ++i) {
- 		if (check[i].cpu_req) {
--			no_a = i % __BITS_PER_LONG;
--			no_b = i / __BITS_PER_LONG;
-+			no_a = i % LONG_BIT;
-+			no_b = i / LONG_BIT;
- 			words[no_b] |= 1ULL << no_a;
- 		}
- 	}
--- 
-2.31.1
-
diff --git a/package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch b/package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
deleted file mode 100644
index 4ac0b8b029..0000000000
--- a/package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From c2c310e93a5af148d37323f8d873e5656dea8b64 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 1 Aug 2021 21:50:21 +0200
-Subject: [PATCH] Makefile: add {CURL,XML2}_CONFIG
-
-Add CURL_CONFIG and XML2_CONFIG to allow the user to configure the
-binaries used in check-dep-libkmipclient
-
-This will allow the user to avoid the following build failures raised
-since version 2.17.0 and
-https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:
-
-/bin/sh: 1: curl-config: not found
-Error: libcurl is not built with the OpenSSL backend
-make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1
-
-Fixes:
- - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ibm-s390-linux/s390-tools/pull/121]
----
- libekmfweb/Makefile    | 10 ++++++----
- libkmipclient/Makefile | 13 ++++++++-----
- 2 files changed, 14 insertions(+), 9 deletions(-)
-
-diff --git a/libekmfweb/Makefile b/libekmfweb/Makefile
-index 8e12fb56..1c776996 100644
---- a/libekmfweb/Makefile
-+++ b/libekmfweb/Makefile
-@@ -47,6 +47,8 @@ detect-openssl-version.dep:
- 	echo "}" >> $(TMPFILE)
- 	mv $(TMPFILE) $@
- 
-+CURL_CONFIG ?= curl-config
-+
- check-dep-libekmfweb: detect-openssl-version.dep
- 	$(call check_dep, \
- 		"libekmfweb", \
-@@ -64,8 +66,8 @@ check-dep-libekmfweb: detect-openssl-version.dep
- 		"curl/curl.h", \
- 		"libcurl-devel", \
- 		"HAVE_LIBCURL=0" \
--		`curl-config --cflags` `curl-config --libs`)
--	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
-+		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
-+	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
- 	touch check-dep-libekmfweb
- 
- skip-libekmfweb-openssl:
-@@ -83,8 +85,8 @@ ekmfweb.o: check-dep-libekmfweb ekmfweb.c utilities.h cca.h $(rootdir)include/ek
- utilities.o: check-dep-libekmfweb utilities.c utilities.h $(rootdir)include/ekmfweb/ekmfweb.h
- cca.o: check-dep-libekmfweb cca.c cca.h utilities.h $(rootdir)include/ekmfweb/ekmfweb.h
- 
--libekmfweb.so.$(VERSION): ALL_CFLAGS += -fPIC `curl-config --cflags`
--libekmfweb.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `curl-config --libs` -ldl
-+libekmfweb.so.$(VERSION): ALL_CFLAGS += -fPIC `$(CURL_CONFIG) --cflags`
-+libekmfweb.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(CURL_CONFIG) --libs` -ldl
- libekmfweb.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libekmfweb.map \
- 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libekmfweb.so.$(VERM)
- libekmfweb.so.$(VERSION): ekmfweb.o utilities.o cca.o $(libs)
-diff --git a/libkmipclient/Makefile b/libkmipclient/Makefile
-index 36efecb4..addd0965 100644
---- a/libkmipclient/Makefile
-+++ b/libkmipclient/Makefile
-@@ -50,6 +50,9 @@ detect-openssl-version.dep:
- 	echo "}" >> $(TMPFILE)
- 	mv $(TMPFILE) $@
- 
-+CURL_CONFIG ?= curl-config
-+XML2_CONFIG ?= xml2-config
-+
- check-dep-libkmipclient: detect-openssl-version.dep
- 	$(call check_dep, \
- 		"libkmipclient", \
-@@ -67,14 +70,14 @@ check-dep-libkmipclient: detect-openssl-version.dep
- 		"libxml/tree.h", \
- 		"libxml2-devel", \
- 		"HAVE_LIBXML2=0", \
--		`xml2-config --cflags` `xml2-config --libs`)
-+		`$(XML2_CONFIG) --cflags` `$(XML2_CONFIG) --libs`)
- 	$(call check_dep, \
- 		"libkmipclient", \
- 		"curl/curl.h", \
- 		"libcurl-devel", \
- 		"HAVE_LIBCURL=0" \
--		`curl-config --cflags` `curl-config --libs`)
--	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
-+		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
-+	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
- 	touch check-dep-libkmipclient
- 
- skip-libkmipclient-openssl:
-@@ -104,8 +107,8 @@ tls.o: check-dep-libkmipclient tls.c kmip.h utils.h $(rootdir)include/kmipclient
- names.o: check-dep-libkmipclient names.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
- utils.o: check-dep-libkmipclient utils.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
- 
--libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `xml2-config --cflags` `curl-config --cflags`
--libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `xml2-config --libs` `curl-config --libs`
-+libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `$(XML2_CONFIG) --cflags` `$(CURL_CONFIG) --cflags`
-+libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(XML2_CONFIG) --libs` `$(CURL_CONFIG) --libs`
- libkmipclient.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libkmipclient.map \
- 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libkmipclient.so.$(VERM)
- libkmipclient.so.$(VERSION): kmip.o request.o response.o attribute.o key.o ttlv.o json.o \
diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index fef6d1e73d..eafe7f4d7a 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c983151fe92432db0de24bb69e01194983f5cd63da2d14bea1c0123155cd49c9  s390-tools-2.17.0.tar.gz
+sha256  a1e2118152a85201984d2045033d49f7fd92e8cd0ea80ae0a5ebeb0d258cdedb  s390-tools-2.18.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index bdb3138114..6b4351ce83 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.17.0
+S390_TOOLS_VERSION = 2.18.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE

--===============0984303349885576830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0984303349885576830==--
