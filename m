From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 31 Jul 2020 23:53:41 +0200
Subject: [Buildroot] [PATCH 1/5] package/systemd: import does not need bzip2
 and lz4
In-Reply-To: <20200731215345.19212-1-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
Message-ID: <20200731215345.19212-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those are optional dependencies.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ccdd5bfa92..8d29b09add 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -265,8 +265,6 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.27.0
