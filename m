From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Oct 2014 23:59:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/leafnode: Add user 'news',
	add note about inetd to help text
Message-ID: <1412459957-14121-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2014-October/107727.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leafnode2/Config.in    |    4 ++++
 package/leafnode2/leafnode2.mk |    4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index 30a02c8..b92002d 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -6,5 +6,9 @@ config BR2_PACKAGE_LEAFNODE2
 	  Leafnode-2 is a store-and-forward NNTP (or Usenet) proxy
 	  server designed for small sites with just a few active
 	  newsgroups.
+	  Leafnode-2 needs inetd, check chapter 14
+	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/leafnode-readme.txt
+	  for example add this line to inetd.conf
+	  nntp    stream  tcp     nowait  news    /usr/sbin/leafnode
 
 	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 3e6bd0b..3bc1c68 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -32,4 +32,8 @@ endef
 
 LEAFNODE2_PRE_BUILD_HOOKS += LEAFNODE2_BUILD_SORTNL_TOOL
 
+define LEAFNODE2_USERS
+	news -1 news -1 * - - - Leafnode2 daemon
+endef
+
 $(eval $(autotools-package))
-- 
1.7.10.4
