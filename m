From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 17:20:27 +0200
Subject: [Buildroot] [git commit] gr-osmosdr: add host-python-cheetah
 dependency
Message-ID: <20180820151305.7E9628DF73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0be9c192e8f5eb21252aef2b0724e3985bdf0d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since b7f1b030413a51637323a755cbd985b06026990e host-python-cheetah is no more a
dependency for gnuradio. So this package must be explicitly added for
gr-osmosdr.

Fix : http://autobuild.buildroot.net/results/aa208a69996548c15d937fc7c97d267162a56c48/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 55e043ef32..9ed4ad3118 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -12,7 +12,7 @@ GR_OSMOSDR_LICENSE_FILES = COPYING
 # gr-osmosdr prevents doing an in-source-tree build
 GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD = NO
 
-GR_OSMOSDR_DEPENDENCIES = gnuradio
+GR_OSMOSDR_DEPENDENCIES = gnuradio host-python-cheetah
 
 GR_OSMOSDR_CONF_OPTS = -DENABLE_DEFAULT=OFF
 
