From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:32:14 +0100
Subject: [Buildroot] [git commit branch/next] package/lttng-libust: set
 rundir to /run/lttng unconditionally
Message-ID: <20210306220921.4AB15864C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52912b2cb0112cff94fbe36f367ad5e5d24b139c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot ensures that all init-systems have a /run directory,
this should be the preferred location.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-libust/lttng-libust.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 69dc4473f0..608e8781b1 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -11,11 +11,10 @@ LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
-LTTNG_LIBUST_CONF_OPTS += --disable-man-pages --disable-examples
-
-ifeq ($(BR2_INIT_SYSTEMD),y)
-LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
-endif
+LTTNG_LIBUST_CONF_OPTS = \
+	--disable-man-pages \
+	--disable-examples \
+	--with-lttng-system-rundir=/run/lttng
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
