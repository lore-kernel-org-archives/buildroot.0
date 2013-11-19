From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Nov 2013 00:50:48 +0100
Subject: [Buildroot] [PATCH] pv: needs gettext if locale is enabled
Message-ID: <1384905048-17257-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/c4f/c4f5ed916d85740ec00f5f34ded5de0195e5cd45/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pv/Config.in | 1 +
 package/pv/pv.mk     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/pv/Config.in b/package/pv/Config.in
index 671f78e..d732296 100644
--- a/package/pv/Config.in
+++ b/package/pv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PV
 	bool "pv"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Pipe Viewer - is a terminal-based tool for
 	  monitoring the progress of data through a
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 5f1a54b..ab5190a 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -9,6 +9,7 @@ PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
 PV_LICENSE_FILES = doc/COPYING
+PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # While 'pv' uses autoconf, it does not use automake for its
 # makefiles. It uses $(LD) $(LDFLAGS) to achieve partial linking, but
-- 
1.8.4.2
