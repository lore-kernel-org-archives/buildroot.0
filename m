From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 24 Feb 2021 11:31:52 +0100
Subject: [Buildroot] [PATCH 3/4] package/lttng-libust: set rundir to
 /run/lttng unconditionally
In-Reply-To: <20210224103154.174602-1-nolange79@gmail.com>
References: <20210224103154.174602-1-nolange79@gmail.com>
Message-ID: <20210224103154.174602-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot ensures that all init-systems have a /run directory,
this should be the preferred location.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/lttng-libust/lttng-libust.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 69dc4473f0..66134fc53c 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -12,10 +12,7 @@ LTTNG_LIBUST_LICENSE_FILES = COPYING
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS += --disable-man-pages --disable-examples
-
-ifeq ($(BR2_INIT_SYSTEMD),y)
 LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
-endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
-- 
2.30.0
