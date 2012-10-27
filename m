From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 27 Oct 2012 23:23:14 +0200
Subject: [Buildroot] [git commit] binutils version 2.23 is only available is
	.gz format
Message-ID: <20121027213137.0C7E19991A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7195019be4d138bc457f23fb2ce472ba9817dd86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

binutils version 2.23 is only available in .gz format, the older versions are in .bz2 format.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/binutils.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d41cac4..e1aac9b 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -16,7 +16,12 @@ BINUTILS_VERSION = 2.21
 endif
 endif
 
+ifeq ($(BINUTILS_VERSION),2.23)
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+else
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
+endif
+
 BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
