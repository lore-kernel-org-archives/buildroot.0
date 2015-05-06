From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 6 May 2015 19:50:30 +0200
Subject: [Buildroot] [PATCH] uclibc-ng: enable context functions
Message-ID: <20150506175030.GA2853@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For mongrel2/libsigsegv we need to enable this in the uClibc-ng config.
Tested with ARM:

file output/target/usr/bin/mongrel2
output/target/usr/bin/mongrel2: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), stripped

Should fix:
http://autobuild.buildroot.net/results/a144bc6024415a5272c3cbe60ff636d078d0a555/
http://autobuild.buildroot.net/results/00195d89a115a314bf4916af127407f61cd1b418/
http://autobuild.buildroot.net/results/5ee7e83ebcfa43f6ee0a2a8b9f40f1ae84664aca/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uClibc-ng.config |    1 +
 1 file changed, 1 insertion(+)

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
-- 
1.7.10.4
