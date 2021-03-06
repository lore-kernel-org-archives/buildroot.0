From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:32:14 +0100
Subject: [Buildroot] [git commit] package/lttng-tools: set rundir to
 /run/lttng unconditionally
Message-ID: <20210308072140.43B1681607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9441b93ca474b8112de490b96cbaf77e08a3be2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot ensures that all init-systems have a /run directory,
this should be the preferred location.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-tools/lttng-tools.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index d66233414e..8789ded333 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -10,12 +10,10 @@ LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
 LTTNG_TOOLS_LICENSE = GPL-2.0, LGPL-2.1 (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Clause GPL-2.0 LGPL-2.1 MIT)
-LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
-
-ifeq ($(BR2_INIT_SYSTEMD),y)
-LTTNG_TOOLS_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
-endif
+LTTNG_TOOLS_CONF_OPTS = \
+	--disable-man-pages \
+	--with-lttng-system-rundir=/run/lttng
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPTS += --with-lttng-ust
