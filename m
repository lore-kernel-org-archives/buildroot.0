From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 22 Feb 2015 22:29:33 +0100
Subject: [Buildroot] [PATCH next] trinity: bump version to fix a build
	failure using Linux 3.19 headers
Message-ID: <1424640573-5274-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bump to the following trinity repository commit:

kvm: Add ifdef around IA64 ioctls.
Fix build error.

  CC	ioctls/kvm.o
In file included from ioctls/kvm.c:8:0:
ioctls/kvm.c:115:8: error: ?KVM_IA64_VCPU_GET_STACK? undeclared here (not in a function)
  IOCTL(KVM_IA64_VCPU_GET_STACK),
        ^
include/ioctls.h:53:15: note: in definition of macro ?IOCTL?
  { .request = _request, .name = #_request, }
               ^
ioctls/kvm.c:116:8: error: ?KVM_IA64_VCPU_SET_STACK? undeclared here (not in a function)
  IOCTL(KVM_IA64_VCPU_SET_STACK),
        ^
include/ioctls.h:53:15: note: in definition of macro ?IOCTL?
  { .request = _request, .name = #_request, }

IA64 ioctls were removed in Linux 3.19.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/trinity/trinity.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 52805e0..5f8a707 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRINITY_VERSION = 5d2dfe9727eb9c8dc44c31e95968e8d85284ffcc
+TRINITY_VERSION = c8c41f99500b5854c2061a08962b8908c872d852
 TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPLv2
 TRINITY_LICENSE_FILES = COPYING
-- 
2.3.0
