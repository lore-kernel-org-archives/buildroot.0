From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:38:16 +0200
Subject: [Buildroot] [git commit] harfbuzz: unbreak legal-info after version
	bump
Message-ID: <20131008203904.2E4249B98C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=050f6935b25f92bd674e2db1211eb42881a1d1cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The embedded icu support library has been removed upstream:

http://cgit.freedesktop.org/harfbuzz/commit/src?id=ac1b723917d9b8f247a350f8d3e1bc5d1e472073

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 847075d..23bc848 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -7,8 +7,8 @@
 HARFBUZZ_VERSION = 0.9.22
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
-HARFBUZZ_LICENSE = MIT, ISC (ucdn library), ICU License (icu support library)
-HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING src/hb-icu-le/COPYING
+HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
+HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
 HARFBUZZ_INSTALL_STAGING = YES
 
 HARFBUZZ_CONF_OPT = --without-coretext --without-uniscribe --without-graphite2
