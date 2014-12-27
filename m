From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:11:26 +0100
Subject: [Buildroot] [git commit] package/leafnode2: fix news user check
Message-ID: <20141227161137.3C3B480060@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=159cdbd5a3b3a14b004a6df2ce4bf202fb4cb592
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-runas-user use 'news' as default but the configure stop
if news doesn't exist on the build host.
Use 'root' while cross-compiling

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/leafnode2/leafnode2.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

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
