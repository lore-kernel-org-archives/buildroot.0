Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861AAC98312
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 08:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E1B560EE5;
	Sat, 17 Jan 2026 08:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVfYIxs7-Fvn; Sat, 17 Jan 2026 08:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D1760EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768640084;
	bh=EQS0FOCw6fOd/84IKWGebbVyJSlHH8fchgbeufh/GJw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yt8QTrF3FgjzeeGWRpqQ9f3C3SomEopv/x5qDJKme6KaZQjRfEaKLrnw9QP1FZ54n
	 ILK4YzmFLxquey1zoNPOOv1xQgQRAxwum76wjPlIYe0jv6ve3h2St+XeX5ICIhqOa8
	 vCvgYVcfXk5piLlsav9p4wVdd8FmvEmUbXrSeFdl/XWt7ntyb4wapXWMEizk7kovD7
	 UIAIffcoaJ0WVUPZGtXnZDMbVrfEehQ8hO6rmkmNyXCKLxaeBJq3Ko0Fh6rCr76gYx
	 MeA9m9vzRej5vuQb2K1Fc+N04VNvT9QcEjt5zTCYXJapQvU0nSIDXu1BaQXhDlJv7c
	 BTNvVseYtFYnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D1760EEE;
	Sat, 17 Jan 2026 08:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B25732CC
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 08:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9910E60EEE
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 08:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ph9cr8fIC8c for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 08:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1114360EE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1114360EE5
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 08:54:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEB8D88613; Sat, 17 Jan 2026 08:54:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 23:13:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e205f32a354123209e463e97987265506fdc791
X-Git-Newrev: dbd24b0bfd1d0545147fe7b476ad2d31ba05ab47
X-Patchwork-Hint: ignore
Message-Id: <20260117085440.DEB8D88613@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmbench: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============4757935996798194197=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4757935996798194197==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dbd24b0bfd1d0545147fe7b476ad2d31ba05ab47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last release dates back to 2007, switch _SITE to active fork:
https://sourceforge.net/p/lmbench/patches/3/#4472

Removed patch 0009 which is included in this bump.

Rebased remaining patches.

Sent some existing patches to new active upstream repo and added
Upstream: tags.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...x-garbage-pointer-for-lat_rpc-S-localhost.patch |  2 +
 ...ipts-build-make-it-possible-to-set-LDLIBS.patch |  5 +-
 .../0006-Add-signum-param-to-signal-handlers.patch |  3 +-
 .../0007-scripts-build-int-return-type-main.patch  | 97 ++++++++--------------
 .../lmbench/0008-Fixup-function-declarations.patch |  8 +-
 .../0009-src-bench.h-include-string.h.patch        | 36 --------
 package/lmbench/0009-src-lat_sig.c-fix-build.patch | 49 +++++++++++
 package/lmbench/0010-src-memsize.c-fix-build.patch | 34 ++++++++
 .../lmbench/0011-src-lat_unix.c-fix-build.patch    | 34 ++++++++
 .../lmbench/0012-src-lat_usleep.c-fix-build.patch  | 34 ++++++++
 package/lmbench/Config.in                          |  2 +-
 package/lmbench/lmbench.hash                       |  2 +-
 package/lmbench/lmbench.mk                         |  5 +-
 14 files changed, 202 insertions(+), 110 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 570c2bc489..40d6c595c8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -605,7 +605,6 @@ package/lm-sensors/0002-no-host-ldconfig.patch lib_patch.Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_patch.Upstream
 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch lib_patch.Upstream
-package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch lib_patch.Upstream
 package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch lib_patch.Upstream
 package/lockfile-progs/0001-sus3v-legacy.patch lib_patch.Sob lib_patch.Upstream
 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch lib_patch.Upstream
diff --git a/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
index 619ec38614..0de9beda7c 100644
--- a/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
+++ b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
@@ -3,6 +3,8 @@ From: Vineet Gupta <vgupta@synopsys.com>
 Date: Fri, 8 May 2015 11:35:58 +0530
 Subject: [PATCH] Fix garbage pointer for lat_rpc -S localhost
 
+Upstream: https://github.com/intel/lmbench/pull/45
+
 Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
 ---
  src/lat_rpc.c | 1 +
diff --git a/package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch b/package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch
index 6d5599763e..5e758f2ec2 100644
--- a/package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch
+++ b/package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch
@@ -6,7 +6,8 @@ Subject: [PATCH] scripts/build: make it possible to set LDLIBS
 LDLIBS is currently unconditionnally set to '-lm', but doesn't allow
 the user to provide additional libraries to link with.
 
