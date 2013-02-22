From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Feb 2013 07:24:33 -0300
Subject: [Buildroot] [PATCH] conntrack-tools: needs mmu
Message-ID: <1361528673-24052-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/641755fbc61b47361b71161eabbf3075c7598c88/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/conntrack-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index ddede0e..50f2000 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
-- 
1.7.12.4
