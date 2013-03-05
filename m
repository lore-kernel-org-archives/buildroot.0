From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon,  4 Mar 2013 20:41:55 -0800
Subject: [Buildroot] [PATCH] htop: needs MMU
In-Reply-To: <y>
References: <y>
Message-ID: <1362458515-7743-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/023b40f48c8006cd49c585efae3cfa065b21bf51

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/htop/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/htop/Config.in b/package/htop/Config.in
index 55b4b15..51304af 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HTOP
 	bool "htop"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  htop is an interactive text-mode process viewer for Linux.
-- 
1.7.10.4