-Upstream: dead, last release in 2006
+Upstream: https://github.com/intel/lmbench/pull/44
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  scripts/build | 2 +-
@@ -20,7 +21,7 @@ index 60b755c..4820d80 100755
  
  trap 'rm -f ${BASE}$$.s ${BASE}$$.c ${BASE}$$.o ${BASE}$$; exit 1' 1 2 15
  
--LDLIBS=-lm
+-LDLIBS="-lm"
 +LDLIBS="${LDLIBS} -lm"
  
  # check for HP-UX's ANSI compiler
diff --git a/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch b/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
index 261a2bf8f9..55b2b7c581 100644
--- a/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
+++ b/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
@@ -6,7 +6,8 @@ Subject: [PATCH] Add signum param to signal handlers
 A signal handler is required to have a signum parameter that is an
 integer.
 
-Upstream: dead
+Upstream: https://github.com/intel/lmbench/pull/43
+
 Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
 ---
  src/lat_udp.c |  4 ++--
diff --git a/package/lmbench/0007-scripts-build-int-return-type-main.patch b/package/lmbench/0007-scripts-build-int-return-type-main.patch
index 17a4517f72..23e3c44435 100644
--- a/package/lmbench/0007-scripts-build-int-return-type-main.patch
+++ b/package/lmbench/0007-scripts-build-int-return-type-main.patch
@@ -11,23 +11,24 @@ Some compilers (such as the bootlin riscv64-lp64d glibc bleeding-edge
 error at "return type defaults to ‘int’ [-Wimplicit-int]". Add types
 to these main() functions to allow this dependency tracking to work.
 
-Upstream: dead
+Upstream: https://github.com/intel/lmbench/pull/43
+
 Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
 ---
  scripts/build | 42 +++++++++++++++++++++---------------------
  1 file changed, 21 insertions(+), 21 deletions(-)
 
 diff --git a/scripts/build b/scripts/build
-index 4820d80..2c8a50a 100755
+index b2c4274..7f28c82 100755
 --- a/scripts/build
 +++ b/scripts/build
 @@ -51,14 +51,14 @@ fi
- 
+ 	
  # check for bcopy (optionally set the SYS5 flag)
  echo "#include <string.h>" > ${BASE}$$.c
 -echo "main() { char a[256], b[256]; bcopy(a, b, 256); }" >> ${BASE}$$.c
 +echo "int main() { char a[256], b[256]; bcopy(a, b, 256); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	|| CFLAGS="${CFLAGS} -DSYS5"
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  
@@ -35,168 +36,140 @@ index 4820d80..2c8a50a 100755
  echo "#include <stdlib.h>" > ${BASE}$$.c
 -echo "main() { char* buf = valloc(123); }" >> ${BASE}$$.c
 +echo "int main() { char* buf = valloc(123); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	|| CFLAGS="${CFLAGS} -Dvalloc=malloc"
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -67,7 +67,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
- echo "#include <stdlib.h>" > ${BASE}$$.c
- echo "#include <sys/types.h>" >> ${BASE}$$.c
- echo "#include <unistd.h>" >> ${BASE}$$.c
--echo "main() { off64_t off; }" >> ${BASE}$$.c
-+echo "int main() { off64_t off; }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
- 	&& CFLAGS="${CFLAGS} -DHAVE_off64_t"
- rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -76,7 +76,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
- echo "#include <stdlib.h>" > ${BASE}$$.c
- echo "#include <sys/types.h>" >> ${BASE}$$.c
- echo "#include <unistd.h>" >> ${BASE}$$.c
--echo "main() { int fd = 0; off64_t off = 0; off = lseek64(fd, off, SEEK_SET); }" >> ${BASE}$$.c
-+echo "int main() { int fd = 0; off64_t off = 0; off = lseek64(fd, off, SEEK_SET); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
- 	&& CFLAGS="${CFLAGS} -DHAVE_lseek64"
- rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -88,7 +88,7 @@ echo "#include <sys/resource.h>" >> ${BASE}$$.c
+@@ -70,7 +70,7 @@ echo "#include <sys/resource.h>" >> ${BASE}$$.c
  echo "#ifndef RUSAGE_SELF" >> ${BASE}$$.c
  echo "#define RUSAGE_SELF 0" >> ${BASE}$$.c
  echo "#endif /* RUSAGE_SELF */" >> ${BASE}$$.c
 -echo "main() { struct rusage ru; getrusage(RUSAGE_SELF, &ru); }" >> ${BASE}$$.c
 +echo "int main() { struct rusage ru; getrusage(RUSAGE_SELF, &ru); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DRUSAGE"
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -136,13 +136,13 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -118,13 +118,13 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  
  # check for OSs that have S_IFFIFO instead of S_IFIFO
  echo "#include <sys/stat.h>" > ${BASE}$$.c
 -echo "main() { return (S_IFIFO); }" >> ${BASE}$$.c
 +echo "int main() { return (S_IFIFO); }" >> ${BASE}$$.c
- if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL}; then
  	true;
  else
  	rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  	echo "#include <sys/stat.h>" > ${BASE}$$.c
 -	echo "main() { return (S_IFFIFO); }" >> ${BASE}$$.c
 +	echo "int main() { return (S_IFFIFO); }" >> ${BASE}$$.c
