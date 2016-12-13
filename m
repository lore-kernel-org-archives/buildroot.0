From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2016 00:00:25 +0100
Subject: [Buildroot] [git commit] package/lttng-babeltrace: enable debug
	info support for the host variant
Message-ID: <20161213230031.AC7C1805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1df0a05b89ccccee8ba08640426d2bea2c188e65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
[Thomas: fix typo, adjust on top of master.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 2633991..fb5cb65 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -10,9 +10,12 @@ LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
+# The host-elfutils dependency is optional, but since we don't have
+# options for host packages, just build support for it
+# unconditionally.
 HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
-	host-popt host-util-linux host-libglib2 host-pkgconf
-HOST_LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
+	host-popt host-util-linux host-libglib2 host-pkgconf host-elfutils
+HOST_LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
 
 # For: 0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
 LTTNG_BABELTRACE_AUTORECONF = YES
