From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:01:05 +0200
Subject: [Buildroot] [git commit] system/Config.in: re-wrap help text
Message-ID: <20180401060117.C0F438039E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3de010481fdb0aa9719d4ae64e413ea7c59c400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 system/Config.in | 122 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 64 insertions(+), 58 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 7b36516cc7..d14a864ca5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -92,9 +92,9 @@ config BR2_TARGET_GENERIC_PASSWD_SHA512
 	help
 	  Use SHA512 to encode passwords.
 
-	  Extremely strong, but not ubiquitous, although available in glibc
-	  for some time now. Choose only if you are sure your C library
-	  understands SHA512 passwords.
+	  Extremely strong, but not ubiquitous, although available in
+	  glibc for some time now. Choose only if you are sure your C
+	  library understands SHA512 passwords.
 
 endchoice # Passwd encoding
 
@@ -219,9 +219,9 @@ config BR2_ROOTFS_MERGED_USR
 	  is the historical UNIX way. In this case, /usr can be a
 	  filesystem on a partition separate from / .
 
-	  If you say 'y' here, then /bin, /sbin and /lib will be symlinks
-	  to their counterparts in /usr. In this case, /usr can not be a
-	  separate filesystem.
+	  If you say 'y' here, then /bin, /sbin and /lib will be
+	  symlinks to their counterparts in /usr. In this case, /usr can
+	  not be a separate filesystem.
 
 config BR2_TARGET_ENABLE_ROOT_LOGIN
 	bool "Enable root login with password"
@@ -230,10 +230,10 @@ config BR2_TARGET_ENABLE_ROOT_LOGIN
 	help
 	  Allow root to log in with a password.
 
-	  If not enabled, root will not be able to log in with a password.
-	  However, if you have an ssh server and you add an ssh key, you
-	  can still allow root to log in. Alternatively, you can use sudo
-	  to become root.
+	  If not enabled, root will not be able to log in with a
+	  password. However, if you have an ssh server and you add an
+	  ssh key, you can still allow root to log in. Alternatively,
+	  you can use sudo to become root.
 
 config BR2_TARGET_GENERIC_ROOT_PASSWD
 	string "Root password"
@@ -242,25 +242,28 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	help
 	  Set the initial root password.
 
-	  If set to empty (the default), then no root password will be set,
-	  and root will need no password to log in.
+	  If set to empty (the default), then no root password will be
+	  set, and root will need no password to log in.
 
-	  If the password starts with any of $1$, $5$ or $6$, it is considered
-	  to be already crypt-encoded with respectively md5, sha256 or sha512.
-	  Any other value is taken to be a clear-text value, and is crypt-encoded
-	  as per the "Passwords encoding" scheme, above.
+	  If the password starts with any of $1$, $5$ or $6$, it is
+	  considered to be already crypt-encoded with respectively md5,
+	  sha256 or sha512.  Any other value is taken to be a clear-text
+	  value, and is crypt-encoded as per the "Passwords encoding"
+	  scheme, above.
 
-	  Note: "$" signs in the hashed password must be doubled. For example,
-	  if the hashed password is "$1$longsalt$v35DIIeMo4yUfI23yditq0",
-	  then you must enter it as "$$1$$longsalt$$v35DIIeMo4yUfI23yditq0"
-	  (this is necessary otherwise make would attempt to interpret the $
-	  as a variable expansion).
+	  Note: "$" signs in the hashed password must be doubled. For
+	  example, if the hashed password is
+	  "$1$longsalt$v35DIIeMo4yUfI23yditq0", then you must enter it
+	  as "$$1$$longsalt$$v35DIIeMo4yUfI23yditq0" (this is necessary
+	  otherwise make would attempt to interpret the $ as a variable
+	  expansion).
 
 	  WARNING! WARNING!
 	  The password appears as-is in the .config file, and may appear
-	  in the build log! Avoid using a valuable password if either the
-	  .config file or the build log may be distributed, or at the
-	  very least use a strong cryptographic hash for your password!
+	  in the build log! Avoid using a valuable password if either
+	  the .config file or the build log may be distributed, or at
+	  the very least use a strong cryptographic hash for your
+	  password!
 
 choice
 	bool "/bin/sh"
@@ -375,10 +378,10 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	default y
 	help
 	  The root filesystem is typically mounted read-only at boot.
-	  By default, buildroot remounts it in read-write mode early during the
-	  boot process.
-	  Say no here if you would rather like your root filesystem to remain
-	  read-only.
+	  By default, buildroot remounts it in read-write mode early
+	  during the boot process.
+	  Say no here if you would rather like your root filesystem to
+	  remain read-only.
 	  If unsure, say Y.
 
 config BR2_SYSTEM_DHCP
