From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  4 Apr 2018 10:49:24 +0300
Subject: [Buildroot] [PATCH] libkrb5: needs dynamic library support
Message-ID: <57d1b0676093d283f22717d1c822643dc44bcf1a.1522828164.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though the configure script checks for the presence of dlfcn.h, the
code includes this header unconditionally.

Fixes:
http://autobuild.buildroot.net/results/0e1/0e19af38d74aa74919a11ff1ebdb3b8c1a494b33/

Cc: Andr? Hentschel <nerv@dawncrow.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libkrb5/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
index 9147c9048924..f6af7130f0f2 100644
--- a/package/libkrb5/Config.in
+++ b/package/libkrb5/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBKRB5
 	bool "libkrb5"
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
 	help
 	  Kerberos is a system for authenticating users and services
 	  on a network. Kerberos is a trusted third-party service.
@@ -11,3 +12,7 @@ config BR2_PACKAGE_LIBKRB5
 	  reference implementation of Kerberos V5.
 
 	  https://web.mit.edu/kerberos/
+
+comment "apache needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
-- 
2.16.3
