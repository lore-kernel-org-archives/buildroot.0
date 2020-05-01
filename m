From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 15:47:00 +0200
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: needs threads
Message-ID: <20200501133244.1BE5A8FBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=106a30a479b33796d274f650cba01e7dabfb195d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The server process leverages threads, so add the dependency.

Fixes:

  http://autobuild.buildroot.net/results/7cce8b7ad19a48b36a38ef8fd88b96fad30f05c4/

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ibm-sw-tpm2/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ibm-sw-tpm2/Config.in b/package/ibm-sw-tpm2/Config.in
index dc5630490f..b402ba7150 100644
--- a/package/ibm-sw-tpm2/Config.in
+++ b/package/ibm-sw-tpm2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IBM_SW_TPM2
 	bool "ibm-sw-tpm2"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # ibm-sw-tpm2
 	select BR2_PACKAGE_OPENSSL
 	# libressl is not supported
@@ -12,5 +13,5 @@ config BR2_PACKAGE_IBM_SW_TPM2
 
 	  https://sourceforge.net/projects/ibmswtpm2/
 
-comment "ibm-sw-tpm2 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "ibm-sw-tpm2 needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
