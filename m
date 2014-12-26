From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 26 Dec 2014 18:38:11 +0100
Subject: [Buildroot] [PATCH] package/leafnode2: fix news user check
Message-ID: <1419615491-8238-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-runas-user use 'news' as default but the configure stop
if news doesn't exist on the build host.
Use 'root' while cross-compiling

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/leafnode2/leafnode2.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 3bc1c68..0fc2a8d 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -14,9 +14,13 @@ LEAFNODE2_DEPENDENCIES = host-pcre pcre
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
 
+# --enable-runas-user use 'news' as default but the configure stop
+# if news doesn't exist on the build host.
+# Use 'root' while cross-compiling 
 LEAFNODE2_CONF_OPTS = \
 	--sysconfdir=/etc/leafnode2 \
-	--enable-spooldir=/var/spool/news
+	--enable-spooldir=/var/spool/news \
+	--enable-runas-user=root
 
 # Leafnode2 needs the host version of b_sortnl during
 # compilation. Instead of creating a seperate host package and
-- 
1.9.3
