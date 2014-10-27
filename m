From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:19 -0700
Subject: [Buildroot] [PATCH 11/15 v6] [RFC] package/libatasmart: needs
	libudev, not a udev daemon
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <27de4c8f1b5f8f71c27e51c83c5491a803eae37f.1414442699.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do as the comment says: it's only libudev that is required.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/libatasmart/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
index 9db3b09..dcfb8c8 100644
--- a/package/libatasmart/Config.in
+++ b/package/libatasmart/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBATASMART
 	bool "libatasmart"
-	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	help
 	  The libatasmart package is a disk reporting library.
 	  It only supports a subset of the ATA S.M.A.R.T. functionality.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBATASMART
 	  http://0pointer.de/blog/projects/being-smart.html
 
 comment "libatasmart requires udev to be enabled"
-	depends on !BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
-- 
1.9.1
