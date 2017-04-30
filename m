From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:32:16 +0200
Subject: [Buildroot] [git commit] supertux: select BR2_PACKAGE_LIBCURL
Message-ID: <20170430213226.365387F8B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5855a3ef25c5851a4d2c609f926feb3aca4dc3ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcurl is unconditionally added to the dependencies list in
supertux.mk. However libcurl is not selected in Config.in.

This patch fixes that.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
