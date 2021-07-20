Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC85DC636C8
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:36:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C48660230
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C48660230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C29240142;
	Wed, 21 Jul 2021 02:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsr9AgHrzAU5; Wed, 21 Jul 2021 02:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F28A402BC;
	Wed, 21 Jul 2021 02:35:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4AC1BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E55E82CCB
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6jEb25XTfkl for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0304582B08
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:56:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 82FDD886BC; Tue, 20 Jul 2021 21:22:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:51:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2e93a802cbdbcd42b504c26596a076fbc4c86d1
X-Git-Newrev: 05610e04b3087a024c7ac67132f3eb0940d62268
X-Patchwork-Hint: ignore
Message-ID: <20210720212230.82FDD886BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: bump version to 1.20.1
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
Message-ID: <20210720215109.qFmK0ABFA2IuI9OebXRc1ryA0ilqbTrCyrrcQ5EBqjI@z>

commit: https://git.buildroot.net/buildroot/commit/?id=05610e04b3087a024c7ac67132f3eb0940d62268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with ./utils/test-pkg -p nginx -a on Fedora 34
45 builds, 6 skipped, 0 build failed, 0 legal-info failed

Other changes:
  - Rebase needed patches.
  - Update license hash due to year change.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x_feature_run_force_result-for-each-featu.patch | 40 +++++++++-------------
 ...nix-make-sys_nerr-guessing-cross-friendly.patch | 27 +++++++--------
 ...09-auto-os-linux-fix-build-with-libxcrypt.patch |  2 +-
 ...xed-off-by-one-write-in-ngx_resolver_copy.patch | 40 ----------------------
 package/nginx/nginx.hash                           |  4 +--
 package/nginx/nginx.mk                             |  5 +--
 6 files changed, 33 insertions(+), 85 deletions(-)

diff --git a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
index f186becdf8..ee7f3e9290 100644
--- a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
+++ b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
@@ -15,14 +15,16 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Refresh for 1.8.0.
 
 Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
+[rebased against v1.20.1]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
  auto/cc/conf            | 3 +++
  auto/cc/name            | 1 +
  auto/lib/libatomic/conf | 1 +
  auto/os/darwin          | 3 +++
  auto/os/linux           | 4 ++++
- auto/unix               | 8 ++++++++
- 6 files changed, 20 insertions(+)
+ auto/unix               | 7 +++++++
+ 6 files changed, 19 insertions(+)
 
 diff --git a/auto/cc/conf b/auto/cc/conf
 index afbca62b..ad42c800 100644
@@ -116,7 +118,7 @@ index 2c8a9bb8..eb4513ee 100644
  ngx_feature_incs="#include <sys/epoll.h>"
  ngx_feature_path=
  ngx_feature_libs=
-@@ -111,6 +112,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE"
+@@ -136,6 +137,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE"
  ngx_feature="sendfile()"
  ngx_feature_name="NGX_HAVE_SENDFILE"
  ngx_feature_run=yes
@@ -124,7 +126,7 @@ index 2c8a9bb8..eb4513ee 100644
  ngx_feature_incs="#include <sys/sendfile.h>
                    #include <errno.h>"
  ngx_feature_path=
-@@ -132,6 +134,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
+@@ -157,6 +159,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
  ngx_feature="sendfile64()"
  ngx_feature_name="NGX_HAVE_SENDFILE64"
  ngx_feature_run=yes
@@ -132,7 +134,7 @@ index 2c8a9bb8..eb4513ee 100644
  ngx_feature_incs="#include <sys/sendfile.h>
                    #include <errno.h>"
  ngx_feature_path=
-@@ -150,6 +153,7 @@ ngx_include="sys/prctl.h"; . auto/include
+@@ -175,6 +178,7 @@ ngx_include="sys/prctl.h"; . auto/include
  ngx_feature="prctl(PR_SET_DUMPABLE)"
  ngx_feature_name="NGX_HAVE_PR_SET_DUMPABLE"
  ngx_feature_run=yes
