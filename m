From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Oct 2016 13:48:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/babeltrace: enable debug info
	support for the host variant
In-Reply-To: <20161031074624.7576-10-eeppeliteloop@gmail.com>
References: <20161031074624.7576-10-eeppeliteloop@gmail.com>
Message-ID: <1477918137-25258-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/babeltrace/babeltrace.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/babeltrace/babeltrace.mk b/package/babeltrace/babeltrace.mk
index d178a6c..17eaaaa 100644
--- a/package/babeltrace/babeltrace.mk
+++ b/package/babeltrace/babeltrace.mk
@@ -12,8 +12,8 @@ BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
 BABELTRACE_CONF_OPTS += --disable-debug-info
 HOST_BABELTRACE_DEPENDENCIES = \
-	host-popt host-util-linux host-libglib2 host-pkgconf
-HOST_BABELTRACE_CONF_OPTS += --disable-debug-info
+	host-popt host-util-linux host-libglib2 host-pkgconf host-elfutils
+HOST_BABELTRACE_CONF_OPTS += --ensable-debug-info
 
 # For 0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
 BABELTRACE_AUTORECONF = YES
-- 
2.7.4
