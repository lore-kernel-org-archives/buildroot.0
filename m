From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:45:20 +0200
Subject: [Buildroot] [git commit] package/checksec: bump to version 2.1.0
Message-ID: <20190803084851.3DD338D4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2467822c85d992daaed25693564b0407db495546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch, it does not seem to be needed anymore as issue was not
reproduced (see https://github.com/slimm609/checksec.sh/issues/54)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-checksec-Fixed-issue-with-relative-path.patch | 43 ----------------------
 package/checksec/checksec.hash                     |  2 +-
 package/checksec/checksec.mk                       |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch b/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
deleted file mode 100644
index 3ed75a3c34..0000000000
--- a/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b48a2dfae26fa3b4af8e65fb5953b3caf62c137b Mon Sep 17 00:00:00 2001
-From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
-Date: Mon, 21 May 2018 14:34:23 -0500
-Subject: [PATCH] checksec: Fixed issue with relative path
-
-Before this patch, the checksec script was not able to find existing
-directories when the user passed a relative path with --dir/-d,
-the script aborted with a "No such file or directory". The same error
-was reported when the script was executed through a relative path.
-
-https://github.com/slimm609/checksec.sh/issues/54
-
-Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
----
- checksec | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/checksec b/checksec
-index 24b521f..baf8d63 100755
---- a/checksec
-+++ b/checksec
-@@ -1193,7 +1193,7 @@ do
-     echo_message "RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      FORTIFY Checked         Total   Filename\n" '' "<dir name='$tempdir'>\n" "{ \"dir\": { \"name\":\"$tempdir\" },"
-     fdircount=0
-     fdirtotal=0
--    for N in $(find $tempdir -type f); do
-+    for N in $(find . -type f); do
-       if [[ "$N" != "[A-Za-z1-0]*" ]]; then
-         out=$(file "$N")
-         if [[  $out =~ ELF ]] ; then
-@@ -1201,7 +1201,7 @@ do
-         fi
-       fi
-     done
--    for N in $(find $tempdir -type f); do
-+    for N in $(find . -type f); do
-       if [[ "$N" != "[A-Za-z1-0]*" ]]; then
-     # read permissions?
-     if [[ ! -r "$N" ]]; then
--- 
-1.9.1
-
diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index e3d1ffd5d1..4543f62a36 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 510b0b0528f15d0bf13fa1ae7140d2b9fc9261323c98ff76c011bef475a69c14 checksec-cdefe53eb72e6e8f23308417d2fc6b68cba9dbac.tar.gz
+sha256 e50a92a2bb22d40d1aa297cd011209ab5ad0b620236dfb9a7afe4c29744260a9 checksec-2.1.0.tar.gz
 sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index bfe54c262e..ffa249663c 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = cdefe53eb72e6e8f23308417d2fc6b68cba9dbac
+CHECKSEC_VERSION = 2.1.0
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
