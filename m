From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Aug 2016 14:19:36 +0200
Subject: [Buildroot] [PATCH v2 3/3] tinycbor: add a dependency
In-Reply-To: <1471609176-3397-1-git-send-email-fabrice.fontaine@orange.com>
References: <1471609176-3397-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1471609176-3397-3-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As tinycbor uses fopencookie() which is not available with the external
blackfin uclinux (UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is unset), add a
dependency on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/tinycbor/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinycbor/Config.in b/package/tinycbor/Config.in
index 41f0b5f..cf176e4 100644
--- a/package/tinycbor/Config.in
+++ b/package/tinycbor/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_TINYCBOR
 	bool "tinycbor"
+	# package uses fopencookie(), not available with this toolchain
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	help
 	  Concise Binary Object Representation (CBOR) Library
 
-- 
2.5.0
