From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:17:21 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] rpm: bump version to
	4.13.0.1 (security)
Message-ID: <20170317234445.231F97FE0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=840969ed617f772c866ea61e27cab97eaaf63eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Security fixes:
 - Fix several out of bounds reads in the OpenPGP parser
 - Fix handling of OpenPGP reserved tag (should be rejected)
 - Fix various crashes from malformed packages with invalid tags

Release notes:
  http://rpm.org/wiki/Releases/4.13.0.1

This patch also switches from GitHub to rpm.org since the last one seems
to be more up-to-date.

[Peter: use RPM_VERSION_MAJOR as suggested by Jerzy Grzegorek]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 7adbcd174a17ff1b74c4b20d94ca4a9e7f396d68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.hash | 4 ++--
 package/rpm/rpm.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index c9c4d65..fd77d33 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From http://rpm.org/wiki/Releases/4.13.0
-sha1	c6ce4f879ca6a75340921093105e5ef9d33381d3	rpm-4.13.0.tar.bz2
+# From http://rpm.org/wiki/Releases/4.13.0.1
+sha1 9566f95f38fcb214e439c552f378c2f64ba0aff9  rpm-4.13.0.1.tar.bz2
 # Locally computed
 sha256	a3e5568d721737a24141737e6036bb39ba9dfbeaa03fa4a51cc7881a243e0c5d b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch
 sha256	7ab0e08e143bb2d43d5b0553ee22ea34da15a611c597860a6110745467d20fa8 c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 2e829d7..1c03f2e 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-RPM_VERSION = 4.13.0
+RPM_VERSION_MAJOR = 4.13
+RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
-RPM_SITE = https://github.com/rpm-software-management/rpm/releases/download/rpm-$(RPM_VERSION)-release
+RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
 RPM_LICENSE = GPLv2 or LGPLv2 (library only)
 RPM_LICENSE_FILES = COPYING
