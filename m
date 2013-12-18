From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:29:14 +0100
Subject: [Buildroot] [PATCH 6 of 6] gawk: add missing comment for toolchain
 option dependencies
In-Reply-To: <patchbomb.1387398548@argentina>
References: <patchbomb.1387398548@argentina>
Message-ID: <8ff1682dfb27742dfe26.1387398554@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/gawk/Config.in |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_GAWK
 
 	  http://www.gnu.org/software/gawk/
 
-comment "gawk needs a toolchain w/ wchar"
+comment "gawk needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
