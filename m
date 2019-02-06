From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  6 Feb 2019 14:16:03 -0600
Subject: [Buildroot] [PATCH] package/gnuradio: disable xml document
 generation
Message-ID: <1549484163-54692-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f94/f941d84c781b524530770f5b9360863a821e8ba1/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/gnuradio/gnuradio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index d6d07f6..202c221 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -26,7 +26,8 @@ GNURADIO_CONF_OPTS = \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
-	-DENABLE_GR_QTGUI=OFF
+	-DENABLE_GR_QTGUI=OFF \
+	-DXMLTO_EXECUTABLE=NOTFOUND
 
 # For third-party blocks, the gnuradio libraries are mandatory at
 # compile time.
-- 
1.9.1
