From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:40:55 +0200
Subject: [Buildroot] [git commit] doxygen: add explicit dependencies for
	host variant
Message-ID: <20160703064348.AF6917FE6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a4cf38d65111183264a9cfdf2265b6ad9be67e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/doxygen/doxygen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 14dd090..cf7dfee 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -9,7 +9,7 @@ DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri
 DOXYGEN_LICENSE = GPLv2
 DOXYGEN_LICENSE_FILES = LICENSE
-DOXYGEN_DEPENDENCIES = host-flex host-bison
+HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
 define HOST_DOXYGEN_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR)/usr)
