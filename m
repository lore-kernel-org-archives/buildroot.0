From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Mar 2021 07:38:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/siproxd: needs MMU
In-Reply-To: <20210316063821.2310693-1-fontaine.fabrice@gmail.com>
References: <20210316063821.2310693-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316063821.2310693-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

siproxd which has been added with commit
3efc5a250c1c98598ba4c91a7d71d11343d937ab unconditionally uses fork

Fixes:
 - http://autobuild.buildroot.org/results/0c59373ab3778cf7b15e73968295cec8d109f7cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/siproxd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/siproxd/Config.in b/package/siproxd/Config.in
index e73a33bf14..24c710b375 100644
--- a/package/siproxd/Config.in
+++ b/package/siproxd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SIPROXD
 	bool "siproxd"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOSIP2
 	select BR2_PACKAGE_LIBTOOL
@@ -18,4 +19,5 @@ config BR2_PACKAGE_SIPROXD
 	  http://siproxd.sourceforge.net/
 
 comment "siproxd needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.30.0
