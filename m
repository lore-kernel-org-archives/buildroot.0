From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:43:33 +0100
Subject: [Buildroot] [git commit] package/gr-osmosdr: add python3 support
Message-ID: <20200203223239.F3D3689110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a842bdba71c49a3636a8b8401d1eb66642b85384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gnuradio 3.8 support python2 and python3 and since gr-osmosdr support both two,
adapts dependencies

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 98b6e25012..003f406602 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -22,7 +22,7 @@ GR_OSMOSDR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GR_OSMOSDR_PYTHON),y)
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
-GR_OSMOSDR_DEPENDENCIES += python
+GR_OSMOSDR_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
