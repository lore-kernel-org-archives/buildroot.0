From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 22:12:51 +0100
Subject: [Buildroot] [git commit] binutils: bump the default target version
	of binutils
Message-ID: <20141029211324.C4C619D61D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21a60216e925bc16a4965b0fb0f8801208f02547
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When binutils for the host is not built (which is the case when an
external toolchain is used), the version of binutils used is 2.21,
which is quite old. Since we have bumped to 2.22 as the default
version for the host binutils, let's do the same for the target
binutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/binutils/binutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ab9f167..b8dab5d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -12,7 +12,7 @@ ifeq ($(BR2_avr32),y)
 # avr32 uses a special version
 BINUTILS_VERSION = 2.18-avr32-1.0.1
 else
-BINUTILS_VERSION = 2.21
+BINUTILS_VERSION = 2.22
 endif
 endif
 