- 	${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  		|| CFLAGS="${CFLAGS} -DS_IFIFO=S_IFFIFO"
  fi
-@@ -151,7 +151,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -133,7 +133,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  # check that we have uint
  echo "#include <stdlib.h>" > ${BASE}$$.c
  echo "#include <sys/types.h>" >> ${BASE}$$.c
 -echo "main() { uint i = 0; return (i); }" >> ${BASE}$$.c
 +echo "int main() { uint i = 0; return (i); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_uint=1";
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -161,7 +161,7 @@ HAVE_uint64=0
+@@ -143,7 +143,7 @@ HAVE_uint64=0
  echo "#include <stdlib.h>" > ${BASE}$$.c
  echo "#include <sys/types.h>" >> ${BASE}$$.c
  echo "#include <rpc/types.h>" >> ${BASE}$$.c
 -echo "main() { uint64 i = 0; return (int)(i); }" >> ${BASE}$$.c
 +echo "int main() { uint64 i = 0; return (int)(i); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_uint64=1" && HAVE_uint64=1;
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -170,7 +170,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -152,7 +152,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  if [ ${HAVE_uint64} = 0 ]; then
      echo "#include <stdlib.h>" > ${BASE}$$.c
      echo "#include <sys/types.h>" >> ${BASE}$$.c
 -    echo "main() { uint64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
 +    echo "int main() { uint64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
-     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_uint64_t=1";
      rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -181,7 +181,7 @@ HAVE_int64=0
+@@ -163,7 +163,7 @@ HAVE_int64=0
  echo "#include <stdlib.h>" > ${BASE}$$.c
  echo "#include <sys/types.h>" >> ${BASE}$$.c
  echo "#include <rpc/types.h>" >> ${BASE}$$.c
 -echo "main() { int64 i = 0; return (int)(i); }" >> ${BASE}$$.c
 +echo "int main() { int64 i = 0; return (int)(i); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_int64=1" && HAVE_int64=1;
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -190,7 +190,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -172,7 +172,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  if [ ${HAVE_int64} = 0 ]; then
      echo "#include <stdlib.h>" > ${BASE}$$.c
      echo "#include <sys/types.h>" >> ${BASE}$$.c
 -    echo "main() { int64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
 +    echo "int main() { int64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
-     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_int64_t=1";
      rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -209,15 +209,15 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
- echo "#include <stdlib.h>" > ${BASE}$$.c
- echo "#include <sys/types.h>" >> ${BASE}$$.c
- echo "#include <sys/socket.h>" >> ${BASE}$$.c
--echo "main() { int s; struct sockaddr dest; socklen_t len; getsockname(s, &dest, &len); }" >> ${BASE}$$.c
--${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
-+echo "int main() { int s; struct sockaddr dest; socklen_t len; getsockname(s, &dest, &len); }" >> ${BASE}$$.c
-+${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} \
- 	&& CFLAGS="${CFLAGS} -DHAVE_socklen_t"
- rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
- 
+@@ -181,7 +181,7 @@ fi
  # check that we have drand48 and srand48
  HAVE_RANDOM=0
  echo "#include <stdlib.h>" > ${BASE}$$.c
 -echo "main() { srand48(973); return (int)(1.0E9 * drand48()); }" >> ${BASE}$$.c
 +echo "int main() { srand48(973); return (int)(1.0E9 * drand48()); }" >> ${BASE}$$.c
- if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL}; then
  	CFLAGS="${CFLAGS} -DHAVE_DRAND48"
  	HAVE_RANDOM=1
-@@ -226,7 +226,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -190,7 +190,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  
  if [ ${HAVE_RANDOM} -eq 0 ]; then
      echo "#include <stdlib.h>" > ${BASE}$$.c
 -    echo "main() { srand(973); return (10 * rand()) / RAND_MAX; }" >> ${BASE}$$.c
 +    echo "int main() { srand(973); return (10 * rand()) / RAND_MAX; }" >> ${BASE}$$.c
-     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL}; then
  	CFLAGS="${CFLAGS} -DHAVE_RAND"
  	HAVE_RANDOM=1
