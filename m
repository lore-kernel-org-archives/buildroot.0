From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:17 +0100
Subject: [Buildroot] [git commit] package/sudo: security bump to version
 1.9.5p1
Message-ID: <20210118203943.D445E818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b14e996660d1f77e5428ba9b6aef71d540d7523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fixes CVE-2021-23239, a potential information leak in sudoedit that
  could be used to test for the existence of directories not normally
  accessible to the user in certain circumstances. When creating a new
  file, sudoedit checks to make sure the parent directory of the new
  file exists before running the editor. However, a race condition
  exists if the invoking user can replace (or create) the parent
  directory. If a symbolic link is created in place of the parent
  directory, sudoedit will run the editor as long as the target of the
  link exists. If the target of the link does not exist, an error
  message will be displayed. The race condition can be used to test for
  the existence of an arbitrary directory. However, it cannot be used to
  write to an arbitrary location.
- Fixes CVE-2021-23240, a flaw in the temporary file handling of
  sudoedit's SELinux RBAC support. On systems where SELinux is enabled,
  a user with sudoedit permissions may be able to set the owner of an
  arbitrary file to the user-ID of the target user. On Linux kernels
  that support protected symlinks setting
  /proc/sys/fs/protected_symlinks to 1 will prevent the bug from being
  exploited. For more information, see Symbolic link attack in
  SELinux-enabled sudoedit.
- Update license hash:
  - copyright of python bindings added with
    https://github.com/sudo-project/sudo/commit/6c1b155fed23348c58a03f6c1193922132b5b66a
  - a few other files (ISC licenced) added with
    https://github.com/sudo-project/sudo/commit/d4b2db9078bd54f158261017dcb4d1340398a5fa
  - year updated with
    https://github.com/sudo-project/sudo/commit/9e111eae57524ca72002ad1db36eb68ccd50b167
- Update indentation in hash file (two spaces)

https://www.sudo.ws/stable.html#1.9.5p1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index fff1aa2343..3a0ff46838 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256 7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f  sudo-1.8.31.tar.gz
+sha256  4dddf37c22653defada299e5681e0daef54bb6f5fc950f63997bb8eb966b7882  sudo-1.9.5p1.tar.gz
 # Locally calculated
-sha256 be099fd0ee954224f392dde163aef6d6359c58a5afa1ebb1bd55058318add789  doc/LICENSE
+sha256  505c5955c373514e2533a24a8346f44038e29cba874f5ca83beb171a7409089f  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a4def4368a..6faccfa25b 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.31
+SUDO_VERSION = 1.9.5p1
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
