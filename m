From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 23:50:48 +0200
Subject: [Buildroot] [git commit] polarssl: disable microblaze inline
	assembly
Message-ID: <20140730215141.5756B9D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e52edcd03069788760d05f4ac934dcdbfb335474
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4d5/4d54958ded61a0d929d992e4ca0bb31c996953cb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../polarssl-02-disable-microblaze-asm.patch       |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/polarssl/polarssl-02-disable-microblaze-asm.patch b/package/polarssl/polarssl-02-disable-microblaze-asm.patch
new file mode 100644
index 0000000..e90e12d
--- /dev/null
+++ b/package/polarssl/polarssl-02-disable-microblaze-asm.patch
@@ -0,0 +1,18 @@
+Microblaze assembly seems to be broken, fixes:
+
+http://autobuild.buildroot.net/results/4d5/4d54958ded61a0d929d992e4ca0bb31c996953cb/
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura polarssl-1.2.11.orig/include/polarssl/bn_mul.h polarssl-1.2.11/include/polarssl/bn_mul.h
+--- polarssl-1.2.11.orig/include/polarssl/bn_mul.h	2014-07-30 15:47:27.381658434 -0300
++++ polarssl-1.2.11/include/polarssl/bn_mul.h	2014-07-30 15:48:52.616543074 -0300
+@@ -480,7 +480,7 @@
+ 
+ #endif /* SPARCv8 */
+ 
+-#if defined(__microblaze__) || defined(microblaze)
++#if 0 && defined(__microblaze__) || defined(microblaze)
+ 
+ #define MULADDC_INIT                    \
+     asm(                                \