-@@ -236,7 +236,7 @@ fi
+@@ -200,7 +200,7 @@ fi
  
  if [ ${HAVE_RANDOM} -eq 0 ]; then
      echo "#include <stdlib.h>" > ${BASE}$$.c
 -    echo "main() { srandom(973); return (10 * random()) / RAND_MAX; }" >> ${BASE}$$.c
 +    echo "int main() { srandom(973); return (10 * random()) / RAND_MAX; }" >> ${BASE}$$.c
-     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL}; then
  	CFLAGS="${CFLAGS} -DHAVE_RANDOM"
  	HAVE_RANDOM=1
-@@ -247,7 +247,7 @@ fi
+@@ -211,7 +211,7 @@ fi
  # check that we have sysmp
  echo "#include <sys/types.h>" > ${BASE}$$.c
  echo "#include <sys/sysmp.h>" >> ${BASE}$$.c
 -echo "main() { return (int)sysmp(MP_NPROCS); }" >> ${BASE}$$.c
 +echo "int main() { return (int)sysmp(MP_NPROCS); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_SYSMP=1";
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -257,7 +257,7 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
+@@ -221,7 +221,7 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
  echo "#include <unistd.h>" >> ${BASE}$$.c
  echo "#include <sys/types.h>" >> ${BASE}$$.c
  echo "#include <sys/processor.h>" >> ${BASE}$$.c
 -echo "main() { return bindprocessor(BINDPROCESS, getpid(), 0); }" >> ${BASE}$$.c
 +echo "int main() { return bindprocessor(BINDPROCESS, getpid(), 0); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -267,7 +267,7 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
+@@ -231,7 +231,7 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
  echo "#include <sys/types.h>" >> ${BASE}$$.c
  echo "#include <sys/processor.h>" >> ${BASE}$$.c
  echo "#include <sys/procset.h>" >> ${BASE}$$.c
 -echo "main() { return processor(P_PID, P_MYPID, 0, NULL); }" >> ${BASE}$$.c
 +echo "int main() { return processor(P_PID, P_MYPID, 0, NULL); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
-@@ -276,7 +276,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -240,7 +240,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
  echo "#include <stdlib.h>" > ${BASE}$$.c
  echo "#include <unistd.h>" >> ${BASE}$$.c
  echo "#include <sched.h>" >> ${BASE}$$.c
 -echo "main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
 +echo "int main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
- ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
  	&& CFLAGS="${CFLAGS} -DHAVE_SCHED_SETAFFINITY=1";
  rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
 -- 
diff --git a/package/lmbench/0008-Fixup-function-declarations.patch b/package/lmbench/0008-Fixup-function-declarations.patch
index 03c14a3490..ef15cbde7d 100644
--- a/package/lmbench/0008-Fixup-function-declarations.patch
+++ b/package/lmbench/0008-Fixup-function-declarations.patch
@@ -5,7 +5,8 @@ Subject: [PATCH] Fixup function declarations
 
 GCC-15 requires function declarations to be properly typed.
 
-Upstream: dead
+Upstream: https://github.com/intel/lmbench/pull/43
+
 Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
 ---
  src/bench.h   |  4 ++--
@@ -17,7 +18,7 @@ diff --git a/src/bench.h b/src/bench.h
 index 597d068..b1624c5 100644
 --- a/src/bench.h
 +++ b/src/bench.h
-@@ -345,7 +345,7 @@ extern int sched_pin(int cpu);
+@@ -325,8 +325,8 @@ extern int handle_scheduler(int childno, int benchproc, int nbenchprocs);
  #define XACT_VERS ((u_long)1)
  #define RPC_XACT ((u_long)1)
  #define RPC_EXIT ((u_long)2)
