From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Feb 2019 04:23:05 -0600
Subject: [Buildroot] [PATCH] package/softether: bump to v4.28-9669-beta
Message-ID: <1549362185-44279-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Source code is now compatible with OpenSSL 1.1.x.

Fixes
http://autobuild.buildroot.net/results/a6f/a6f1f326ce2525ee0f9d423f1b6d989a89e6b87e/build-end.log

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../softether/0003-use-fhs-install-directories.patch  | 19 ++++---------------
 package/softether/softether.hash                      |  4 ++--
 package/softether/softether.mk                        |  4 ++--
 3 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/package/softether/0003-use-fhs-install-directories.patch b/package/softether/0003-use-fhs-install-directories.patch
index c489cc1..ba00d9b 100644
--- a/package/softether/0003-use-fhs-install-directories.patch
+++ b/package/softether/0003-use-fhs-install-directories.patch
@@ -15,20 +15,22 @@ https://github.com/dajhorn/SoftEtherVPN/commit/b9420c3bfc2a8b9d35d0c8e5f6849007c
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+[Updated for 4.28 build 9669 beta - src/Mayaqua/Encrypt.c dropped IsXRevoked()
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 ---
  autotools/softether.am      |  1 +
  src/Cedar/Admin.c           |  2 +-
  src/Cedar/Command.c         |  6 +++++-
  src/Cedar/Logging.c         |  2 +-
  src/Cedar/Server.c          |  4 ++--
- src/Mayaqua/Encrypt.c       |  2 +-
  src/Mayaqua/FileIO.c        | 39 ++++++++++++++++++++++++++++++++++++---
  src/Mayaqua/FileIO.h        |  2 ++
  src/Mayaqua/Mayaqua.c       |  4 ++++
  src/Mayaqua/Table.c         |  6 +++++-
  src/Mayaqua/Unix.c          |  6 +++---
  src/bin/hamcore/Makefile.am |  8 ++++++--
- 12 files changed, 67 insertions(+), 15 deletions(-)
+ 11 files changed, 66 insertions(+), 14 deletions(-)
 
 Index: b/autotools/softether.am
 ===================================================================
@@ -115,19 +117,6 @@ Index: b/src/Cedar/Server.c
  	Format(dir_full_path, sizeof(dir_full_path), "%s/%s", exe_dir, dirname);
  
  	dir = EnumDir(dir_full_path);
-Index: b/src/Mayaqua/Encrypt.c
-===================================================================
---- a/src/Mayaqua/Encrypt.c
-+++ b/src/Mayaqua/Encrypt.c
-@@ -579,7 +579,7 @@
- 		return false;
- 	}
- 
--	GetExeDir(dirname, sizeof(dirname));
-+	GetStateDir(dirname, sizeof(dirname));
- 
- 	// Search the CRL file
- 	t = EnumDir(dirname);
 Index: b/src/Mayaqua/FileIO.c
 ===================================================================
 --- a/src/Mayaqua/FileIO.c
diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index ec6e060..fdbbbca 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8e6310d36e579ea07171ce5fcb9ebe31235d218444c4e4836ca6c32aa49c1f93 softether-v4.22-9634-beta.tar.gz
-sha256 7aeb873293fa0e44425dabf68a8e46e26c848fe58efcfd3ac7c90a3386f3edd1 LICENSE
+sha256 fbf6e04c4451d0cb1555c3a53c178b5453c7d761119f82fd693538c9f115fecb softether-v4.28-9669-beta.tar.gz
+sha256 0a889e7e7a277397d0a2d56c37814eefd8c6b6129d8b74ee2d27fc3415fad561 LICENSE
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 05d2f20..31378e8 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = v4.22-9634-beta
-SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
+SOFTETHER_VERSION = v4.28-9669-beta
+SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-softether libopenssl readline
-- 
1.9.1
