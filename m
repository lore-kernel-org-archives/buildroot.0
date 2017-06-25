From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Jun 2017 00:03:41 +0200
Subject: [Buildroot] [PATCH 5/5] docs/manual: document hashes for license
	files
In-Reply-To: <cover.1498428166.git.yann.morin.1998@free.fr>
References: <cover.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <48ad498d1bf7e08c8120090942e711a1d2320c32.1498428166.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Changes v1 -> v2:
  - don't mention that a weak hash is OK  (Luca)
---
 docs/manual/adding-packages-directory.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 08f5d42f91..b75b91a28c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -443,7 +443,7 @@ Optionally, you can add a third file, named +libfoo.hash+, that contains
 the hashes of the downloaded files for the +libfoo+ package.
 
 The hashes stored in that file are used to validate the integrity of the
-downloaded files.
+downloaded files and of the license files.
 
 The format of this file is one line for each file for which to check the
 hash, each line being space-separated, with these three fields:
@@ -458,7 +458,10 @@ hash, each line being space-separated, with these three fields:
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
@@ -476,6 +479,10 @@ strong hash yourself (preferably +sha256+, but not +md5+), and mention
 this in a comment line above the hashes.
 
 .Note
+The hashes for license files are used to detect a license change when a
+package version is bumped.
+
+.Note
 The number of spaces does not matter, so one can use spaces (or tabs) to
 properly align the different fields.
 
@@ -501,6 +508,10 @@ sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-f
 
 # No hash for 1234:
 none   xxx                                                              libfoo-1234.tar.gz
+
+# Hash for license files:
+sha1  c47a888f2be626e1197b6f651dee966ef882077d  COPYING
+sha1  e101765734390d664b59325b2d644d80d9a6bd9a  doc/COPYING.LGPL
 ----
 
 If the +.hash+ file is present, and it contains one or more hashes for a
-- 
2.11.0
