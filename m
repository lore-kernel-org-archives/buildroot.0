From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 24 Feb 2021 11:31:53 +0100
Subject: [Buildroot] [PATCH 4/4] package/lttng-tools: set rundir to
 /run/lttng unconditionally
In-Reply-To: <20210224103154.174602-1-nolange79@gmail.com>
References: <20210224103154.174602-1-nolange79@gmail.com>
Message-ID: <20210224103154.174602-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot ensures that all init-systems have a /run directory,
this should be the preferred location.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/lttng-tools/lttng-tools.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index d66233414e..b876b11650 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -10,12 +10,9 @@ LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
 LTTNG_TOOLS_LICENSE = GPL-2.0, LGPL-2.1 (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Clause GPL-2.0 LGPL-2.1 MIT)
-LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
-
-ifeq ($(BR2_INIT_SYSTEMD),y)
+LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 LTTNG_TOOLS_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
-endif
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPTS += --with-lttng-ust
-- 
2.30.0
