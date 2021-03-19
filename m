From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:33:40 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/kismet: add
 SELinux refpolicy module
Message-ID: <20210319171640.3C5BA8840D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a34f5d414e48440d7d98b70769454a98211e525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

SELinux support for kismet is provided by the admin/kismet refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 32630e28d82ae7951eced0bbf6faa0fa9cfd12fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
