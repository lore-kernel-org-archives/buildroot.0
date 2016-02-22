From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 22 Feb 2016 13:52:57 -0300
Subject: [Buildroot] [PATCH 4/4] fakeroot: enable capability support
In-Reply-To: <1456159977-8428-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1456159977-8428-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1456159977-8428-5-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Enable file capability support, this still requires fakeroot script
(makedev) support.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/fakeroot/fakeroot.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 168cd13..06f1a73 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -7,13 +7,7 @@
 FAKEROOT_VERSION = 1.20.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
-# Force capabilities detection off
-# For now these are process capabilities (faked) rather than file
-# so they're of no real use
-HOST_FAKEROOT_CONF_ENV = \
-	ac_cv_header_sys_capability_h=no \
-	ac_cv_func_capset=no
-
+FAKEROOT_DEPENDENCIES = host-libcap
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
-- 
2.4.10
