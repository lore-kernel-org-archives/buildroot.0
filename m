Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5324157C;
	Tue, 28 Jun 2022 06:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5324157C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmD7IeE0rfPy; Tue, 28 Jun 2022 06:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 079014157E;
	Tue, 28 Jun 2022 06:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 079014157E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C92661BF9D1
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B218A60B71
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B218A60B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dP5vuenS4B2v for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:09:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B37DD60087
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37DD60087
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 918CA877A3; Tue, 28 Jun 2022 05:56:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 08:06:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f7afc40e15f9d74f2705265de23b2d16ec80265
X-Git-Newrev: 5b1a438995bfdc688bcb2cacd61b33dbefbecb6a
X-Patchwork-Hint: ignore
Message-Id: <20220628055636.918CA877A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proxychains-ng: bump to version
 4.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b1a438995bfdc688bcb2cacd61b33dbefbecb6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/rofl0r/proxychains-ng/releases/tag/v4.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...non-POSIX-compliant-getnameinfo-signature.patch | 76 ++++++++++++++++++++++
 ...0001-configure-fix-check_link_silent-test.patch | 41 ------------
 package/proxychains-ng/proxychains-ng.hash         |  4 +-
 package/proxychains-ng/proxychains-ng.mk           |  4 +-
 4 files changed, 80 insertions(+), 45 deletions(-)

