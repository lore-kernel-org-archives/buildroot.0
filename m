From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:04:48 +0100
Subject: [Buildroot] [git commit] package/tvheadend: Add support for
	libdvbcsa
Message-ID: <20141028211001.874CEB1DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=050ca88db35bc81158de1c8709594e2dcd4af72e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1445838..54112a6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
+TVHEADEND_DEPENDENCIES += libdvbcsa
+TVHEADEND_CONF_OPTS += --enable-dvbcsa
+else
+TVHEADEND_CONF_OPTS += --disable-dvbcsa
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
@@ -30,6 +37,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
 	 --python="$(HOST_DIR)/usr/bin/python"	\
 	 --disable-dvbscan			\
+	 $(TVHEADEND_CONF_OPTS)			\
 	)
 endef
 
