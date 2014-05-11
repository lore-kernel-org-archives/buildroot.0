From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 11 May 2014 11:34:52 +0300
Subject: [Buildroot] [PATCH] libeio: needs threads
Message-ID: <082d8eff94b1a2e5f210119dcff157435af6147c.1399797292.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/278/27854bf8425d64dbb475653161bbf1f386173366/

libeio only reverse dependency (enlightenment) depends on
BR2_TOOLCHAIN_HAS_THREADS already.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/efl/libeio/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/efl/libeio/Config.in b/package/efl/libeio/Config.in
index 0b2751ce6d22..5b1e395788ed 100644
--- a/package/efl/libeio/Config.in
+++ b/package/efl/libeio/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBEIO
 	select BR2_PACKAGE_LIBEET
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBECORE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Eio integrates with EFL (Ecore, Eina) to provide efficient
 	  filesystem Input/Output (I/O). It use the best techniques to
@@ -16,3 +17,6 @@ config BR2_PACKAGE_LIBEIO
 	  naive implementations, and it is easy to use.
 
 	  http://trac.enlightenment.org/e/wiki/Eio
+
+comment "libeio needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.0.0.rc0
