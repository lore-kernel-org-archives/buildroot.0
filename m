From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 26 Mar 2014 23:22:06 +0100
Subject: [Buildroot] [PATCH v2 1/1] python3: drop PYTHON3_VERSION_MINOR
	variable
Message-ID: <1395872526-17937-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
v2
- rename subject
- drop only PYTHON3_VERSION_MINOR variable

 package/python3/python3.mk |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ce75e46..0144d1e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,10 +5,9 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.4
-PYTHON3_VERSION_MINOR = 0
-PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
-PYTHON3_SOURCE        = Python-$(PYTHON3_VERSION).tar.xz
-PYTHON3_SITE          = http://python.org/ftp/python/$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
+PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 
 # Python needs itself and a "pgen" program to build itself, both being
 # provided in the Python sources. So in order to cross-compile Python,
-- 
1.7.9.5
