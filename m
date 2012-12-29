From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 15:42:33 +0100
Subject: [Buildroot] [PATCH 7/7] docs/manual: do not suggest to create a
	symlink for shared download directory
In-Reply-To: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1356792153-24033-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Creating a symbolic link for the download directory is really not a
useful suggestion, since we have the much better solution of the
BUILDROOT_DL_DIR environment variable. So emphasize this solution
instead, and remove the suggestion of the symbolic link.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/download-location.txt |   23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 4befe0a..36a1356 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -3,25 +3,18 @@
 Location of downloaded packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The various tarballs that are downloaded by Buildroot are all stored in
-+DL_DIR+, which by default is the +dl+ directory. If you want
+The various tarballs that are downloaded by Buildroot are all stored
+in +BR2_DL_DIR+, which by default is the +dl+ directory. If you want
 to keep a complete version of Buildroot which is known to be working
 with the associated tarballs, you can make a copy of this directory.
-This will allow you to regenerate the toolchain and the target filesystem
-with exactly the same versions.
+This will allow you to regenerate the toolchain and the target
+filesystem with exactly the same versions.
 
 If you maintain several Buildroot trees, it might be better to have a
-shared download location. This can be accessed by creating a symbolic
-link from the +dl+ directory to the shared download location:
-
------------------
- $ ln -s <shared download location> dl
------------------
-
-Another way of accessing a shared download location is to create the
-+BUILDROOT_DL_DIR+ environment variable.  If this is set, then the
-value of DL_DIR in the project is overridden. The following line
-should be added to +<~/.bashrc>+.
+shared download location. This can be achieved by pointing the
++BUILDROOT_DL_DIR+ environment variable to a directory.  If this is
+set, then the value of +BR2_DL_DIR+ in the Buildroot configuration is
+overridden. The following line should be added to +<~/.bashrc>+.
 
 -----------------
  $ export BUILDROOT_DL_DIR <shared download location>
-- 
1.7.9.5