@@ -391,8 +394,9 @@ config BR2_SYSTEM_DHCP
 
 	  If left empty, no automatic DHCP requests will take place.
 
-	  For more complicated network setups use an overlay to overwrite
-	  /etc/network/interfaces or add a networkd configuration file.
+	  For more complicated network setups use an overlay to
+	  overwrite /etc/network/interfaces or add a networkd
+	  configuration file.
 
 comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd"
 	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD)
@@ -468,18 +472,19 @@ config BR2_TARGET_TZ_ZONELIST
 	help
 	  Space-separated list of time zones to compile.
 
-	  The value "default" includes all commonly used time zones. Note
-	  that this set consumes around 5.5M for glibc and 2.1M for uClibc.
+	  The value "default" includes all commonly used time zones.
+	  Note that this set consumes around 5.5M for glibc and 2.1M for
+	  uClibc.
 
-	  The full list is the list of files in the time zone database source,
-	  not including the build and .tab files.
+	  The full list is the list of files in the time zone database
+	  source, not including the build and .tab files.
 
 config BR2_TARGET_LOCALTIME
 	string "default local time"
 	default "Etc/UTC"
 	help
-	  The time zone to install as the default local time, expressed as a
-	  tzdata location, such as:
+	  The time zone to install as the default local time, expressed
+	  as a tzdata location, such as:
 	    Etc/UTC             (the default)
 	    GMT
 	    Europe/Paris
@@ -506,24 +511,24 @@ config BR2_ROOTFS_OVERLAY
 	  root filesystem after the build has finished and before it is
 	  packed into the selected filesystem images.
 
-	  They are copied as-is into the rootfs, excluding files ending with
-	  ~ and .git, .svn and .hg directories.
+	  They are copied as-is into the rootfs, excluding files ending
+	  with ~ and .git, .svn and .hg directories.
 
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom scripts to run before creating filesystem images"
 	default ""
 	help
-	  Specify a space-separated list of scripts to be run after the build
-	  has finished and before Buildroot starts packing the files into
-	  selected filesystem images.
+	  Specify a space-separated list of scripts to be run after the
+	  build has finished and before Buildroot starts packing the
+	  files into selected filesystem images.
 
-	  This gives users the opportunity to do board-specific cleanups,
-	  add-ons and the like, so the generated files can be used directly
-	  without further processing.
+	  This gives users the opportunity to do board-specific
+	  cleanups, add-ons and the like, so the generated files can be
+	  used directly without further processing.
 
-	  These scripts are called with the target directory name as first
-	  argument. Make sure the exit code of those scripts are 0, otherwise
-	  make will stop after calling them.
+	  These scripts are called with the target directory name as
+	  first argument. Make sure the exit code of those scripts are
+	  0, otherwise make will stop after calling them.
 
 config BR2_ROOTFS_POST_FAKEROOT_SCRIPT
 	string "Custom scripts to run inside the fakeroot environment"
@@ -548,8 +553,9 @@ config BR2_ROOTFS_POST_FAKEROOT_SCRIPT
 	        to create arbitrary entries statically in /dev
 
 	    - BR2_ROOTFS_DEVICE_TABLE
-	        to set arbitrary permissions as well as extended attributes
-	        (such as capabilities) on files and directories,
+	        to set arbitrary permissions as well as extended
+	        attributes (such as capabilities) on files and
+	        directories,
 
 	    - BR2_ROOTFS_USERS_TABLES:
 	        to create arbitrary users and their home directories
@@ -581,16 +587,16 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
 		|| BR2_ROOTFS_POST_FAKEROOT_SCRIPT != "" \
 		|| BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
 	help
-	  Pass these additional arguments to each post-build or post-image
-	  scripts.
+	  Pass these additional arguments to each post-build or
+	  post-image scripts.
 
-	  Note that all the post-build and post-image scripts will be passed
-	  the same set of arguments, you can not pass different arguments to
-	  each script.
+	  Note that all the post-build and post-image scripts will be
+	  passed the same set of arguments, you can not pass different
+	  arguments to each script.
 
-	  Note also, as stated in their respective help text, that the first
-	  argument to each post-build or post-image script is the target
-	  directory / images directory. The arguments in this option will be
-	  passed *after* those.
+	  Note also, as stated in their respective help text, that the
+	  first argument to each post-build or post-image script is the
+	  target directory / images directory. The arguments in this
+	  option will be passed *after* those.
 
 endmenu
