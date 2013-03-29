From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Mar 2013 08:19:55 -0300
Subject: [Buildroot] [PATCH 6/6] libpthsem: needs mmu
In-Reply-To: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1364555995-32259-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The need can be patched out by disabling the tests, however the only
package that uses libpthsem (bcusdk) needs a fork-enabled libpthsem so
there's not much point. Fixes:

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bcusdk/Config.in    | 1 +
 package/libpthsem/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
index cf082e7..c9a1947 100644
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BCUSDK
 	bool "bcusdk"
+	depends on BR2_USE_MMU # libpthsem
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBPTHSEM
 	help
diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index 9ab13c3..ae1c78f 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPTHSEM
 	bool "libpthsem"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ARGP_STANDALONE
 	help
 	  GNU pth is a user mode multi threading library. pthsem is an extend
-- 
1.8.1.5
