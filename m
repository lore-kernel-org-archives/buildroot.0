From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:34 -0000
Subject: [Buildroot] [git commit branch/next] binutils: fix build with
	external toolchains on avr32
Message-ID: <20120802195232.D62F696FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4fba5865b19163108fbd78ffe037e069ce8c802
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.org/results/7f0545a7c824bf0523ab3506db83f7f5c930d63d/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/binutils.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0a5a948..1c8a79d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,8 +8,13 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
+ifeq ($(BR2_avr32),y)
+# avr32 uses a special version
+BINUTILS_VERSION = 2.18-avr32-1.0.1
+else
 BINUTILS_VERSION = 2.21
 endif
+endif
 
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
