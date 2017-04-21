From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 21 Apr 2017 16:48:52 +0530
Subject: [Buildroot] [PATCH] sg3_utils: improve license description
Message-ID: <1492773532-12206-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Library is licensed under BSD-3-Clause. Some programs are licensed
under GPL-2.0+ while other are BSD-3-Clause. Annotate licenses with
components and improve readability of license strings when
conditionally specifying license for programs using := instead of +=.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/sg3_utils/sg3_utils.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index f010b3e..88827f3 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -7,10 +7,10 @@
 SG3_UTILS_VERSION = 1.42
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
-SG3_UTILS_LICENSE = BSD-3-Clause
-# utils progs are GPL-2.0+ licenced
+SG3_UTILS_LICENSE = BSD-3-Clause (library)
+# Some utils progs are GPL-2.0+ licensed while others are BSD-3-Clause
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
-SG3_UTILS_LICENSE += GPL-2.0+
+SG3_UTILS_LICENSE := $(SG3_UTILS_LICENSE), GPL-2.0+ (programs), BSD-3-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
-- 
2.7.4
