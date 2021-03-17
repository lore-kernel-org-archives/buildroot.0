From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:11:11 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/lttng-libust: set
 rundir to /run/lttng unconditionally
Message-ID: <20210317191335.6AAEA7F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=940406722263555f698eb1d9cb58a27270e61a0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Buildroot ensures that all init-systems have a /run directory,
this should be the preferred location.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 52912b2cb0112cff94fbe36f367ad5e5d24b139c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-libust/lttng-libust.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index f3c660c56f..2d52fa6e0f 100644
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
