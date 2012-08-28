From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Aug 2012 01:04:58 +0200
Subject: [Buildroot] [git commit] Remove BR2_SOURCEFORGE_MIRROR variable
Message-ID: <20120828230610.4E70897083@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdfebcfca6051eadc8326107615fcbdcf56d83b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all packages have been converted to use the
downloads.sourceforge.net URLs that automatically selects an available
Sourceforge mirror, we can get rid of the BR2_SOURCEFORGE_MIRROR
configuration variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in              |   16 ----------------
 package/pkg-generic.mk |    3 ---
 2 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/Config.in b/Config.in
index 4a7e6b5..dab7787 100644
--- a/Config.in
+++ b/Config.in
@@ -147,22 +147,6 @@ config BR2_BACKUP_SITE
 	  will fall back to download package sources from here if the
 	  normal location fails.
 
-config BR2_SOURCEFORGE_MIRROR
-	string "Sourceforge mirror site"
-	default "kent"
-	help
-	  Note: the usage of this variable is deprecated. Packages
-	  should instead use the http://downloads.sourceforge.net/ URL
-	  which automatically chooses a working mirror
-
-	  Sourceforge has a system of mirror sites.  Some sites may be
-	  closer to your location, and sometimes mirror sites go down
-	  and are no longer available.  This option allows you to select
-	  your preferred Sourceforge mirror site.
-
-	  The list of mirrors is available here:
-	  http://sourceforge.net/apps/trac/sourceforge/wiki/Mirrors
-
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
 	default "http://www.kernel.org/pub/"
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 68d23ba..ffe7dfb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -244,9 +244,6 @@ endif
 ifndef $(2)_SITE
  ifdef $(3)_SITE
   $(2)_SITE = $($(3)_SITE)
- else
-  $(2)_SITE			?= \
-	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
  endif
 endif
 
