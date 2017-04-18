From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Apr 2017 16:51:53 +0100
Subject: [Buildroot] [PATCH] supertux: select BR2_PACKAGE_LIBCURL
Message-ID: <20170418155153.52641-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcurl is unconditionally added to the dependencies list in
supertux.mk. However libcurl is not selected in Config.in.

This patch fixes that.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/supertux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index d4fd80b..684c2cc 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_SUPERTUX
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLEW
 	select BR2_PACKAGE_LIBGLU # GL/glu.h
 	select BR2_PACKAGE_LIBOGG
-- 
2.10.2
