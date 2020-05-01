From: Vincent Fazio <vfazio@xes-inc.com>
Date: Fri,  1 May 2020 08:17:56 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/ibm-sw-tpm2: needs threads
In-Reply-To: <20200501131015.29498-1-vfazio@xes-inc.com>
References: <20200501131015.29498-1-vfazio@xes-inc.com>
Message-ID: <20200501131756.31794-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Fazio <vfazio@gmail.com>

The server process leverages threads, so add the dependency.

Fixes:

  http://autobuild.buildroot.net/results/7cce8b7ad19a48b36a38ef8fd88b96fad30f05c4/

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
Changes v1 _-> v2:
  - Fix spacing issue in condition

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
-- 
2.26.2
