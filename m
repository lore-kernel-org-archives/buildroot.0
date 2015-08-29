From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 20:42:31 +0200
Subject: [Buildroot] [git commit branch/next] ibrcommon: add missing
	dependency on host-pkgconf
Message-ID: <20150829184540.DC1B681DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4f6046f7a2932aa746c705d2b3d3d4745f5b061
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

pkg-config is used by ibrcommon to detect the availability of openssl,
libnl and libxml2, so we must depend on host-pkgconf.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ibrcommon/ibrcommon.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
index 282bfb0..97eced3 100644
--- a/package/ibrcommon/ibrcommon.mk
+++ b/package/ibrcommon/ibrcommon.mk
@@ -10,6 +10,7 @@ IBRCOMMON_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
 IBRCOMMON_INSTALL_STAGING = YES
 IBRCOMMON_LICENSE = Apache-2.0
 IBRCOMMON_LICENSE_FILES = COPYING README
+IBRCOMMON_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 IBRCOMMON_DEPENDENCIES += openssl
