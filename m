From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 31 Oct 2016 03:46:19 -0400
Subject: [Buildroot] [PATCH v3 4/9] lttng-tools: remove dependency on
	host-lttng-babeltrace
In-Reply-To: <20161031074624.7576-1-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
Message-ID: <20161031074624.7576-5-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't need to build Babeltrace for the host here. Any host running
a major Linux distribution can get a recent version of Babeltrace.

See <http://diamon.org/babeltrace/>.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v2 -> v3:
  - Nothing changed.

Changes v1 -> v2:
  - Add Reviewed-by tag.

 package/lttng-tools/lttng-tools.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 3d884d3..9d9cb1c 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -10,12 +10,7 @@ LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr --disable-man-pages
-
-# The host-lttng-babeltrace technically isn't a required build
-# dependency. However, having the babeltrace utilities built for the
-# host is very useful, since those tools allow to convert the binary
-# trace format into an human readable format.
-LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux
+LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux

 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPTS += --with-lttng-ust
--
2.9.3
