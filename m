From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:10:35 +0200
Subject: [Buildroot] [git commit] rpi-userland: add patch fix missing
	libvcilcs install rules
Message-ID: <20140608131255.308289CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f22830e456833e98e11f09d2aa38017f5aaa557c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds a patch fix the missing install rules for libvcilcs.

This is a pre-requisite to be able to build the shared libraries of the
rpi-userland package, and most importantly avoid linkage failure (at
link-time and/or runtime) in others libraries that link with it.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...vmcs_host-add-install-rules-for-libvcilcs.patch |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch b/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
new file mode 100644
index 0000000..05cf4b3
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
@@ -0,0 +1,23 @@
+From b60398837ddf39d4b605600abc167d4366e454a6 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 5 Jun 2014 00:06:08 +0200
+Subject: [PATCH] interface/vmcs_host: add install rules for libvcilcs
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ interface/vmcs_host/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
+index 64ba2f8..8510f81 100755
+--- a/interface/vmcs_host/CMakeLists.txt
++++ b/interface/vmcs_host/CMakeLists.txt
+@@ -33,4 +33,5 @@ target_link_libraries(vchostif vchiq_arm vcos vcfiled_check)
+ 
+ add_subdirectory(linux/vcfiled)
+ install(TARGETS vchostif DESTINATION lib)
++install(TARGETS vcilcs DESTINATION lib)
+ 
+-- 
+2.0.0
+
