From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Nov 2009 23:25:17 +0100
Subject: [Buildroot] [git commit master] uclibc: add unifdef getline fix to
	avr32 variant as well
Message-ID: <20091109235138.8DAA37774D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b18b46ebee24a06cc93d533feca6d0103050de74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch

diff --git a/toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch b/toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch
new file mode 100644
index 0000000..eb88884
--- /dev/null
+++ b/toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch
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
