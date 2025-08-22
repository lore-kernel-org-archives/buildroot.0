Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9718CA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 20:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC39882292;
	Fri, 22 Aug 2025 20:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6VDc0k7B1xb; Fri, 22 Aug 2025 20:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C3383592
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C3383592;
	Fri, 22 Aug 2025 20:51:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32227D8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 186CF60DE0
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cvAOtdt7sAS for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 20:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A178360DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A178360DD8
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A178360DD8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:51:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8FFFBC8EC66
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:51:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 59F90604AD;
 Fri, 22 Aug 2025 20:51:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8780E1C22A3C7; 
 Fri, 22 Aug 2025 22:51:29 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Date: Fri, 22 Aug 2025 22:51:27 +0200
Message-ID: <20250822205128.4032631-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755895894; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=4om0JMeJX23MkeGpJcVGQjvm6rRDxNHYCJhh1TvNsZE=;
 b=JuR7s8I/Pl8SPnPNRo6D3r0MEePQ927h+ZkH5kClFESSjt8f1JJwuhQ3Sg/L8YQHu+cuN7
 3QiIyn4M32ud1cnqtIixITXJV5P+BbW+knVLwKR8s4hoYvMsq3xe3+Gwcg2JTw/dcjjVPU
 jiAmaSN8uwxUCyJJ+UZnqJppoYhcrjpupNd7UgYgHQMErfQVELpMtYL68+PogydLkp+P0E
 8jcXoICDHVvqsGeUbwe0ROwIlEO0Sjf80ZJG81UOnYGWKURMfvEjv1+O56gn7tn0s5jDhD
 TYhQj1QKAwR+BmOnMRjEW4ZhXKGcv9SJWjp4Sd46rMieECyEKB5i+AFGpd/swQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JuR7s8I/
Subject: [Buildroot] [PATCH] package/gpm: fix build with GCC 15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Import upstream-submitted patches that fix the build with GCC 15.x.

Fixes:

  https://autobuild.buildroot.net/results/a6b25e6795682a18dff3c88519833663da2134d9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ncurses-functions.-This-fails-with-G.patch | 236 ++++++++++++++++++
 ...inition-in-yacc-source-file-until-va.patch |  83 ++++++
 ...ype-definition-for-WINDOW-in-Gpm_Wge.patch |  39 +++
 3 files changed, 358 insertions(+)
 create mode 100644 package/gpm/0008-Avoid-shadowing-ncurses-functions.-This-fails-with-G.patch
 create mode 100644 package/gpm/0009-Fix-function-definition-in-yacc-source-file-until-va.patch
 create mode 100644 package/gpm/0010-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch

