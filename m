From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 18:25:25 +0100
Subject: [Buildroot] [PATCH 1/2] package/gerbera: fix linking with
 std::filesystem
Message-ID: <20210126172526.2133034-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not force to CXX_FILESYSTEM_NO_LINK_NEEDED to ON to allow gerbera to
link with the approriate library for std::filesystem

It should be noted that check_cxx_source_runs has been dropped since
version 1.6.0 and
https://github.com/gerbera/gerbera/commit/a3a64bed1d78fc51c7ab298db019c89852acb80c

Fixes:
 - http://autobuild.buildroot.org/results/0fcd0ce167c04f788bf1b9414ae5e7677691c7cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gerbera/gerbera.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 9468def041..6e36377798 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -18,8 +18,7 @@ GERBERA_DEPENDENCIES = \
 	zlib
 GERBERA_CONF_OPTS = \
 	-DWITH_DEBUG=OFF \
-	-DWITH_JS=OFF \
-	-DCXX_FILESYSTEM_NO_LINK_NEEDED=ON
+	-DWITH_JS=OFF
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.29.2
