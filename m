From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Aug 2013 23:59:42 +0200
Subject: [Buildroot] [git commit] git: needs MMU support
Message-ID: <20130806215937.A5A0A9B1C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3c950d0d5d5e8d1382610e259a79d5ddf831941
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/b5454e62c6ea18a9d30148c704927e820f29a7d4/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/git/Config.in b/package/git/Config.in
index 931d460..854c0d4 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GIT
 	bool "git"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
