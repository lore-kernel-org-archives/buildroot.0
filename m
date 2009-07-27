From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 09:43:06 +0200
Subject: [Buildroot] [git commit] toolchain/uClibc: add patch to rename
	getline to get_line in unifdef.c
Message-ID: <20090727074332.CA00C777BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a248954890ad84e63943a7533e22bbd5ba515e5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

getline() is a standard libc function with a different signature.

Signed-off-by: Pavel Roskin <proski@gnu.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc/uClibc-0.9.30-unifdef-getline.patch     |   29 ++++++++++++++++++++
 .../uClibc/uClibc-0.9.30.1-unifdef-getline.patch   |   29 ++++++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-unifdef-getline.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30.1-unifdef-getline.patch

diff --git a/toolchain/uClibc/uClibc-0.9.30-unifdef-getline.patch b/toolchain/uClibc/uClibc-0.9.30-unifdef-getline.patch
new file mode 100644
index 0000000..eb88884
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-unifdef-getline.patch
@@ -0,0 +1,29 @@
+--- uClibc-0.9.30.1.orig/extra/scripts/unifdef.c
++++ uClibc-0.9.30.1/extra/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         get_line(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = get_line();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++get_line(void)
+ {
+ 	const char *cp;
+ 	int cursym;
diff --git a/toolchain/uClibc/uClibc-0.9.30.1-unifdef-getline.patch b/toolchain/uClibc/uClibc-0.9.30.1-unifdef-getline.patch
new file mode 100644
index 0000000..eb88884
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30.1-unifdef-getline.patch
@@ -0,0 +1,29 @@
+--- uClibc-0.9.30.1.orig/extra/scripts/unifdef.c
++++ uClibc-0.9.30.1/extra/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         get_line(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = get_line();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++get_line(void)
+ {
+ 	const char *cp;
+ 	int cursym;
-- 
1.6.3.3
