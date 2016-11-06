From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 13:57:51 +0100
Subject: [Buildroot] [git commit] kvm-unit-tests: add patch to remove -Werror
Message-ID: <20161106125816.D3C198028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bb0443ee97c61dad1b9e595b0e421de3eed58b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/52c02c68be6c0b3e907f7ed645bd2d18476ec4f3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/0001-remove-werror.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/kvm-unit-tests/0001-remove-werror.patch b/package/kvm-unit-tests/0001-remove-werror.patch
new file mode 100644
index 0000000..058a640
--- /dev/null
+++ b/package/kvm-unit-tests/0001-remove-werror.patch
@@ -0,0 +1,17 @@
+Remove -Werror to avoid build failures
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -45,7 +45,7 @@
+               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
+ 
+ CFLAGS += -g
+-CFLAGS += $(autodepend-flags) -Wall -Werror -Wno-frame-address
++CFLAGS += $(autodepend-flags) -Wall -Wno-frame-address
+ frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
+ fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
+ fnostack_protector := $(call cc-option, -fno-stack-protector, "")
