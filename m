From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 14:00:15 +0200
Subject: [Buildroot] [git commit] harfbuzz: bump to version 0.9.40
Message-ID: <20150331121057.CEF4181E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14cb63461ebb27a9628e58aebaea7474fdd27db3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.
And do an autoreconf run since otherwise the libtool patch fails.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/harfbuzz/harfbuzz.hash |    2 ++
 package/harfbuzz/harfbuzz.mk   |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
new file mode 100644
index 0000000..131e8d3
--- /dev/null
+++ b/package/harfbuzz/harfbuzz.hash
@@ -0,0 +1,2 @@
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.40.tar.bz2.sha256
+sha256	1771d53583be6d91ca961854b2a24fb239ef0545eed221ae3349abae0ab8321f	harfbuzz-0.9.40.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index cd65575..0a69b09 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 0.9.22
+HARFBUZZ_VERSION = 0.9.40
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
 HARFBUZZ_INSTALL_STAGING = YES
-
 HARFBUZZ_CONF_OPTS = --without-coretext --without-uniscribe --without-graphite2
+# beta libtool version
+HARFBUZZ_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 # forgets to link test programs with -pthread breaking static link
