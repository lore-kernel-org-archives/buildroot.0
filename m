From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 18:02:08 +0200
Subject: [Buildroot] [git commit] libkrb5: needs dynamic library support
Message-ID: <20180404160225.D86B083EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e55789a1c296ebb071b1098d52c0c22a1e25d1a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though the configure script checks for the presence of dlfcn.h, the
code includes this header unconditionally.

Fixes:
http://autobuild.buildroot.net/results/0e1/0e19af38d74aa74919a11ff1ebdb3b8c1a494b33/

Cc: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
index 9147c90489..2e24c87229 100644
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
+comment "libkrb5 needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
