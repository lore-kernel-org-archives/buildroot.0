From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Sep 2018 22:42:33 +0200
Subject: [Buildroot] [PATCH] musl: bump to 1.1.20
Message-ID: <20180908204233.21208-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the upstream release announcement:

"""
This release introduces the ability to replace/interpose the allocator
(malloc) subject to certain restrictions, adds an experimental m68k
port, and makes notable improvements to stdio (application-provided
buffers), getaddrinfo (AI_ADDRCONFIG, support for IPv4-only kernel
configurations), the dynamic linker (safety against dlopen of
libraries using initial-exec TLS model, reclaiming unused memory on
FDPIC archs, better dladdr results), and handling of default thread
stack size (pthread_setattr_default_np now works more reliably).

Many bugs have been fixed, including potentially dangerous regressions
in iconv (only for new conversions to legacy encodings) and visibly
incorrect behavior in printf on non-x86 archs (%a format with
precision specifier), in getopt_long_only when short options are a
prefix for a long option, in complex arc-trig/hyperbolic functions, in
strftime and mktime (timezone-specific issues), and numerous
less-obvious places.
"""

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/musl.hash | 4 ++--
 package/musl/musl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index c011bbb711..f7cc05bcce 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://www.musl-libc.org/releases/musl-1.1.19.tar.gz.asc
-sha256  db59a8578226b98373f5b27e61f0dd29ad2456f4aa9cec587ba8c24508e4c1d9  musl-1.1.19.tar.gz
+# http://www.musl-libc.org/releases/musl-1.1.20.tar.gz.asc
+sha256  44be8771d0e6c6b5f82dd15662eb2957c9a3173a19a8b49966ac0542bbd40d61  musl-1.1.20.tar.gz
 sha256  15d9afbf84041872b4d840ed7d165d3eee786ff3f97e703b10467c259ff4e7d9  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index fa775d1e78..058a362922 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.19
+MUSL_VERSION = 1.1.20
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.14.4
