From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jul 2010 16:53:52 +0200
Subject: [Buildroot] [PATCH 4/4] Deprecate pcmcia and microwin packages
In-Reply-To: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4436ef6ede55821ac02b24ed57911cf20bf9a7a7.1280069623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It isn't worth the effort to convert these packages to the new package
infrastructure since they are deprecated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/microwin/Config.in |    2 ++
 package/pcmcia/Config.in   |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/microwin/Config.in b/package/microwin/Config.in
index 5445f6a..3dd1e37 100644
--- a/package/microwin/Config.in
+++ b/package/microwin/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MICROWIN
 	bool "microwin"
+	# Old, unmaintained graphic stack
+	depends on BR2_DEPRECATED
 	help
 	 Microwindows Graphical User Interface for small and
 	 embedded enviroments.
diff --git a/package/pcmcia/Config.in b/package/pcmcia/Config.in
index fe26fa3..de1e33b 100644
--- a/package/pcmcia/Config.in
+++ b/package/pcmcia/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PCMCIA
 	bool "pcmcia"
 	depends on BR2_PACKAGE_LINUX
+	# The website says it's deprecated after 2.4.x kernels
+	depends on BR2_DEPRECATED
 	help
 	  PCMCIA tools for Linux.
 
-- 
1.7.0.4
