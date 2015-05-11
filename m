From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 10:53:10 +0200
Subject: [Buildroot] [git commit] uclibc-ng/uclibc: enable context functions
Message-ID: <20150511085328.4EAA5818E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d01aaa7035c558258205380f7cf4c81311d018e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For mongrel2/libsigsegv we need to enable this in the uClibc-ng/uClibc-snapshot config.
Tested with ARM:

file output/target/usr/bin/mongrel2
output/target/usr/bin/mongrel2: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), stripped

Should fix:
http://autobuild.buildroot.net/results/a144bc6024415a5272c3cbe60ff636d078d0a555/
http://autobuild.buildroot.net/results/00195d89a115a314bf4916af127407f61cd1b418/
http://autobuild.buildroot.net/results/5ee7e83ebcfa43f6ee0a2a8b9f40f1ae84664aca/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-ng.config       |    1 +
 package/uclibc/uClibc-snapshot.config |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index c6e7ff9..b1f039a 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -117,6 +117,7 @@ UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 UCLIBC_SUSV2_LEGACY=y
 UCLIBC_SUSV3_LEGACY=y
+UCLIBC_HAS_CONTEXT_FUNCS=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_STRICT_HEADERS is not set
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index ac3d9b0..d8ed726 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -117,6 +117,7 @@ UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 UCLIBC_SUSV2_LEGACY=y
 UCLIBC_SUSV3_LEGACY=y
+UCLIBC_HAS_CONTEXT_FUNCS=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_STRICT_HEADERS is not set