@@ -152,31 +154,23 @@ index 43d3b25a..3da00537 100644
          ngx_feature_incs="#include <sys/event.h>
                            #include <sys/time.h>"
          ngx_feature_path=
-@@ -730,6 +731,7 @@ ngx_feature_test="char buf[1]; struct iovec vec[1]; ssize_t n;
- ngx_feature="sys_nerr"
- ngx_feature_name="NGX_SYS_NERR"
- ngx_feature_run=value
-+ngx_feature_run_force_result="$ngx_force_sys_nerr"
- ngx_feature_incs='#include <errno.h>
-                   #include <stdio.h>'
- ngx_feature_path=
-@@ -744,6 +746,7 @@ if [ $ngx_found = no ]; then
-     ngx_feature="_sys_nerr"
+@@ -722,6 +723,7 @@ if [ $ngx_found = no ]; then
+     ngx_feature="sys_nerr"
      ngx_feature_name="NGX_SYS_NERR"
      ngx_feature_run=value
 +    ngx_feature_run_force_result="$ngx_force_sys_nerr"
      ngx_feature_incs='#include <errno.h>
                        #include <stdio.h>'
      ngx_feature_path=
-@@ -759,6 +762,7 @@ if [ $ngx_found = no ]; then
-     ngx_feature='maximum errno'
-     ngx_feature_name=NGX_SYS_NERR
+@@ -737,6 +739,7 @@ if [ $ngx_found = no ]; then
+     ngx_feature="_sys_nerr"
+     ngx_feature_name="NGX_SYS_NERR"
      ngx_feature_run=value
 +    ngx_feature_run_force_result="$ngx_force_sys_nerr"
      ngx_feature_incs='#include <errno.h>
-                       #include <string.h>
                        #include <stdio.h>'
-@@ -841,6 +845,7 @@ ngx_feature_test="void *p; p = memalign(4096, 4096);
+     ngx_feature_path=
+@@ -806,6 +809,7 @@ ngx_feature_test="void *p; p = memalign(4096, 4096);
  ngx_feature="mmap(MAP_ANON|MAP_SHARED)"
  ngx_feature_name="NGX_HAVE_MAP_ANON"
  ngx_feature_run=yes
@@ -184,7 +178,7 @@ index 43d3b25a..3da00537 100644
  ngx_feature_incs="#include <sys/mman.h>"
  ngx_feature_path=
  ngx_feature_libs=
-@@ -854,6 +859,7 @@ ngx_feature_test="void *p;
+@@ -819,6 +823,7 @@ ngx_feature_test="void *p;
  ngx_feature='mmap("/dev/zero", MAP_SHARED)'
  ngx_feature_name="NGX_HAVE_MAP_DEVZERO"
  ngx_feature_run=yes
@@ -192,7 +186,7 @@ index 43d3b25a..3da00537 100644
  ngx_feature_incs="#include <sys/mman.h>
                    #include <sys/stat.h>
                    #include <fcntl.h>"
-@@ -869,6 +875,7 @@ ngx_feature_test='void *p; int  fd;
+@@ -834,6 +839,7 @@ ngx_feature_test='void *p; int  fd;
  ngx_feature="System V shared memory"
  ngx_feature_name="NGX_HAVE_SYSVSHM"
  ngx_feature_run=yes
@@ -200,7 +194,7 @@ index 43d3b25a..3da00537 100644
  ngx_feature_incs="#include <sys/ipc.h>
                    #include <sys/shm.h>"
  ngx_feature_path=
-@@ -883,6 +890,7 @@ ngx_feature_test="int  id;
+@@ -848,6 +854,7 @@ ngx_feature_test="int  id;
  ngx_feature="POSIX semaphores"
  ngx_feature_name="NGX_HAVE_POSIX_SEM"
  ngx_feature_run=yes
diff --git a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
index 747a034aee..79fa4970cb 100644
--- a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
+++ b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
@@ -15,10 +15,12 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Refresh for 1.8.0.
 
 Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
