From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 21 Feb 2018 16:02:16 -0500
Subject: [Buildroot] [PATCH 1/1] fs/cpio/init: preserve arguments
Message-ID: <20180221210216.5167-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use "$@" instead of $* to preserve argument.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 fs/cpio/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cpio/init b/fs/cpio/init
index a275482177..dbe09ac68e 100755
--- a/fs/cpio/init
+++ b/fs/cpio/init
@@ -4,4 +4,4 @@
 exec 0</dev/console
 exec 1>/dev/console
 exec 2>/dev/console
-exec /sbin/init $*
+exec /sbin/init "$@"
-- 
2.16.1
