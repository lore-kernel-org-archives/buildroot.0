From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:00:27 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/elfutils: change
	upstream site
Message-ID: <20170313233002.372D78256D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0e41b01d8aae96ae5c8a985bd7709570cf6948b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

fedorahosted.org has been closed on March 1st, 2017, so use a
different upstream location for the elfutils project.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 94fba6644e5e612befde675b18cc94c32ccc135b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/Config.in   | 2 +-
 package/elfutils/elfutils.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 0419e27..7db8472 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_ELFUTILS
 	  Note that this option only installs the libraries, and not
 	  the programs.
 
-	  https://fedorahosted.org/elfutils
+	  https://sourceware.org/elfutils/
 
 if BR2_PACKAGE_ELFUTILS
 
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 566e0bf..0bf105e 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -6,7 +6,7 @@
 
 ELFUTILS_VERSION = 0.166
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
-ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
+ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPLv2+ or LGPLv3+ (library)
 ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
