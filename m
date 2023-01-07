Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ECCC46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 19:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F78410DE;
	Sat,  7 Jan 2023 19:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F78410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nb683_XOS6gn; Sat,  7 Jan 2023 19:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE531410E5;
	Sat,  7 Jan 2023 19:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE531410E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86FB01BF421
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FC6781FEF
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC6781FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPTBWMwOMOsf for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48CE581E20
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48CE581E20
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38A708762C; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Jan 2023 20:27:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fad36fa91d9a85ce548ea7f3fd42c1c4b31564ba
X-Git-Newrev: 658ece1afa84e916503e3e949c40b3c0d24c6335
X-Patchwork-Hint: ignore
Message-Id: <20230107192932.38A708762C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: bump version to 1.2.2
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
Content-Type: multipart/mixed; boundary="===============2191091572924390458=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2191091572924390458==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=658ece1afa84e916503e3e949c40b3c0d24c6335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
  (upstream applied, see [1])

- rename 0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
  to 0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch

- remove 0003-fix-build-with-libressl.patch
  (upstream applied, see [2])

- update license file list (change from LICENSE.adoc to LICENSES/BSD-2,
  LICENSES/BSD-3, LICENSES/CC-BY-4.0, LICENSES/MIT, LICENSES/NTP)

For details see [3].

[1] https://gitlab.com/NTPsec/ntpsec/-/commit/0bea0bef36ff9cfa3ff52de25a839c283cf46cf7
[2] https://gitlab.com/NTPsec/ntpsec/-/commit/128b66ae122d7b41ce4b99f427383fd6a5923d71
[3] https://gitlab.com/NTPsec/ntpsec/-/blob/master/NEWS.adoc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch | 90 ----------------------
 ...ve-checks-for-bsd-string.h-fixes-host-co.patch} |  0
 package/ntpsec/0003-fix-build-with-libressl.patch  | 80 -------------------
 package/ntpsec/ntpsec.hash                         |  8 +-
 package/ntpsec/ntpsec.mk                           | 12 ++-
 5 files changed, 15 insertions(+), 175 deletions(-)