+[rebased against v1.20.1]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
- auto/os/sys_nerr | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- auto/unix        | 10 ++++++++
- 2 files changed, 88 insertions(+)
+ auto/os/sys_nerr | 78 ++++++++++++++++++++++++++++++++++++++++++++++++
+ auto/unix        |  8 +++++
+ 2 files changed, 86 insertions(+)
  create mode 100644 auto/os/sys_nerr
 
 diff --git a/auto/os/sys_nerr b/auto/os/sys_nerr
@@ -109,18 +111,13 @@ diff --git a/auto/unix b/auto/unix
 index 7dbf9d1..00a7370 100755
 --- a/auto/unix
 +++ b/auto/unix
-@@ -736,6 +736,10 @@ ngx_feature_incs='#include <errno.h>
-                   #include <stdio.h>'
- ngx_feature_path=
- ngx_feature_libs=
-+
-+if false ; then
-+# Disabled because only valid for native build.
-+
- ngx_feature_test='printf("%d", sys_nerr);'
- . auto/feature
- 
-@@ -784,6 +788,12 @@ if [ $ngx_found = no ]; then
+@@ -744,10 +744,18 @@ if [ $ngx_found = no ]; then
+                       #include <stdio.h>'
+     ngx_feature_path=
+     ngx_feature_libs=
++    if false ; then
++    # Disabled because only valid for native build.
+     ngx_feature_test='printf("%d", _sys_nerr);'
      . auto/feature
  fi
  
diff --git a/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch b/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
index 7e430ffc37..8b368d946f 100644
--- a/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
+++ b/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
@@ -23,7 +23,7 @@ diff --git a/auto/os/linux b/auto/os/linux
 index 5e280eca..04682812 100644
 --- a/auto/os/linux
 +++ b/auto/os/linux
-@@ -203,6 +203,9 @@ ngx_feature_test="struct crypt_data  cd;
+@@ -232,6 +232,9 @@ ngx_feature_test="struct crypt_data  cd;
                    crypt_r(\"key\", \"salt\", &cd);"
  . auto/feature
  
diff --git a/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch b/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
deleted file mode 100644
index ba47768fe5..0000000000
--- a/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9f1dcb0c0473641730b871dee984016ff19d2c53 Mon Sep 17 00:00:00 2001
-From: Maxim Dounin <mdounin@mdounin.ru>
-Date: Tue, 25 May 2021 15:17:36 +0300
-Subject: [PATCH] Resolver: fixed off-by-one write in ngx_resolver_copy().
-
-Reported by Luis Merino, Markus Vervier, Eric Sesterhenn, X41 D-Sec GmbH.
-
-[peter@korsgaard.com: backport from upstream]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/core/ngx_resolver.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
-index 79390701..63b26193 100644
---- a/src/core/ngx_resolver.c
-+++ b/src/core/ngx_resolver.c
-@@ -4008,15 +4008,15 @@ done:
-             n = *src++;
- 
-         } else {
-+            if (dst != name->data) {
-+                *dst++ = '.';
-+            }
-+
-             ngx_strlow(dst, src, n);
-             dst += n;
-             src += n;
- 
-             n = *src++;
--
--            if (n != 0) {
--                *dst++ = '.';
--            }
-         }
- 
-         if (n == 0) {
--- 
-2.20.1
-
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 8d17931a26..06d3392a2e 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99  nginx-1.18.0.tar.gz
+sha256  e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49  nginx-1.20.1.tar.gz
 # License files, locally calculated
-sha256  28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509  LICENSE
+sha256  b57270c1f73eb6624b38b2d0a1affcec56b21fab39efbf8c837428f05cef1d73  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index e93e802fd3..36515e67cc 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.18.0
+NGINX_VERSION = 1.20.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
@@ -13,9 +13,6 @@ NGINX_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
-# 0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
-NGINX_IGNORE_CVES += CVE-2021-23017
-
 NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
 	--with-cc="$(TARGET_CC)" \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
