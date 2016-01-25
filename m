From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:16:13 +0100
Subject: [Buildroot] [git commit] package/tvheadend: enable optional support
	for libhdhomerun
Message-ID: <20160201224703.7EBFA7F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c29fe24ee9540a7fa22dd9b2fcce4ea49d9080be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 43ff979..11f882a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -39,6 +39,13 @@ else
 TVHEADEND_CONF_OPTS += --disable-dvbcsa
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHDHOMERUN),y)
+TVHEADEND_DEPENDENCIES += libhdhomerun
+TVHEADEND_CONF_OPTS += --enable-hdhomerun_client
+else
+TVHEADEND_CONF_OPTS += --disable-hdhomerun_client
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
