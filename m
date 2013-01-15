From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 21:37:47 +0100
Subject: [Buildroot] [git commit] opkg: fix configure step by adding
	host-pkgconf dependency
Message-ID: <20130115204907.E18289A1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d680bf0dd0bd0f62dad91c9bf8c7657ebc5f59b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The opkg configure.ac uses the PKG_CHECK_MODULES() m4 macro, which is
provided by the .m4 files installed by host-pkgconf, so we must have
this package as a dependency.

Fixes:

  http://autobuild.buildroot.org/results/069fcab6e7dd5a1f07251ba6f52f65643a2f7594/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opkg/opkg.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 3ba61ae..9932d3f 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -11,6 +11,8 @@ OPKG_SITE_METHOD = svn
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPT = --disable-curl --disable-gpg
 OPKG_AUTORECONF = YES
+# Uses PKG_CHECK_MODULES() in configure.ac
+OPKG_DEPENDENCIES = host-pkgconf
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
