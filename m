From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 31 Dec 2015 08:59:30 +0100
Subject: [Buildroot] [PATCH 1/1] openipmi: add OPENIPMI_VERSION_MAJOR
	variable
Message-ID: <1451548770-2968-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/openipmi/openipmi.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 85bd6b4..3b9c49f 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.21
-OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
-OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
+OPENIPMI_VERSION_MAJOR = 2.0
+OPENIPMI_VERSION = $(OPENIPMI_VERSION_MAJOR).21
+OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
+OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%20$(OPENIPMI_VERSION_MAJOR)%20Library
 OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
-- 
1.9.1
