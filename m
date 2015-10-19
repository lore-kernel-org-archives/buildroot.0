From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 19 Oct 2015 12:42:08 +0200
Subject: [Buildroot] [PATCH 1/2] jq: disable maintainer mode
Message-ID: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Since version 1.5, maintainer mode is enabled by default. We don't need
this, and is in particular problematic because it requires bison 3.0.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/jq/jq.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index dd13276..8053e39 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -12,4 +12,7 @@ JQ_LICENSE_FILES = COPYING
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
+# jq explicitly enables maintainer mode, which we don't need/want
+JQ_CONF_OPTS += --disable-maintainer-mode
+
 $(eval $(autotools-package))
-- 
1.9.5
