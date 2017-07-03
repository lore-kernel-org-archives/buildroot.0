From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 18:03:51 +0200
Subject: [Buildroot] [git commit] docs/manual: document hashes for license
	files
Message-ID: <20170703161020.B494A7F8BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bd21d3e95f5de08858c957731c1715f11a6080d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use sha256 in example]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 00b2033..804946c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -445,7 +445,7 @@ package. The only reason for not adding a +.hash+ file is when hash
 checking is not possible due to how the package is downloaded.
 
 The hashes stored in that file are used to validate the integrity of the
-downloaded files.
+downloaded files and of the license files.
 
 The format of this file is one line for each file for which to check the
 hash, each line being space-separated, with these three fields:
@@ -460,7 +460,10 @@ hash, each line being space-separated, with these three fields:
 ** for +sha256+, 64 hexadecimal characters
 ** for +sha384+, 96 hexadecimal characters
 ** for +sha512+, 128 hexadecimal characters
-* the name of the file, without any directory component
+* the name of the file:
+** for a source archive: the basename of the file, without any directory
+   component,
+** for a license file: the path as it appears in +FOO_LICENSE_FILES+.
 
 Lines starting with a +#+ sign are considered comments, and ignored. Empty
 lines are ignored.
@@ -478,6 +481,10 @@ strong hash yourself (preferably +sha256+, but not +md5+), and mention
 this in a comment line above the hashes.
 
 .Note
+The hashes for license files are used to detect a license change when a
+package version is bumped.
+
+.Note
 The number of spaces does not matter, so one can use spaces (or tabs) to
 properly align the different fields.
 
@@ -503,6 +510,10 @@ sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-f
 
 # No hash for 1234:
 none   xxx                                                              libfoo-1234.tar.gz
+
+# Hash for license files:
+sha256 a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  COPYING
+sha256 01b1f9f2c8ee648a7a596a1abe8aa4ed7899b1c9e5551bda06da6e422b04aa55  doc/COPYING.LGPL
 ----
 
 If the +.hash+ file is present, and it contains one or more hashes for a
