From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:29:12 +0100
Subject: [Buildroot] [PATCH 4 of 6] p11-kit: add missing comment for dynamic
 library support
In-Reply-To: <patchbomb.1387398548@argentina>
References: <patchbomb.1387398548@argentina>
Message-ID: <d30ec246582b67ff559f.1387398552@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/p11-kit/Config.in |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_P11_KIT
 
 	  http://p11-glue.freedesktop.org/p11-kit.html
 
-comment "p11-kit needs a toolchain w/ threads"
+comment "p11-kit needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
