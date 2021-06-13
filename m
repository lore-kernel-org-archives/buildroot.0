From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:02:47 +0200
Subject: [Buildroot] [git commit] package/tpm-tools: requires DES support in
 openssl
Message-ID: <20210613193436.544D98D452@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5563262bc076c4954fe027ee032e36446b497db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/c104263d0fb6f758ac1e654b114f68b4fbfcf6bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tpm-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index ca70adc80c..3ce6391acd 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TPM_TOOLS
 	depends on !BR2_STATIC_LIBS # trousers
 	select BR2_PACKAGE_TROUSERS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Tools to manage and diagnose a TPM
 
