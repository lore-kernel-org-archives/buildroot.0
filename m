From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Mar 2017 20:23:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: disable display of
	ClueCon banner in fs_cli
Message-ID: <20170317192306.21956-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 081b99fee..fe4db68fe 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -37,6 +37,10 @@ FREESWITCH_DEPENDENCIES = \
 	util-linux \
 	zlib
 
+# disable display of ClueCon banner in fs_cli
+FREESWITCH_CONF_ENV += \
+	disable_cc=yes
+
 # we neither need host-perl nor host-php
 FREESWITCH_CONF_ENV += \
 	ac_cv_prog_PERL=false \
-- 
2.11.0