@@ -26,7 +27,8 @@ index 597d068..b1624c5 100644
 +extern char *rpc_xact_1(char *msg, register SVCXPRT *transp);
 +extern char *client_rpc_xact_1(char *argp, CLIENT *clnt);
  
- #endif /* _BENCH_H */
+ void lmbench_usage(int argc, char *argv[], char* usage);
+ 
 diff --git a/src/lat_rpc.c b/src/lat_rpc.c
 index ff4380f..dcc24df 100644
 --- a/src/lat_rpc.c
diff --git a/package/lmbench/0009-src-bench.h-include-string.h.patch b/package/lmbench/0009-src-bench.h-include-string.h.patch
deleted file mode 100644
index 0c82a58b59..0000000000
--- a/package/lmbench/0009-src-bench.h-include-string.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 30a95099f4711d7c5a59526a84e2c73701af3c3c Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 25 Nov 2025 22:57:21 +0100
-Subject: [PATCH] src/bench.h: include string.h
-
-Fixes build error with newer gcc, detected by buildroot autobuilders:
-https://autobuild.buildroot.net/results/189/189219853fbe1b7daf0aaad29279858c6e60507b//build-end.log
-
-lib_unix.c: In function 'unix_server':
-lib_unix.c:29:9: error: implicit declaration of function 'strcpy' [-Wimplicit-function-declaration]
-   29 |         strcpy(s.sun_path, path);
-      |         ^~~~~~
-lib_unix.c:10:1: note: include '<string.h>' or provide a declaration of 'strcpy'
-
-Upstream: https://github.com/intel/lmbench/pull/41
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/bench.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/bench.h b/src/bench.h
-index 3b25a47..f0fd6b7 100644
---- a/src/bench.h
-+++ b/src/bench.h
-@@ -27,6 +27,7 @@ typedef unsigned char bool_t;
- #ifndef WIN32
- #include        <strings.h>
- #endif
-+#include        <string.h>
- #include        <sys/types.h>
- #ifndef WIN32
- #include        <sys/mman.h>
--- 
-2.47.3
-
diff --git a/package/lmbench/0009-src-lat_sig.c-fix-build.patch b/package/lmbench/0009-src-lat_sig.c-fix-build.patch
new file mode 100644
index 0000000000..ce8366e5ce
--- /dev/null
+++ b/package/lmbench/0009-src-lat_sig.c-fix-build.patch
@@ -0,0 +1,49 @@
+From 868256b43ee7ab597319982645ca1e5e00502224 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 5 Dec 2025 17:59:00 +0100
+Subject: [PATCH] src/lat_sig.c: fix build
+
+lat_sig.c:42:31: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+   42 |                 sa.sa_handler = handler;
+      |                               ^
+lat_sig.c:23:9: note: 'handler' declared here
+   23 | void    handler() { }
+
+lat_sig.c:95:23: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+   95 |         sa.sa_handler = prot;
+      |                       ^
+lat_sig.c:72:1: note: 'prot' declared here
+   72 | prot() {
+
+Upstream: https://github.com/intel/lmbench/pull/43
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lat_sig.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lat_sig.c b/src/lat_sig.c
+index 46aef0e..5913c48 100644
+--- a/src/lat_sig.c
++++ b/src/lat_sig.c
+@@ -20,7 +20,7 @@ char	*id = "$Id$\n";
+ 
+ uint64	caught, n;
+ double	adj;
+-void	handler() { }
++void	handler(int) { }
+ jmp_buf	prot_env;
+ 
+ void
+@@ -69,7 +69,7 @@ struct _state {
+ };
+ 
+ void
+-prot() {
++prot(int) {
+ 	if (++caught == n) {
+ 		caught = 0;
+ 		n = benchmp_interval(benchmp_getstate());
+-- 
+2.47.3
+
diff --git a/package/lmbench/0010-src-memsize.c-fix-build.patch b/package/lmbench/0010-src-memsize.c-fix-build.patch
new file mode 100644
index 0000000000..3a5cb8d45c
--- /dev/null
+++ b/package/lmbench/0010-src-memsize.c-fix-build.patch
@@ -0,0 +1,34 @@
+From 7dad44effa3e3456bede6c5c2325bfdf4dec94d3 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 5 Dec 2025 18:01:15 +0100
+Subject: [PATCH] src/memsize.c: fix build
+
+memsize.c:167:23: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+  167 |         sa.sa_handler = gotalarm;
+      |                       ^
+memsize.c:154:1: note: 'gotalarm' declared here
+  154 | gotalarm()
+
+Upstream: https://github.com/intel/lmbench/pull/43
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/memsize.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/memsize.c b/src/memsize.c
+index e1d05be..902132a 100644
+--- a/src/memsize.c
++++ b/src/memsize.c
+@@ -151,7 +151,7 @@ test_malloc(size_t size)
+ }
+ 
+ void
+-gotalarm()
++gotalarm(int)
+ {
+ 	alarm_triggered = 1;
+ }
+-- 
+2.47.3
+
diff --git a/package/lmbench/0011-src-lat_unix.c-fix-build.patch b/package/lmbench/0011-src-lat_unix.c-fix-build.patch
new file mode 100644
index 0000000000..ff4c716386
--- /dev/null
+++ b/package/lmbench/0011-src-lat_unix.c-fix-build.patch
@@ -0,0 +1,34 @@
+From 88bb985d400ccaddf1a61fba1aa0602c3506a047 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 5 Dec 2025 18:02:10 +0100
+Subject: [PATCH] src/lat_unix.c: fix build
+
+lat_unix.c:85:17: error: too many arguments to function 'exit'; expected 0, have 1
+   85 |                 exit(1);
+      |                 ^~~~ ~
+lat_unix.c:74:17: note: declared here
+   74 |         void    exit();
+
+Upstream: https://github.com/intel/lmbench/pull/43
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lat_unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lat_unix.c b/src/lat_unix.c
+index 1e321f8..9a062c1 100644
+--- a/src/lat_unix.c
++++ b/src/lat_unix.c
+@@ -71,7 +71,7 @@ void
+ initialize(iter_t iterations, void* cookie)
+ {
+ 	struct _state* pState = (struct _state*)cookie;
+-	void	exit();
++	void	exit(int);
+ 
+ 	if (iterations) return;
+ 
+-- 
+2.47.3
+
diff --git a/package/lmbench/0012-src-lat_usleep.c-fix-build.patch b/package/lmbench/0012-src-lat_usleep.c-fix-build.patch
new file mode 100644
index 0000000000..71b76bac8e
--- /dev/null
+++ b/package/lmbench/0012-src-lat_usleep.c-fix-build.patch
@@ -0,0 +1,34 @@
+From 3a57a2d54631df15d876147cf738d4ea033645a8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 5 Dec 2025 18:04:07 +0100
+Subject: [PATCH] src/lat_usleep.c: fix build
+
+lat_usleep.c:125:19: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+  125 |     sa.sa_handler = interval;
+      |                   ^
+lat_usleep.c:102:1: note: 'interval' declared here
+  102 | interval()
+
+Upstream: https://github.com/intel/lmbench/pull/43
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lat_usleep.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lat_usleep.c b/src/lat_usleep.c
+index d18d0c8..842ad06 100755
+--- a/src/lat_usleep.c
++++ b/src/lat_usleep.c
+@@ -99,7 +99,7 @@ bench_pselect(iter_t iterations, void *cookie)
+ #endif /* _POSIX_SELECT */
+ 
+ void
+-interval()
++interval(int)
+ {
+     if (++caught == n) {
+ 	caught = 0;
+-- 
+2.47.3
+
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index 33778e4d97..d6dd52551a 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LMBENCH
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
 
-	  http://sourceforge.net/projects/lmbench/
+	  https://github.com/intel/lmbench
 
 comment "lmbench needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
diff --git a/package/lmbench/lmbench.hash b/package/lmbench/lmbench.hash
index 25c150f4d7..b5487ee5d6 100644
--- a/package/lmbench/lmbench.hash
+++ b/package/lmbench/lmbench.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551  lmbench-3.0-a9.tgz
+sha256  920ab1fee83d7a33d41e040c067dfec2ed2362a5c32e09e509c7a6501c33b7b4  lmbench-8b3ddfa52ee4a886abe5af4550f404142966eb88.tar.gz
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
 sha256  3be7a155efa448db90071a95fbf81796f8f90edf9204f0463cfd23402dc90a72  COPYING-2
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 3d942779ad..633f267d73 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LMBENCH_VERSION = 3.0-a9
-LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
-LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)
+LMBENCH_VERSION = 8b3ddfa52ee4a886abe5af4550f404142966eb88
+LMBENCH_SITE = $(call github,intel,lmbench,$(LMBENCH_VERSION))
 LMBENCH_LICENSE = lmbench license (based on GPL-2.0)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 

--===============4757935996798194197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4757935996798194197==--
