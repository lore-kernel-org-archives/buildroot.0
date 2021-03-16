From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:10:37 +0100
Subject: [Buildroot] [git commit] package/kismet: add SELinux refpolicy
 module
Message-ID: <20210316214740.9D7AE87B82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32630e28d82ae7951eced0bbf6faa0fa9cfd12fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux support for kismet is provided by the admin/kismet refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kismet/kismet.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index b39b58d81b..5445db0b1f 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -17,6 +17,8 @@ KISMET_DEPENDENCIES = \
 	zlib
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
+KISMET_SELINUX_MODULES = kismet
+
 KISMET_CONF_OPTS = --disable-debuglibs
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
