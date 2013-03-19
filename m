From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Mar 2013 10:22:12 -0300
Subject: [Buildroot] [PATCH] iproute2: needs mmu
Message-ID: <1363699332-29500-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/08beca1cae9dc55b2f770a01ad95bcbe56594300/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/Config.in | 1 +
 package/openswan/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index b6ee86e..4da0d2b 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 3336156..932a75f 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
+	depends on BR2_USE_MMU # iproute2
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
-- 
1.8.1.5
