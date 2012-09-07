From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:54 -0300
Subject: [Buildroot] [PATCH 07/10] bison: bump to version 2.6.2
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index d0c9077..ab61ca4 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-BISON_VERSION = 2.5.1
+BISON_VERSION = 2.6.2
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
-
-BISON_CONF_ENV += ac_cv_path_M4=/usr/bin/m4
-BISON_DEPENDENCIES += m4
+BISON_LICENSE = GPLv3
+BISON_LICENSE_FILES = COPYING
+BISON_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
+BISON_DEPENDENCIES = m4
 
 define BISON_DISABLE_EXAMPLES
 	echo 'all install:' > $(@D)/examples/Makefile
-- 
1.7.8.6
