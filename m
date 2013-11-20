From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Nov 2013 10:15:18 +0100
Subject: [Buildroot] [git commit] pv: needs gettext if locale is enabled
Message-ID: <20131120091611.A40379BD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b24c37e3a332509d91ac2a4edc983a5e0b57ab0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c4f/c4f5ed916d85740ec00f5f34ded5de0195e5cd45/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/Config.in |    1 +
 package/pv/pv.mk     |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
