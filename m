From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:55:29 +0200
Subject: [Buildroot] [git commit] opkg: add missing dependency on libarchive
Message-ID: <20160430125534.7E1CC7FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54d979cf906be2d9adfa9d7a0d45f19494d49f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opkg requires libarchive. This was expressed in the Config.in file with a
select, but not in the .mk file.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg/opkg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 6e4d4ff..bf19a60 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -8,7 +8,7 @@ OPKG_VERSION = v0.3.1
 OPKG_SITE = http://git.yoctoproject.org/git/opkg
 OPKG_SITE_METHOD = git
 # Uses PKG_CHECK_MODULES() in configure.ac
-OPKG_DEPENDENCIES = host-pkgconf
+OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPLv2+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
