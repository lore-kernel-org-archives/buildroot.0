From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Fri, 12 Jul 2013 09:44:32 +0200
Subject: [Buildroot] [PATCH] package/iozone: Build non-threads version if
	!BR2_PTHREADS_NATIVE
Message-ID: <1373615072-5258-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iozone uses pthread_setaffinity_np, which is not supported
in Linuxthreads.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/iozone/iozone.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 328a526..c985141 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -12,7 +12,7 @@ IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # http://www.iozone.org/docs/Iozone_License.txt
 
 # No threading target is non-AIO as well
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+ifeq ($(BR2_PTHREADS_NATIVE),)
 IOZONE_TARGET = linux-noth
 # AIO support not available on uClibc, use the linux (non-aio) target.
 else ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
1.7.9.5
