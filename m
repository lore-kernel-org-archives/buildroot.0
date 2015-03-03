From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:21 +0100
Subject: [Buildroot] [RFC v3 16/30] tcpreplay: delay the execution of
	pcap-config
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-17-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Delay the execution of the pcap-config tool after the creation of the
package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/tcpreplay/tcpreplay.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 1dbe453..4378c2c 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -16,8 +16,8 @@ TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_DEPENDENCIES = libpcap
 
 # libpcap may depend on symbols in other libs
-TCPREPLAY_LIBS = $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --libs)
-TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)' \
+TCPREPLAY_LIBS = `$(STAGING_DIR)/usr/bin/pcap-config --static --libs`
+TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close="$(TCPREPLAY_LIBS)" \
 	LIBS="$(TCPREPLAY_LIBS)"
 
 ifeq ($(BR2_PACKAGE_TCPDUMP),y)
-- 
2.3.1
