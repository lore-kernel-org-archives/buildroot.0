From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Mar 2020 20:47:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: disable documentation
Message-ID: <20200308194747.978222-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gr-osmosdr/gr-osmosdr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 003f406602..fcc817fe85 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -14,7 +14,9 @@ GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD = NO
 
 GR_OSMOSDR_DEPENDENCIES = gnuradio host-python-cheetah
 
-GR_OSMOSDR_CONF_OPTS = -DENABLE_DEFAULT=OFF
+GR_OSMOSDR_CONF_OPTS = \
+	-DENABLE_DEFAULT=OFF \
+	-DENABLE_DOXYGEN=OFF
 
 # For third-party blocks, the gr-osmosdr libraries are mandatory at
 # compile time.
-- 
2.25.0
