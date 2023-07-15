Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FC6C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BF2605A3;
	Sat, 15 Jul 2023 15:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BF2605A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKvllPZh9Y2E; Sat, 15 Jul 2023 15:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACED60C0B;
	Sat, 15 Jul 2023 15:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ACED60C0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B90C1BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02AA5605AE
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02AA5605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6AwyuabyNsB0 for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:15:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59FA660675
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FA660675
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4664586D5C; Sat, 15 Jul 2023 15:15:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 16:39:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3db2e61ce9d84247e9d72d72fad624ae471efee
X-Git-Newrev: 3c66f65a6a549930870f2c0d98abb5ca9321d2a5
X-Patchwork-Hint: ignore
Message-Id: <20230715151554.4664586D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: bump version to 3.0.9
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
Content-Type: multipart/mixed; boundary="===============8170736368942146735=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8170736368942146735==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3c66f65a6a549930870f2c0d98abb5ca9321d2a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase patches onto new version

Remove 0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch,
0006-Add-support-for-io_pgetevents_time64-syscall.patch, and
0007-Fixup-support-for-io_pgetevents_time64-syscall.patch as these are
already applied upstream

Updated license after switch to Apache license:
https://www.openssl.org/blog/blog/2021/06/17/OpenSSL3.0ReleaseCandidate/

[Bernd: fixed license file/hash]

Signed-off-by: Danny Wood <danny@rotronics.co.uk>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: update .checkpackageignore]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  3 -
 ...time-building-manpages-if-we-re-not-going.patch |  8 +-
 ...roducible-build-do-not-leak-compiler-path.patch |  8 +-
 ...he-OPENSSL_NO_MADVISE-to-disable-call-to-.patch |  2 +-
 ...erlasm-ppc-xlate.pl-add-linux64v2-flavour.patch | 64 --------------
 ...-support-for-io_pgetevents_time64-syscall.patch | 61 --------------
 ...-support-for-io_pgetevents_time64-syscall.patch | 98 ----------------------
 package/libopenssl/libopenssl.hash                 |  4 +-
 package/libopenssl/libopenssl.mk                   |  6 +-
 9 files changed, 14 insertions(+), 240 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a762d8e98b..a7bf69be39 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -790,9 +790,6 @@ package/libodb-mysql/0002-mariadb-FTBFS-fix.patch Upstream
 package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch Upstream
 package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch Upstream
 package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch Upstream
-package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch Upstream
-package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch Upstream
-package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch Upstream
 package/liboping/0001-fix-utf8-support.patch Upstream
 package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch Upstream
 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch Upstream
diff --git a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
index 6527bc23a1..ed4590dd55 100644
--- a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -19,14 +19,14 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index 40cf2c3..777d9ca 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -491,7 +491,7 @@ list-tests:
+@@ -546,7 +546,7 @@ list-tests:
  	@echo "Tests are not supported with your chosen Configure options"
  	@ : {- output_on() if !$disabled{tests}; "" -}
  
--install: install_sw install_ssldirs install_docs
-+install: install_sw install_ssldirs
+-install: install_sw install_ssldirs install_docs {- $disabled{fips} ? "" : "install_fips" -}
++install: install_sw install_ssldirs {- $disabled{fips} ? "" : "install_fips" -}
  
- uninstall: uninstall_docs uninstall_sw
+ uninstall: uninstall_docs uninstall_sw {- $disabled{fips} ? "" : "uninstall_fips" -}
  
 -- 
 2.16.3
diff --git a/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
index 820c2addf1..ea26a31075 100644
--- a/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
@@ -15,15 +15,15 @@ diff --git a/crypto/build.info b/crypto/build.info
 index 2c619c6..49ca6ab 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -10,7 +10,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
-         ppccpuid.pl pariscid.pl alphacpuid.pl arm64cpuid.pl armv4cpuid.pl
+@@ -111,7 +111,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
  
+ DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
 -GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
 +GENERATE[buildinf.h]=../util/mkbuildinf.pl "$$(basename $(CC)) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
- DEPEND[buildinf.h]=../configdata.pm
  
- GENERATE[uplink-x86.s]=../ms/uplink-x86.pl $(PERLASM_SCHEME)
+ GENERATE[uplink-x86.S]=../ms/uplink-x86.pl
+ GENERATE[uplink-x86_64.s]=../ms/uplink-x86_64.pl
 -- 
 2.20.1
 
diff --git a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
index ef40b0353a..425adea5d8 100644
--- a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
+++ b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
@@ -13,7 +13,7 @@ diff --git a/crypto/mem_sec.c b/crypto/mem_sec.c
 index 9e0f670..32c7282 100644
 --- a/crypto/mem_sec.c
 +++ b/crypto/mem_sec.c
