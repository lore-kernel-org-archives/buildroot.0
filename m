From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 10 Jun 2015 08:44:30 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: add OPENVMTOOLS_VERSION_MAJOR
	variable
Message-ID: <1433918670-16552-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/openvmtools/openvmtools.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index ef6544a..92ecd36 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION = 9.10.0-2476743
+OPENVMTOOLS_VERSION_MAJOR = 9.10.0
+OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-2476743
 OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
-OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.10.0
+OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-$(OPENVMTOOLS_VERSION_MAJOR)
 OPENVMTOOLS_LICENSE = LGPLv2.1
 OPENVMTOOLS_LICENSE_FILES = COPYING
 # Autoreconf needed or config/missing will run configure again at buildtime
-- 
1.9.1
