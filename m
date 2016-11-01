From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:26:36 +0100
Subject: [Buildroot] [git commit] lttng-tools: remove dependency on
	host-lttng-babeltrace
Message-ID: <20161101142644.CC5E18172B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=effb200ceacb42675cedb857435651ff5e5d477d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't need to build Babeltrace for the host here. Any host running
a major Linux distribution can get a recent version of Babeltrace.

See <http://diamon.org/babeltrace/>.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/lttng-tools.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index e5b1207..3fb1691 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -13,11 +13,7 @@ LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
 # Patching configure.ac
 LTTNG_TOOLS_AUTORECONF = YES
 
-# The host-lttng-babeltrace technically isn't a required build
-# dependency. However, having the babeltrace utilities built for the
-# host is very useful, since those tools allow to convert the binary
-# trace format into an human readable format.
-LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux
+LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPTS += --enable-lttng-ust
