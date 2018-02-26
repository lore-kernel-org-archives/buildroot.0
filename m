From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 20:49:40 +0100
Subject: [Buildroot] [git commit] fs/cpio/init: preserve arguments
Message-ID: <20180226195243.37388882B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fa524144bd2019f98159f21802de08be7b5bea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use "$@" instead of $* to preserve arguments containing spaces.

The shell expands "$@" as "$1" "$2" "$3"... while it expands $@ as $1 $2
$3. With the second form, we loses spaces in positional parameters.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
