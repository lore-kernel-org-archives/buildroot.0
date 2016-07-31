From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jul 2016 14:17:14 +0200
Subject: [Buildroot] [git commit] iozone: remove dead code for !thread
	handling
Message-ID: <20160731122011.E13327FD5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68ec724f50732bf2ae61d7a3acd5b3321846e467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iozone requires thread support since commit
06b53255cf639a5b033a2cdbfcf114770b94a83b, so having code to handle the
non-threaded case in the .mk file is useless.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iozone/iozone.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index e2f8557..477a60a 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -11,11 +11,8 @@ IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # IOzone license details can be found at:
 # http://www.iozone.org/docs/Iozone_License.txt
 
-# No threading target is non-AIO as well
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-IOZONE_TARGET = linux-noth
 # AIO support not available on uClibc, use the linux (non-aio) target.
-else ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 IOZONE_TARGET = linux-noaio
 else
 IOZONE_TARGET = linux
