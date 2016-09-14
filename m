From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Sep 2016 16:46:06 +0200
Subject: [Buildroot] [git commit] wandboard: Remove unneeded return code
Message-ID: <20160914144632.5E2AD82136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d26ac1e764921bdd90109381e38e328fa1bfa7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to handle this return code, so just remove it.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/wandboard/post-image.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/board/wandboard/post-image.sh b/board/wandboard/post-image.sh
index 11f58db..18e76aa 100755
--- a/board/wandboard/post-image.sh
+++ b/board/wandboard/post-image.sh
@@ -13,5 +13,3 @@ genimage \
   --outputpath "${BINARIES_DIR}" \
   --config "${GENIMAGE_CFG}"
 
-RET=${?}
-exit ${RET}
