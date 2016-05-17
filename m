From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:45:11 +0200
Subject: [Buildroot] [git commit branch/next] gdb: add support for gdb 7.11
Message-ID: <20160517065435.AB17A8183A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ab3a9dde395beea92fed05c776d10ce03e0bd2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

gdb 7.11 was released on February 2016, it's time to include it in
Buildroot, which this commit does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 4 ++++
 package/gdb/gdb.hash       | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cc1dc40..35eb418 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -40,6 +40,9 @@ choice
 	config BR2_GDB_VERSION_7_10
 		bool "gdb 7.10.x"
 
+	config BR2_GDB_VERSION_7_11
+		bool "gdb 7.11.x"
+
 endchoice
 
 endif
@@ -53,3 +56,4 @@ config BR2_GDB_VERSION
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
 	default "7.9.1"    if BR2_GDB_VERSION_7_9 || !BR2_PACKAGE_HOST_GDB
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
+	default "7.11"	   if BR2_GDB_VERSION_7_11
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index ee0ec73..87ce09c 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,8 @@
 sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
+sha512  eadd2a59a1e48b1484eb2bea85256d6b1912926bc8b690793d02babf2639608bd22a0f2de77d4f60092da3b1dafeaa6d75a7cff3e84bd4e22fc46364b68e5e9f	gdb-7.11.tar.xz
+
 # No hash for the ARC & microblaze variants, comes from the github-helper:
 none	xxx	gdb-arc-2016.03-rc2-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
