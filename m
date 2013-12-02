From: Andi Shyti <andi@etezian.org>
Date: Mon,  2 Dec 2013 14:46:07 +0100
Subject: [Buildroot] [PATCH] cubieboard: mkcubiecard: use the right command
	for checking user privilege
Message-ID: <1385991967-10126-1-git-send-email-andi@etezian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some shell environments the EUID variable, which checks the
user id, is not defined. Use `id -u` instead.

This patch mutes the following error:

./board/cubietech/cubieboard/mkcubiecard.sh: 31: [: -ne: unexpected operator

Signed-off-by: Andi Shyti <andi@etezian.org>
Reviewed-by: Arvid Picciani <aep@exys.org>
---
 board/cubietech/cubieboard/mkcubiecard.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/cubietech/cubieboard/mkcubiecard.sh b/board/cubietech/cubieboard/mkcubiecard.sh
index 34afc87..f1d5a9f 100755
--- a/board/cubietech/cubieboard/mkcubiecard.sh
+++ b/board/cubietech/cubieboard/mkcubiecard.sh
@@ -28,7 +28,7 @@ if [ $# -ne 2 ]; then
 	exit 1;
 fi
 
-if [ $EUID -ne 0 ]; then
+if [ `id -u` -ne 0 ]; then
 	echo "This script must be run as root" 1>&2
 	exit 1
 fi
-- 
1.8.4.4
