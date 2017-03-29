From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 22:05:09 +0200
Subject: [Buildroot] [git commit] xenomai: fix license files variable
Message-ID: <20170329201911.E01398229C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ebafdbde253500205b185dcb5a718e6398fc24e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 472b07ea8ff1cd341c5f97508e5c29266146fa51 ("xenomai: bump
version to 3.0.3"), the XENOMAI_LICENSE_FILES variable was not
updated, causing a number of build failures. This commit fixes that to
point to existing files.

Fixes:

  http://autobuild.buildroot.net/results/f2cd7cd1f8bcf67c66fb713ef6b03f1f01a74dc5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 28875b9..fc240f9 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -15,7 +15,7 @@ XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = GPLv2+ with exception (headers), LGPLv2.1+ (libraries), GPLv2+ (kernel), GFDLv1.2+ (docs), GPLv2 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
-XENOMAI_LICENSE_FILES = debian/copyright include/COPYING src/skins/native/COPYING ksrc/nucleus/COPYING
+XENOMAI_LICENSE_FILES = debian/copyright include/COPYING lib/trank/COPYING kernel/cobalt/COPYING
 
 XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
