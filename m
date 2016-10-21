From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Fri, 21 Oct 2016 23:15:56 +0530
Subject: [Buildroot] [PATCH] pppd: fix config file name
Message-ID: <1477071956-17212-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When radius plugin is enabled, we get following error:

/usr/bin/install: cannot stat '/home/rahul.bedarkar/buildroot/output/build/pppd-2.4.7/pppd/plugins/radius/etc/server': No such file or directory

Name of config file is 'servers' instead of 'server'.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/pppd/pppd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 92897be..3741f92 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -18,7 +18,7 @@ PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_RADIUS_CONF = \
 	dictionary dictionary.ascend dictionary.compat \
 	dictionary.merit dictionary.microsoft \
-	issue port-id-map realms server radiusclient.conf
+	issue port-id-map realms servers radiusclient.conf
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
 PPPD_DEPENDENCIES += libpcap
-- 
2.6.2
