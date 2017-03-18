From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:00:56 +0100
Subject: [Buildroot] [git commit] package/freeswitch: disable display of
	ClueCon banner in fs_cli
Message-ID: <20170318130103.E1FE882269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=848370091c8ab54b22b7b05c472ef5c5c02e3185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 081b99f..fe4db68 100644
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