diff --git a/package/proxychains-ng/0001-add-configure-check-for-non-POSIX-compliant-getnameinfo-signature.patch b/package/proxychains-ng/0001-add-configure-check-for-non-POSIX-compliant-getnameinfo-signature.patch
new file mode 100644
index 0000000000..d111667c8b
--- /dev/null
+++ b/package/proxychains-ng/0001-add-configure-check-for-non-POSIX-compliant-getnameinfo-signature.patch
@@ -0,0 +1,76 @@
+From 07c15a02f6890f56aa0b9341c27fc889956ab114 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Tue, 25 Jan 2022 14:51:27 +0000
+Subject: [PATCH] add configure check for non-POSIX compliant getnameinfo
+ signature
+
+- glibc < 2.14 uses "unsigned" instead of "int" for flags
+- openbsd and freebsd use "size_t" instead of socklen_t for servlen
+  and nodelen, while still using socklen_t for salen.
+
+closes #430
+
+[Retrieved from:
+https://github.com/rofl0r/proxychains-ng/commit/07c15a02f6890f56aa0b9341c27fc889956ab114]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure            | 16 ++++++++++++++++
+ src/core.h           |  2 +-
+ src/libproxychains.c |  4 ++--
+ 3 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 4c8bcbc..0102eb2 100755
+--- a/configure
++++ b/configure
+@@ -175,6 +175,22 @@ ishaiku() {
+ 
+ check_compile 'whether C compiler works' '' 'int main() {return 0;}' || fail 'error: install a C compiler and library'
+ 
++if ! check_compile 'whether getnameinfo() servlen argument is POSIX compliant (socklen_t)' "-DGN_NODELEN_T=socklen_t -DGN_SERVLEN_T=socklen_t -DGN_FLAGS_T=int" \
++'#define _GNU_SOURCE\n#include <netdb.h>\nint getnameinfo(const struct sockaddr *, socklen_t, char *, socklen_t, char *, socklen_t, int);int main() {\nreturn 0;}' ; then
++ # GLIBC < 2.14
++ if ! check_compile 'whether getnameinfo() flags argument is unsigned' "-DGN_NODELEN_T=socklen_t -DGN_SERVLEN_T=socklen_t -DGN_FLAGS_T=unsigned" \
++  '#define _GNU_SOURCE\n#include <netdb.h>\nint getnameinfo(const struct sockaddr *, socklen_t, char *, socklen_t, char *, socklen_t, unsigned);int main() {\nreturn 0;}' ; then
++  if ! check_compile 'whether getnameinfo() servlen argument is size_t' "-DGN_NODELEN_T=socklen_t -DGN_SERVLEN_T=size_t -DGN_FLAGS_T=int" \
++   '#define _GNU_SOURCE\n#include <netdb.h>\nint getnameinfo(const struct sockaddr *, socklen_t, char *, socklen_t, char *, size_t, int);int main() {\nreturn 0;}' ; then
++   # OpenBSD & FreeBSD
++   if ! check_compile 'whether getnameinfo() servlen and nodelen argument is size_t' "-DGN_NODELEN_T=size_t -DGN_SERVLEN_T=size_t -DGN_FLAGS_T=int" \
++    '#define _GNU_SOURCE\n#include <netdb.h>\nint getnameinfo(const struct sockaddr *, socklen_t, char *, size_t, char *, size_t, int);int main() {\nreturn 0;}' ; then
++     fail "failed to detect getnameinfo signature"
++   fi
++  fi
++ fi
++fi
++
+ check_compile 'whether we have GNU-style getservbyname_r()' "-DHAVE_GNU_GETSERVBYNAME_R" \
+ '#define _GNU_SOURCE\n#include <netdb.h>\nint main() {\nstruct servent *se = 0;struct servent se_buf;char buf[1024];\ngetservbyname_r("foo", (void*) 0, &se_buf, buf, sizeof(buf), &se);\nreturn 0;}'
+ 
+diff --git a/src/core.h b/src/core.h
+index 31f3003..3045b86 100644
+--- a/src/core.h
++++ b/src/core.h
+@@ -109,7 +109,7 @@ typedef int (*getaddrinfo_t)(const char *, const char *, const struct addrinfo *
+ 			     struct addrinfo **);
+ 
+ typedef int (*getnameinfo_t) (const struct sockaddr *, socklen_t, char *, 
+-			      socklen_t, char *, socklen_t, int);
++			      GN_NODELEN_T, char *, GN_SERVLEN_T, GN_FLAGS_T);
+ 
+ typedef ssize_t (*sendto_t) (int sockfd, const void *buf, size_t len, int flags,
+ 			     const struct sockaddr *dest_addr, socklen_t addrlen);
+diff --git a/src/libproxychains.c b/src/libproxychains.c
+index 001ffcd..578ff84 100644
+--- a/src/libproxychains.c
++++ b/src/libproxychains.c
+@@ -729,8 +729,8 @@ HOOKFUNC(void, freeaddrinfo, struct addrinfo *res) {
+ }
+ 
+ HOOKFUNC(int, getnameinfo, const struct sockaddr *sa, socklen_t salen,
+-	           char *host, socklen_t hostlen, char *serv,
+-	           socklen_t servlen, int flags)
++	           char *host, GN_NODELEN_T hostlen, char *serv,
++	           GN_SERVLEN_T servlen, GN_FLAGS_T flags)
+ {
+ 	INIT();
+ 	PFUNC();
diff --git a/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch b/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch
deleted file mode 100644
index aadfef9cd9..0000000000
--- a/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4a557f242a76c6a2a3134acf1d3279818f8ab371 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 23 Jul 2021 09:50:36 +0200
-Subject: [PATCH] configure: fix check_link_silent test
-
-Replace -o /dev/null by -o "$tmpc".out when testing with
-check_link_silent otherwise test will fail with some bugged binutils
-(https://sourceware.org/bugzilla/show_bug.cgi?id=19526) since version
-4.13 and
-https://github.com/rofl0r/proxychains-ng/commit/35a674bdbc294730429a1007c9e7ce01e65b49b5:
-
-checking what's the option to use in linker to set library name ...
-cannot find an option to set library name
-package/pkg-generic.mk:249: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/proxychains-ng-4.14/.stamp_configured' failed
-
-Fixes:
- - http://autobuild.buildroot.org/results/9320d9b2c69882e23bbe7b30057eb8bee0c9d2e5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rofl0r/proxychains-ng/pull/387]
----
- configure | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 8b21b97..cfe19e7 100755
---- a/configure
-+++ b/configure
-@@ -49,7 +49,8 @@ check_compile_run() {
- 
- check_link_silent() {
- 	printf "$2" > "$tmpc"
--	$CC $OUR_CPPFLAGS $CPPFLAGS $1 $CFLAGS "$tmpc" -o /dev/null >/dev/null 2>&1
-+	$CC $OUR_CPPFLAGS $CPPFLAGS $1 $CFLAGS "$tmpc" -o "$tmpc".out  >/dev/null 2>&1
-+	rm -f "$tmpc".out
- }
- 
- check_link() {
--- 
-2.30.2
-
diff --git a/package/proxychains-ng/proxychains-ng.hash b/package/proxychains-ng/proxychains-ng.hash
index 779f6b626d..e9016ffd86 100644
--- a/package/proxychains-ng/proxychains-ng.hash
+++ b/package/proxychains-ng/proxychains-ng.hash
@@ -1,4 +1,4 @@
-# From https://github.com/rofl0r/proxychains-ng/releases/tag/v4.14
-sha512  75a1a4629d2b7ebac9b909a694b395339cf669fa4e23bfcc57938e46377b5619f31c9651d2bc457d1ad10ec1be7747981106392bf8bf65999cb7bb9c748d7e95  proxychains-ng-4.14.tar.xz
+# From https://github.com/rofl0r/proxychains-ng/releases/tag/v4.16
+sha512  c4402599043887b1481a46cec8d3ca5fcd2612b46b73a4d4ce025318640cd61b37181ad70236303933103006b313882dc57dc8838172863090f9ce33e9463a8d  proxychains-ng-4.16.tar.xz
 # Locally computed:
 sha256  86728623caeff60e9bcc37e03b432fd191de927eed48a72a3bb4ac4e53fe20df  COPYING
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index bb7c9ff687..c4d487c7db 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PROXYCHAINS_NG_VERSION = 4.14
+PROXYCHAINS_NG_VERSION = 4.16
 PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.xz
-PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
+PROXYCHAINS_NG_SITE = https://github.com/rofl0r/proxychains-ng/releases/download/v$(PROXYCHAINS_NG_VERSION)
 PROXYCHAINS_NG_LICENSE = GPL-2.0+
 PROXYCHAINS_NG_LICENSE_FILES = COPYING
 PROXYCHAINS_NG_CPE_ID_VENDOR = proxychains-ng_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