-@@ -491,7 +491,7 @@ static int sh_init(size_t size, int minsize)
+@@ -557,7 +557,7 @@ static int sh_init(size_t size, int minsize)
      if (mlock(sh.arena, sh.arena_size) < 0)
          ret = 2;
  #endif
diff --git a/package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch b/package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch
deleted file mode 100644
index 30bddc23de..0000000000
--- a/package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 07a0bbdd179a52907485fd793f0df31c097447af Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Sun, 5 May 2019 18:25:50 +0200
-Subject: [PATCH] crypto/perlasm/ppc-xlate.pl: add linux64v2 flavour
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This is a big endian ELFv2 configuration. ELFv2 was already being
-used for little endian, and big endian was traditionally ELFv1
-but there are practical configurations that use ELFv2 with big
-endian nowadays (Adélie Linux, Void Linux, possibly Gentoo, etc.)
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/8883)
-Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
----
- crypto/perlasm/ppc-xlate.pl | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/crypto/perlasm/ppc-xlate.pl b/crypto/perlasm/ppc-xlate.pl
-index d220c6245b..eec82b8d48 100755
---- a/crypto/perlasm/ppc-xlate.pl
-+++ b/crypto/perlasm/ppc-xlate.pl
-@@ -49,7 +49,7 @@ my $globl = sub {
- 	/osx/		&& do { $name = "_$name";
- 				last;
- 			      };
--	/linux.*(32|64le)/
-+	/linux.*(32|64(le|v2))/
- 			&& do {	$ret .= ".globl	$name";
- 				if (!$$type) {
- 				    $ret .= "\n.type	$name,\@function";
-@@ -80,7 +80,7 @@ my $globl = sub {
- };
- my $text = sub {
-     my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
--    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
-+    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64(le|v2)/);
-     $ret;
- };
- my $machine = sub {
-@@ -186,7 +186,7 @@ my $vmr = sub {
- 
- # Some ABIs specify vrsave, special-purpose register #256, as reserved
- # for system use.
--my $no_vrsave = ($flavour =~ /aix|linux64le/);
-+my $no_vrsave = ($flavour =~ /aix|linux64(le|v2)/);
- my $mtspr = sub {
-     my ($f,$idx,$ra) = @_;
-     if ($idx == 256 && $no_vrsave) {
-@@ -318,7 +318,7 @@ while($line=<>) {
- 	if ($label) {
- 	    my $xlated = ($GLOBALS{$label} or $label);
- 	    print "$xlated:";
--	    if ($flavour =~ /linux.*64le/) {
-+	    if ($flavour =~ /linux.*64(le|v2)/) {
- 		if ($TYPES{$label} =~ /function/) {
- 		    printf "\n.localentry	%s,0\n",$xlated;
- 		}
--- 
-2.25.0
-
diff --git a/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch b/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch
deleted file mode 100644
index 0f59fa648e..0000000000
--- a/package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Thu, 29 Aug 2019 13:56:21 -0700
-Subject: [PATCH] Add support for io_pgetevents_time64 syscall
-
-32-bit architectures that are y2038 safe don't include syscalls that use
-32-bit time_t. Instead these architectures have suffixed syscalls that
-always use a 64-bit time_t. In the case of the io_getevents syscall the
-syscall has been replaced with the io_pgetevents_time64 syscall instead.
-
-This patch changes the io_getevents() function to use the correct
-syscall based on the avaliable syscalls and the time_t size. We will
-only use the new 64-bit time_t syscall if the architecture is using a
-64-bit time_t. This is to avoid having to deal with 32/64-bit
-conversions and relying on a 64-bit timespec struct on 32-bit time_t
-platforms. As of Linux 5.3 there are no 32-bit time_t architectures
-without __NR_io_getevents. In the future if a 32-bit time_t architecture
-wants to use the 64-bit syscalls we can handle the conversion.
-
-This fixes build failures on 32-bit RISC-V.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-(Merged from https://github.com/openssl/openssl/pull/9819)
----
- engines/e_afalg.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/engines/e_afalg.c b/engines/e_afalg.c
-index dacbe358cb..99516cb1bb 100644
---- a/engines/e_afalg.c
-+++ b/engines/e_afalg.c
-@@ -125,7 +125,23 @@ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
-                                struct io_event *events,
-                                struct timespec *timeout)
- {
-+#if defined(__NR_io_getevents)
-     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
-+#elif defined(__NR_io_pgetevents_time64)
-+    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
-+     * This simplifies the code for us as we don't need to use a 64-bit
-+     * version of timespec with a 32-bit time_t and handle converting
-+     * between 64-bit and 32-bit times and check for overflows.
-+     */
-+    if (sizeof(timeout->tv_sec) == 8)
-+        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
-+    else {
-+        errno = ENOSYS;
-+        return -1;
-+    }
-+#else
-+# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
-+#endif
- }
- 
- static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
--- 
-2.25.1
-
diff --git a/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch b/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
deleted file mode 100644
index 7b003e4836..0000000000
--- a/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From e5499a3cac1e823c3e0697e8667e952317b70cc8 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Thu, 4 Mar 2021 12:10:11 -0500
-Subject: [PATCH] Fixup support for io_pgetevents_time64 syscall
-
-This is a fixup for the original commit 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
-"Add support for io_pgetevents_time64 syscall" that didn't correctly
-work for 32-bit architecutres with a 64-bit time_t that aren't RISC-V.
-
-For a full discussion of the issue see:
-https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-Reviewed-by: Paul Dale <pauli@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/14432)
----
- engines/e_afalg.c | 55 ++++++++++++++++++++++++++++++++++++-----------
- 1 file changed, 42 insertions(+), 13 deletions(-)
-
-diff --git a/engines/e_afalg.c b/engines/e_afalg.c
-index 9480d7c24b..4e9d67db2d 100644
---- a/engines/e_afalg.c
-+++ b/engines/e_afalg.c
-@@ -121,27 +121,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
-     return syscall(__NR_io_submit, ctx, n, iocb);
- }
- 
-+/* A version of 'struct timespec' with 32-bit time_t and nanoseconds.  */
-+struct __timespec32
-+{
-+  __kernel_long_t tv_sec;
-+  __kernel_long_t tv_nsec;
-+};
-+
- static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
-                                struct io_event *events,
-                                struct timespec *timeout)
- {
-+#if defined(__NR_io_pgetevents_time64)
-+    /* Check if we are a 32-bit architecture with a 64-bit time_t */
-+    if (sizeof(*timeout) != sizeof(struct __timespec32)) {
-+        int ret = syscall(__NR_io_pgetevents_time64, ctx, min, max, events,
-+                          timeout, NULL);
-+        if (ret == 0 || errno != ENOSYS)
-+            return ret;
-+    }
-+#endif
-+
- #if defined(__NR_io_getevents)
--    return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
--#elif defined(__NR_io_pgetevents_time64)
--    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
--     * This simplifies the code for us as we don't need to use a 64-bit
--     * version of timespec with a 32-bit time_t and handle converting
--     * between 64-bit and 32-bit times and check for overflows.
--     */
--    if (sizeof(timeout->tv_sec) == 8)
--        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
-+    if (sizeof(*timeout) == sizeof(struct __timespec32))
-+        /*
-+         * time_t matches our architecture length, we can just use
-+         * __NR_io_getevents
-+         */
-+        return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
-     else {
--        errno = ENOSYS;
--        return -1;
-+        /*
-+         * We don't have __NR_io_pgetevents_time64, but we are using a
-+         * 64-bit time_t on a 32-bit architecture. If we can fit the
-+         * timeout value in a 32-bit time_t, then let's do that
-+         * and then use the __NR_io_getevents syscall.
-+         */
-+        if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
-+            struct __timespec32 ts32;
-+
-+            ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
-+            ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
-+
-+            return syscall(__NR_io_getevents, ctx, min, max, events, ts32);
-+        } else {
-+            return syscall(__NR_io_getevents, ctx, min, max, events, NULL);
-+        }
-     }
--#else
--# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
- #endif
-+
-+    errno = ENOSYS;
-+    return -1;
- }
- 
- static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
--- 
-2.25.1
-
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 708926de80..ddba5f2049 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
 # From https://www.openssl.org/source/openssl-1.1.1u.tar.gz.sha256
-sha256  e2f8d84b523eecd06c7be7626830370300fbcc15386bf5142d72758f6963ebc6  openssl-1.1.1u.tar.gz
+sha256  eb1ab04781474360f77c318ab89d8c5a03abc38e63d65a603cabbf1b00a1dc90  openssl-3.0.9.tar.gz
 
 # License files
-sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
+sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index cd3ba3df30..7a4e0dfca2 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1u
+LIBOPENSSL_VERSION = 3.0.9
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
-LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-LIBOPENSSL_LICENSE_FILES = LICENSE
+LIBOPENSSL_LICENSE = Apache-2.0
+LIBOPENSSL_LICENSE_FILES = LICENSE.txt
 LIBOPENSSL_INSTALL_STAGING = YES
 LIBOPENSSL_DEPENDENCIES = zlib
 HOST_LIBOPENSSL_DEPENDENCIES = host-zlib

--===============8170736368942146735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8170736368942146735==--
