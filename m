From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 14:51:14 +0100
Subject: [Buildroot] [git commit] package/omniorb: bump version to 4.2.1
Message-ID: <20160305135201.2F6B77FEC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03ee7f9823afe362b3f9ebd757cee58f5e413b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://sourceforge.net/p/omniorb/svn/6296/#diff-4

Please note that upstream also provides version 4.2.1-2
https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.1/

This version was a follow-up to 4.2.1 to provide VS platform files:
https://sourceforge.net/p/omniorb/svn/6311/#diff-5
https://sourceforge.net/p/omniorb/svn/6313/#diff-2

Because they are not needed for buildroot we stick to version 4.2.1.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omniorb/0001-uclinux-is-also-linux.patch | 19 -------------------
 package/omniorb/omniorb.hash                     |  6 +++---
 package/omniorb/omniorb.mk                       |  2 +-
 3 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/package/omniorb/0001-uclinux-is-also-linux.patch b/package/omniorb/0001-uclinux-is-also-linux.patch
deleted file mode 100644
index e003307..0000000
--- a/package/omniorb/0001-uclinux-is-also-linux.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-uclinux is also linux
-
-Patch status: sent upstream
-(http://www.omniorb-support.com/pipermail/omniorb-list/2014-November/031628.html)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-diff -Nuar omniORB-4.1.6-orig/configure.ac omniORB-4.1.6/configure.ac
---- omniORB-4.1.6-orig/configure.ac	2011-06-25 00:37:28.000000000 +0300
-+++ omniORB-4.1.6/configure.ac	2014-11-20 07:05:25.072634260 +0200
-@@ -183,6 +183,7 @@
- 
- case "$host" in
-   *-*-linux-*)   plat_name="Linux";    plat_def="__linux__";    os_v="2";;
-+  *-*-uclinux-*) plat_name="Linux";    plat_def="__linux__";    os_v="2";;
-   *-*-cygwin*)   plat_name="Cygwin";   plat_def="__cygwin__";   os_v="1";;
-   *-*-solaris*)  plat_name="SunOS";    plat_def="__sunos__";    os_v="5";;
-   *-*-osf3*)     plat_name="OSF1";     plat_def="__osf1__";     os_v="3";;
diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index d087d95..3d98b46 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.0/
-sha1	cc52c636f4f329e0481d6bb97b1f0a4bfb21fb3d	omniORB-4.2.0.tar.bz2
-md5	f1e104d0a2df92829c1b37a853f4805d	omniORB-4.2.0.tar.bz2
+# From http://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.1/
+sha1	cf0f3ca7caab901c9485ca8afd85087c080c9684	omniORB-4.2.1.tar.bz2
+md5	dbe349d2bd929d349083b303bb4317e5	omniORB-4.2.1.tar.bz2
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index d278adc..ef4faec 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.2.0
+OMNIORB_VERSION = 4.2.1
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
