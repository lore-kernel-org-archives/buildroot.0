From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 14:17:16 +0200
Subject: [Buildroot] [git commit] mysql: remove stray comment
Message-ID: <20150409122108.1E81681914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1a475f91d3fb05510fa240a93c29df0ab7ab199
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 9863553fe8fa16a4d19f652b409a44bb58ef5567 ("packages: all
salute the passing of avr32"), the dependency on !BR2_avr32 was
removed, but not the comment above it. So now, the comment seems to
apply to a line selecting some library, which doesn't make sense. This
commit gets rid of the unneeded and confusing comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index f5549ef..7133892 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Toolchain is not up to the task
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
