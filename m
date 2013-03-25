From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 08:42:30 +0100
Subject: [Buildroot] [PATCH] gnuchess: add missing dependencies on flex and
	host-flex
Message-ID: <1364197350-10614-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And also add a missing newline and licensing informations while we're
at it.

Fixes:
http://autobuild.buildroot.org/results/2851f23990c9f6642b1e706a94b1afc15a24b6f7/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuchess/Config.in   |    1 +
 package/gnuchess/gnuchess.mk |    6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gnuchess/Config.in b/package/gnuchess/Config.in
index c79c52d..105fbbc 100644
--- a/package/gnuchess/Config.in
+++ b/package/gnuchess/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GNUCHESS
 	bool "gnuchess"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_FLEX
 	help
 	  GNU Chess lets most modern computers play a full game of chess.
 
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 3e0b724..90d2274 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -3,11 +3,15 @@
 # gnuchess
 #
 #############################################################
+
 GNUCHESS_VERSION = 5.07
 GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
+GNUCHESS_LICENSE = GPLv2+
+GNUCHESS_LICENSE_FILES = COPYING
 
-GNUCHESS_DEPENDENCIES = $(if $(BR2_PACKAGE_READLINE),readline)
+GNUCHESS_DEPENDENCIES = host-flex flex
+GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline)
 
 $(eval $(autotools-package))
 
-- 
1.7.9.5
