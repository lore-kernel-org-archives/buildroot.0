From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 22:11:27 +0100
Subject: [Buildroot] [git commit] binutils: remove dead code
Message-ID: <20141029211324.BD13AB1FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beaf1c1887837b3b4a11e681ad41cef71b2bcdf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer have any way of using version 2.23, and all the other
versions that we support are available as .tar.bz2. Therefore we can
remove the special case related to the 2.23 version only being
available as a .tar.gz archive.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/binutils/binutils.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f40c45f..ab9f167 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -16,10 +16,6 @@ BINUTILS_VERSION = 2.21
 endif
 endif
 
-ifeq ($(BINUTILS_VERSION),2.23)
-BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-endif
-
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
