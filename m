From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 12:56:33 +0200
Subject: [Buildroot] [git commit] vsftpd: Fix dependency for needs mmu
Message-ID: <20130911110611.E34D99B6F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cad4bd403bf672a55585cfb610abe7b19596003
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2eb995759 "vsftpd: needs mmu" adds "depends on BR2_TOOLCHAIN_HAS_THREADS".

The build error is:
sysutil.c:(.text+0x37ac): undefined reference to `fork'

Thus it should depend on BR2_USE_MMU rather than BR2_TOOLCHAIN_HAS_THREADS.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 3d4cff1..54ef7bd 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_VSFTPD
 	bool "vsftpd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
+	depends on BR2_USE_MMU # fork()
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
