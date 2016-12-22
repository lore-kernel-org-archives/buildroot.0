From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:12 -0300
Subject: [Buildroot] [PATCH 05/14] collectd: explicitly disable xencpu plugin
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-5-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It requires the libxenctrl library which buildroot doesn't provide yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 1fec414..11685cd 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -20,7 +20,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
-	write_mongodb write_redis xmms zfs_arc zone
+	write_mongodb write_redis xencpu xmms zfs_arc zone
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
-- 
2.10.2
