From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2013 12:17:20 +0100
Subject: [Buildroot] [git commit] cubieboard: mkcubiecard: use the right
	command for checking user privilege
Message-ID: <20131203112057.1F41D9BEF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2257e36a57c15ef31a013dac56ff7c551fec70c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some shell environments the EUID variable, which checks the
user id, is not defined. Use `id -u` instead.

This patch mutes the following error:

./board/cubietech/cubieboard/mkcubiecard.sh: 31: [: -ne: unexpected operator

Signed-off-by: Andi Shyti <andi@etezian.org>
Reviewed-by: Arvid Picciani <aep@exys.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/cubietech/cubieboard/mkcubiecard.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