diff --git a/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
deleted file mode 100644
index aa3cb183c3..0000000000
--- a/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From aa9ed14c7f4d0edbda9370760b44be045638f8a0 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 4 Oct 2021 22:25:58 +0200
-Subject: [PATCH] ntptime: fix jfmt5/ofmt5 jfmt6/ofmt6 related compile failure
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use same define guard for definiton as for usage ('HAVE_STRUCT_NTPTIMEVAL_TAI'
-instead of 'NTP_API && NTP_API > 3').
-
-While at it use HAVE_STRUCT_NTPTIMEVAL_TAI define guard for the two remaining
-places using NTP_API (which is not defined by the uclibc sys/timex.h header).
-
-Fixes:
-
-  ../../ntptime/ntptime.c: In function ‘main’:
-  ../../ntptime/ntptime.c:349:17: error: ‘jfmt5’ undeclared (first use in this function); did you mean ‘jfmt6’?
-    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
-        |                 ^~~~~
-        |                 jfmt6
-  ../../ntptime/ntptime.c:349:17: note: each undeclared identifier is reported only once for each function it appears in
-  ../../ntptime/ntptime.c:349:25: error: ‘ofmt5’ undeclared (first use in this function); did you mean ‘ofmt6’?
-    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
-        |                         ^~~~~
-        |                         ofmt6
-  ../../ntptime/ntptime.c:321:15: warning: unused variable ‘jfmt6’ [-Wunused-variable]
-    321 |   const char *jfmt6 = "";
-        |               ^~~~~
-  ../../ntptime/ntptime.c:311:15: warning: unused variable ‘ofmt6’ [-Wunused-variable]
-    311 |   const char *ofmt6 = "\n";
-        |               ^~~~~
-
-[Upstream: https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1245]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- ntptime/ntptime.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/ntptime/ntptime.c b/ntptime/ntptime.c
-index ff861cb3b..7fbd09977 100644
---- a/ntptime/ntptime.c
-+++ b/ntptime/ntptime.c
-@@ -138,7 +138,7 @@ main(
- 			ntx.modes |= MOD_NANO;
- 			break;
- #endif
--#if defined NTP_API && NTP_API > 3
-+#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
- 		case 'T':
- 			ntx.modes = MOD_TAI;
- 			ntx.constant = atoi(ntp_optarg);
-@@ -222,7 +222,7 @@ main(
- #else
- "",
- #endif
--#if defined NTP_API && NTP_API > 3
-+#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
- "-T tai_offset	set TAI offset\n",
- #else
- "",
-@@ -305,21 +305,21 @@ main(
- 		const char *ofmt2 = "  time %s, (.%0*d),\n";
- 		const char *ofmt3 = "  maximum error %lu us, estimated error %lu us";
- 		const char *ofmt4 = "  ntptime=%x.%x unixtime=%x.%0*d %s";
--#if defined NTP_API && NTP_API > 3
-+#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
- 		const char *ofmt5 = ", TAI offset %ld\n";
- #else
- 		const char *ofmt6 = "\n";
--#endif /* NTP_API */
-+#endif /* HAVE_STRUCT_NTPTIMEVAL_TAI */
- 		/* JSON formats */
- 		const char *jfmt1 = "{\"gettime-code\":%d,\"gettime-status\":\"%s\",";
- 		const char *jfmt2 = "\"time\":\"%s\",\"fractional-time\":\".%0*d\",";
- 		const char *jfmt3 = "\"maximum-error\":%lu,\"estimated-error\":%lu,";
- 		const char *jfmt4 = "\"raw-ntp-time\":\"%x.%x\",\"raw-unix-time\":\"%x.%0*d %s\",";
--#if defined NTP_API && NTP_API > 3
-+#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
- 		const char *jfmt5 = "\"TAI-offset\":%d,";
- #else
- 		const char *jfmt6 = "";
--#endif /* NTP_API */
-+#endif /* HAVE_STRUCT_NTPTIMEVAL_TAI */
- 		printf(json ? jfmt1 : ofmt1, status, timex_state(status));
- 		time_frac = ntv.time.tv_frac_sec;
- #ifdef STA_NANO
--- 
-2.34.1
-
diff --git a/package/ntpsec/0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch b/package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
similarity index 100%
rename from package/ntpsec/0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
rename to package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
diff --git a/package/ntpsec/0003-fix-build-with-libressl.patch b/package/ntpsec/0003-fix-build-with-libressl.patch
deleted file mode 100644
index a5c9543157..0000000000
--- a/package/ntpsec/0003-fix-build-with-libressl.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 743f16fb3fed9a05e601226f184be236614efe9a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Aug 2022 23:35:52 +0200
-Subject: [PATCH] fix build with libressl
-
-Fix the following build failure with libressl:
-
-/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/11.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: libntp/libntp.a(ntp_random.c.1.o): in function `ntp_RAND_priv_bytes':
-ntp_random.c:(.text+0xac): undefined reference to `RAND_priv_bytes'
-
-Fixes:
- - http://autobuild.buildroot.org/results/a6a825b7f0efc7c82e8ecf792a1f9951ffb047c5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1285]
----
- attic/cmac-timing.c | 2 ++
- attic/random.c      | 8 ++++++++
- libntp/ntp_random.c | 2 +-
- 3 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/attic/cmac-timing.c b/attic/cmac-timing.c
-index 464daa76b..4f2fd3338 100644
---- a/attic/cmac-timing.c
-+++ b/attic/cmac-timing.c
-@@ -204,7 +204,9 @@ static void DoPKEY(
- 		printf("## Oops, EVP_MD_CTX_new() failed.\n");
- 		return;
- 	}
-+#ifdef EVP_MD_CTX_FLAG_FINALISE
- 	EVP_MD_CTX_set_flags(ctx, EVP_MD_CTX_FLAG_FINALISE);
-+#endif
- 
- 	clock_gettime(CLOCK_MONOTONIC, &start);
- 	for (int i = 0; i < SAMPLESIZE; i++) {
-diff --git a/attic/random.c b/attic/random.c
-index 446c68535..8530ecd25 100644
---- a/attic/random.c
-+++ b/attic/random.c
-@@ -127,7 +127,11 @@ static int do_avg_priv(unsigned int bytes) {
- 
- 	clock_gettime(CLOCK_REALTIME, &start);
- 	for (int i = 0; i < BATCHSIZE; i++) {
-+#ifdef LIBRESSL_VERSION_NUMBER
-+            err += RAND_bytes((unsigned char *)&rnd, bytes);
-+#else
-             err += RAND_priv_bytes((unsigned char *)&rnd, bytes);
-+#endif
- 	}
- 	clock_gettime(CLOCK_REALTIME, &stop);
- 
-@@ -209,7 +213,11 @@ static int do_fast_priv(unsigned bytes) {
- 
- 	for (int i = 0; i < BATCHSIZE; i++) {
-                 clock_gettime(CLOCK_REALTIME, &start);
-+#ifdef LIBRESSL_VERSION_NUMBER
-+                err += RAND_bytes((unsigned char *)&rnd, bytes);
-+#else
-                 err += RAND_priv_bytes((unsigned char *)&rnd, bytes);
-+#endif
- 		clock_gettime(CLOCK_REALTIME, &stop);
- 		sec = (stop.tv_sec-start.tv_sec);
- 		nanos = sec*BILLION + (stop.tv_nsec-start.tv_nsec);
-diff --git a/libntp/ntp_random.c b/libntp/ntp_random.c
-index 9304a790d..adb375b24 100644
---- a/libntp/ntp_random.c
-+++ b/libntp/ntp_random.c
-@@ -29,7 +29,7 @@ void ntp_RAND_bytes(unsigned char *buf, int num) {
- 
- void ntp_RAND_priv_bytes(unsigned char *buf, int num) {
- 	int err;
--#if (OPENSSL_VERSION_NUMBER > 0x1010100fL)
-+#if (OPENSSL_VERSION_NUMBER > 0x1010100fL) && !defined(LIBRESSL_VERSION_NUMBER)
- 	err = RAND_priv_bytes(buf, num);
- #else
- 	err = RAND_bytes(buf, num);
--- 
-2.35.1
-
diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 49dc4e4d52..44e04b2403 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,4 +1,8 @@
 # Locally calculated
-sha256  71c9f4bde6953bbc048bbaf278da81c451a56cc08d6772542b4ad37c67d72e89  ntpsec-NTPsec_1_2_1.tar.bz2
-sha256  b4db4de3317c3b0554ed91eb692968800bdfd6ad2c16ffbeee8ce4895ed91da4  LICENSE.adoc
+sha256  ad45f5b88d08a159bc9f44ecb79e08358d26d3d22bb6c96ab7aaa3734de130e6  ntpsec-NTPsec_1_2_2.tar.bz2
+sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2
+sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3
+sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0
+sha256  074415b57c6ba1780483d89e55f40dec3ded96c28aaf47d63c486683ba553e7c  LICENSES/MIT
+sha256  62fec6cd79721af81b7c12f1a679535235fdd22800ab17653042f024187ff274  LICENSES/NTP
 sha256  d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fadca3c0856  docs/copyright.adoc
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index ac4b90e37a..c7fa2f85a8 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -6,12 +6,18 @@
 
 NTPSEC_VERSION_MAJOR = 1
 NTPSEC_VERSION_MINOR = 2
-NTPSEC_VERSION_POINT = 1
+NTPSEC_VERSION_POINT = 2
 NTPSEC_VERSION = $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(NTPSEC_VERSION_POINT)
 NTPSEC_SOURCE = ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)
-NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT
-NTPSEC_LICENSE_FILES = LICENSE.adoc docs/copyright.adoc
+NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
+NTPSEC_LICENSE_FILES = \
+	LICENSES/BSD-2 \
+	LICENSES/BSD-3 \
+	LICENSES/CC-BY-4.0 \
+	LICENSES/MIT \
+	LICENSES/NTP \
+	docs/copyright.adoc
 
 NTPSEC_CPE_ID_VENDOR = ntpsec
 NTPSEC_CPE_ID_VERSION = $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MINOR)

--===============2191091572924390458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2191091572924390458==--
