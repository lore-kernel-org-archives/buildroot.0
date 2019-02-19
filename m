From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 20:58:56 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/gnuradio: disable
 xml document generation
Message-ID: <20190219195857.51B9B8B6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff256b5af5aedd23be71a4182a22aae2ebfb56be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes
http://autobuild.buildroot.net/results/f94/f941d84c781b524530770f5b9360863a821e8ba1/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e43cbb3cc1c3da692563549287a4e0433dfc3f4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/gnuradio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index a55c116118..9e7c91acbe 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -24,7 +24,8 @@ endif
 GNURADIO_CONF_OPTS = \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
-	-DENABLE_GNURADIO_RUNTIME=ON
+	-DENABLE_GNURADIO_RUNTIME=ON \
+	-DXMLTO_EXECUTABLE=NOTFOUND
 
 # For third-party blocks, the gnuradio libraries are mandatory at
 # compile time.