diff --git a/package/gpm/0008-Avoid-shadowing-ncurses-functions.-This-fails-with-G.patch b/package/gpm/0008-Avoid-shadowing-ncurses-functions.-This-fails-with-G.patch
new file mode 100644
index 0000000000..d7b984d0da
--- /dev/null
+++ b/package/gpm/0008-Avoid-shadowing-ncurses-functions.-This-fails-with-G.patch
@@ -0,0 +1,236 @@
+From 436f3f0a75a42dc9e07f2fe85b73eeb4c95e0515 Mon Sep 17 00:00:00 2001
+From: NHOrus <jy6x2b32pie9@yahoo.com>
+Date: Tue, 11 Feb 2025 18:42:47 +0400
+Subject: [PATCH] Avoid shadowing ncurses functions. This fails with GCC-15 and
+ other compilers implementing C23 Added prefix gpm_ to raw() and noraw() used
+ in two files because they are implemented in same two files, and are static.
+ Same with scr_dump() and src_restore() in yacc source file
+
+Upstream: https://github.com/telmich/gpm/pull/49
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/prog/gpm-root.y   | 10 +++++-----
+ src/prog/hltest.c     | 11 +++++------
+ src/prog/mouse-test.c | 24 ++++++++++++------------
+ 3 files changed, 22 insertions(+), 23 deletions(-)
+
+diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
+index d3d064c..7001d6e 100644
+--- a/src/prog/gpm-root.y
++++ b/src/prog/gpm-root.y
+@@ -939,7 +939,7 @@ static unsigned short clear_sel_args[6]={0, 0,0, 0,0, 4};
+ static unsigned char *clear_sel_arg= (unsigned char *)clear_sel_args+1;
+ 
+ /*------------*/
+-static inline void scr_dump(int fd, FILE *f, unsigned char *buffer, int vc)
++static inline void gpm_scr_dump(int fd, FILE *f, unsigned char *buffer, int vc)
+ {
+    int dumpfd;
+    char dumpname[20];
+@@ -958,7 +958,7 @@ static inline void scr_dump(int fd, FILE *f, unsigned char *buffer, int vc)
+ }
+ 
+ /*------------*/
+-static inline void scr_restore(int fd, FILE *f, unsigned char *buffer, int vc)
++static inline void gpm_scr_restore(int fd, FILE *f, unsigned char *buffer, int vc)
+ {
+    int x,y, dumpfd;
+    char dumpname[20];
+@@ -1002,7 +1002,7 @@ Posted *postmenu(int fd, FILE *f, Draw *draw, int x, int y, int console)
+    if (!new) return NULL;
+    new->draw=draw;
+    new->dump=dump=malloc(opt_buf);
+-   scr_dump(fd,f,dump,console);
++   gpm_scr_dump(fd,f,dump,console);
+    lines=dump[0]; columns=dump[1];
+    i=(columns*dump[3]+dump[2])*2+1; /* where to get it */
+    if (i<0) i=1;
+@@ -1060,7 +1060,7 @@ Posted *postmenu(int fd, FILE *f, Draw *draw, int x, int y, int console)
+    for (i=0; i<draw->width; i++) PUTC(HORLINE,draw->bord,draw->back);
+    PUTC(LRCORNER,draw->bord,draw->back);
+ 
+-   scr_restore(fd,f,dump,console);
++   gpm_scr_restore(fd,f,dump,console);
+    free(dump);
+ 
+ #undef PUTC
+@@ -1077,7 +1077,7 @@ Posted *unpostmenu(int fd, FILE *f, Posted *which, int vc)
+ {
+    Posted *prev=which->prev;
+ 
+-   scr_restore(fd,f,which->dump, vc);
++   gpm_scr_restore(fd,f,which->dump, vc);
+    ioctl(fd,TCXONC,TCOON); /* activate the console */  
+    free(which->dump);
+    free(which);
+diff --git a/src/prog/hltest.c b/src/prog/hltest.c
+index cce0abc..a916873 100644
+--- a/src/prog/hltest.c
++++ b/src/prog/hltest.c
+@@ -80,7 +80,6 @@ int wid,hei,vcsize;
+ unsigned short clear_sel_args[6]={0, 0,0, 0,0, 4};
+ unsigned char *clear_sel_arg= (unsigned char *)clear_sel_args+1;
+ 
+-
+ static inline int scrdump(char *buf)
+ {
+    clear_sel_arg[0]=2;  /* clear_selection */
+@@ -99,7 +98,7 @@ static inline int scrrestore(char *buf)
+ 
+ 
+ /* I don't like curses, so I'm doing low level stuff here */
+-static void raw(void)
++static void gpm_raw(void)
+ {
+ struct termios it;
+ 
+@@ -115,7 +114,7 @@ tcsetattr(fileno(stdin),TCSANOW,&it);
+ 
+ }
+ 
+-static void noraw(void)
++static void gpm_noraw(void)
+ {
+ struct termios it;
+ 
+@@ -136,7 +135,7 @@ void killed(int signo)
+ {
+    CLEAR;
+    fprintf(stderr,"hltest: killed by signal %i\r\n",signo);
+-   noraw();
++   gpm_noraw();
+    exit(0);
+ }
+ 
+@@ -525,7 +524,7 @@ int main(int argc, char **argv)
+    gpm_roi_handler=xhandler;
+    gpm_roi_data=NULL;
+ 
+-   raw();
++   gpm_raw();
+    newmsg(0,NULL); /* init data structures */
+    while((c=Gpm_Getchar())!=EOF) {
+       char s[32];
+@@ -538,6 +537,6 @@ int main(int argc, char **argv)
+    newmsg(roi ? ((WinInfo *)roi->clientdata)->number : 0,s);
+    }
+ 
+-   noraw();
++   gpm_noraw();
+    exit(0);
+ }
+diff --git a/src/prog/mouse-test.c b/src/prog/mouse-test.c
+index 0bb1982..7235bba 100644
+--- a/src/prog/mouse-test.c
++++ b/src/prog/mouse-test.c
+@@ -106,7 +106,7 @@ return 0;
+ /*----------------------------------------------------------------------------- 
+    Place the description here.
+  -----------------------------------------------------------------------------*/
+-static void raw(void)
++static void gpm_raw(void)
+ {
+    struct termios it;
+ 
+@@ -125,7 +125,7 @@ static void raw(void)
+ /*----------------------------------------------------------------------------- 
+    Place the description here.
+  -----------------------------------------------------------------------------*/
+-static void noraw(void)
++static void gpm_noraw(void)
+ {
+    struct termios it;
+ 
+@@ -144,7 +144,7 @@ static void noraw(void)
+ void killed(int signo)
+ {
+    fprintf(stderr,"mouse-test: killed by signal %i\r\n",signo);
+-   noraw();
++   gpm_noraw();
+    exit(0);
+ }
+ 
+@@ -196,7 +196,7 @@ int mousereopen(int oldfd, char *name, Gpm_Type *type)
+ 
+ int noneofthem(void)
+ {
+-   noraw();
++   gpm_noraw();
+    printf("\n\nSomething went wrong, I didn't manage to detect your"
+ 	 "protocol\n\nFeel free to report your problems to the author\n");
+    exit(1);
+@@ -336,7 +336,7 @@ int main(int argc, char **argv)
+    I_serial=mice->init; /* the first one has I_serial */
+ 
+    signal(SIGINT,killed);   /* control-C kills us */
+-   raw();
++   gpm_raw();
+ 
+ /*====================================== First of all, detect the device */
+ 
+@@ -568,7 +568,7 @@ int main(int argc, char **argv)
+    /* why checking and not using return value ??? */
+    CHECKFAIL(typecount);
+    if (typecount==1) {
+-      noraw();
++      gpm_noraw();
+       printf("\n\n\nWell, it seems like your mouse is already detected:\n"
+       "it is on the device \"%s\", and speaks the protocol \"%s\"\n",
+       mousename,list->this->name);
+@@ -587,7 +587,7 @@ int main(int argc, char **argv)
+    } while(i!='y' && i!='n');
+ 
+    if (i=='n') {
+-      noraw();
++      gpm_noraw();
+       printf("\nThen, you should use the \"bare\" protocol on \"%s\"\n",
+ 	   mousename);
+       exit(0);
+@@ -634,7 +634,7 @@ int main(int argc, char **argv)
+    for (pending=0,i=0;i<got-16;i++)
+       if(!memcmp(buf+i,buf+i+8,8)) pending++;
+    if (pending > 3) {
+-      noraw();
++      gpm_noraw();
+       printf("\nYour mouse seems to be a 'mman' one  on \"%s\" (%i matches)\n",
+ 	   mousename,pending);
+       exit(0);
+@@ -660,7 +660,7 @@ int main(int argc, char **argv)
+          continue;
+       }
+ 	   if (pending>3) {
+-	      noraw();
++	      gpm_noraw();
+ 	      printf("\nYour mouse seems to be a '%s' one on \"%s\" (%i matches)\n",
+ 		   cur->this->name,mousename,pending);
+ 	      exit(0);
+@@ -695,7 +695,7 @@ int main(int argc, char **argv)
+          for (pending=0,i=0;i<got-20;i++)
+             if(!memcmp(buf+i,buf+i+10,10)) pending++;
+          if (pending>3) {
+-            noraw();
++            gpm_noraw();
+             printf("\nYour mouse becomes a 3-buttons ('-t msc') one when\n"
+ 	         "gpm gets '-o %s' on it command line, and X gets\n"
+ 	         "%s in XF86Config\nThe device is \"%s\"",
+@@ -726,7 +726,7 @@ int main(int argc, char **argv)
+    for (pending=0,i=0;i<got-20;i++)
+       if(!memcmp(buf+i,buf+i+10,10)) pending++;
+    if (pending>3) {
+-      noraw();
++      gpm_noraw();
+       printf("\nWorked. You should keep the button pressed every time the\n"
+ 	   "computer boots, and run gpm in '-R' mode in order to ignore\n"
+ 	   "such hassle when starting X\n\nStill better, but a better mouse\n"
+@@ -734,7 +734,7 @@ int main(int argc, char **argv)
+ 
+       exit(0);
+    }
+-   noraw();
++   gpm_noraw();
+    printf("\nI'm lost. Can't tell you how to use your middle button\n");
+    return 0;
+ }
+-- 
+2.50.1
+
diff --git a/package/gpm/0009-Fix-function-definition-in-yacc-source-file-until-va.patch b/package/gpm/0009-Fix-function-definition-in-yacc-source-file-until-va.patch
new file mode 100644
index 0000000000..b12f409c39
--- /dev/null
+++ b/package/gpm/0009-Fix-function-definition-in-yacc-source-file-until-va.patch
@@ -0,0 +1,83 @@
+From 4e3d358da1c6066d7a320ffc157ca9e35ed34e49 Mon Sep 17 00:00:00 2001
+From: NHOrus <jy6x2b32pie9@yahoo.com>
+Date: Tue, 11 Feb 2025 19:01:48 +0400
+Subject: [PATCH] Fix function definition in yacc source file until valid C23.
+ Fill empty argument lists with values. Add 0 as third argument for
+ two-argument function, it will be ignored at call site.
+
+Upstream: https://github.com/telmich/gpm/pull/49
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/prog/gpm-root.y | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
+index 7001d6e..56072ac 100644
+--- a/src/prog/gpm-root.y
++++ b/src/prog/gpm-root.y
+@@ -128,7 +128,7 @@ typedef struct DrawItem {
+    char *name;
+    char *arg;   /* a cmd string */
+    void *clientdata;  /* a (Draw *) for menus or whatever   */
+-   int (*fun)();
++   int (*fun)(int, struct DrawItem *, int);
+    struct DrawItem *next;
+ } DrawItem;
+ 
+@@ -159,7 +159,7 @@ int yyerror(char *s);
+ int yylex(void);
+ 
+ DrawItem *cfg_cat(DrawItem *, DrawItem *);
+-DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(), void *detail);
++DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(int,  DrawItem *, int), void *detail);
+ 
+ 
+ /*===================================================================*
+@@ -195,7 +195,7 @@ int f_pipe(int mode, DrawItem *self, int uid);
+       char *string;
+       Draw *draw;
+       DrawItem *item;
+-      int (*fun)();
++      int (*fun)(int,  DrawItem *, int);
+       }
+ 
+ %token <string> T_STRING
+@@ -284,7 +284,7 @@ struct tokenName tokenList[] = {
+ struct funcName {
+    char *name;
+    int token;
+-   int (*fun)();
++   int (*fun)(int,  DrawItem *, int);
+    };
+ struct funcName funcList[] = {
+    {"f.debug",T_FUNC,f_debug},
+@@ -390,7 +390,7 @@ Draw *cfg_alloc(void)
+ 
+ /*---------------------------------------------------------------------*/
+ /* malloc an empty DrawItem and fill it */
+-DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(), void *detail)
++DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(int,  DrawItem *, int), void *detail)
+ {
+    DrawItem *new=calloc(1,sizeof(DrawItem));
+ 
+@@ -405,7 +405,7 @@ DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(), void *detail)
+ 
+       case 'F': /* a function without args */
+          new->fun=fun;
+-         if (fun) fun(F_CREATE,new);
++         if (fun) fun(F_CREATE,new,0);
+          break;
+ 
+       case 'M':
+@@ -1047,7 +1047,7 @@ Posted *postmenu(int fd, FILE *f, Draw *draw, int x, int y, int console)
+    }
+    /* sides and items */
+    for (item=draw->menu; y++, item; item=item->next) {
+-         if (item->fun) (*(item->fun))(F_POST,item);
++         if (item->fun) (*(item->fun))(F_POST,item,0);
+          GOTO(x,y); PUTC(VERLINE,draw->bord,draw->back);
+          for (i=0;i<item->pad;i++) PUTC(' ',draw->fore,draw->back);
+          PUTS(item->name,draw->fore,draw->back); i+=strlen(item->name);
+-- 
+2.50.1
+
diff --git a/package/gpm/0010-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch b/package/gpm/0010-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch
new file mode 100644
index 0000000000..c22eac6f47
--- /dev/null
+++ b/package/gpm/0010-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch
@@ -0,0 +1,39 @@
+From d6d5168713b1513dc2a780d21bb33dcf16a7a518 Mon Sep 17 00:00:00 2001
+From: NHOrus <jy6x2b32pie9@yahoo.com>
+Date: Sat, 22 Feb 2025 01:12:32 +0400
+Subject: [PATCH] Add incomplete type definition for WINDOW in Gpm_Wgetch()
+
+Window handle is an opaque pointer that Gpm_Wgetch() passes
+through straight to ncurses if it's not null and calls getch
+if it's null. Code doesn't care what's inside the handle
+as long as it agrees with curses definition.
+
+Upstream: https://github.com/telmich/gpm/pull/49
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/headers/gpm.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/headers/gpm.h b/src/headers/gpm.h
+index 57dc618..6c53fbf 100644
+--- a/src/headers/gpm.h
++++ b/src/headers/gpm.h
+@@ -268,7 +268,14 @@ Gpm_Roi * Gpm_LowerRoi(Gpm_Roi *which, Gpm_Roi *after);
+ /* libcurses.c */
+ /* #include <curses.h>  Hmm... seems risky */
+ 
+-extern int Gpm_Wgetch();
++/* Window handle is an opaque pointer that Gpm_Wgetch()
++ * passes through to ncurses if it's not null and calls getch
++ * if it's null. Code doesn't care what's inside the handle
++ * as long as it agrees with curses definition.
++*/
++typedef struct _win_st WINDOW;
++
++extern int Gpm_Wgetch(WINDOW *);
+ #define Gpm_Getch() (Gpm_Wgetch(NULL))
+ 
+ /* libxtra.c */
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
