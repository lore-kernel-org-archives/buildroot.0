From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:57 +0200
Subject: [Buildroot] [PATCH 28/69] lttng-babeltrace: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-29-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index fdc647e8dadc..b2e03a9952a1 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -11,6 +11,9 @@ LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (tes
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
+HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
+	host-popt host-util-linux host-libglib2 host-pkgconf
+
 # for 0002-configure-fix-uuid-support-detection-on-static-build.patch
 LTTNG_BABELTRACE_AUTORECONF = YES
 
-- 
2.1.0
