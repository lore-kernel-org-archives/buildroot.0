From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 21:36:00 +0200
Subject: [Buildroot] [patch] here are some more cleanup patches
In-Reply-To: <0709192052250.18886@somehost>
References: <0709192052250.18886@somehost>
Message-ID: <20070919193600.GD817@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 09:06:54PM +0200, Cristian Ionescu-Idbohrn wrote:
>but libvorbis fails to build:
>
>  In file included from mdct.c:44:
>  ../include/vorbis/codec.h:26:21: error: ogg/ogg.h: No such file or
>  directory
>
>Can't seem to be able to build ltrace; something to do with configure not
>being able to locate gelf.h, but it's there:
>staging_dir/usr/include/libelf, as libelf build ok; I get a configure
>error:
>
>  checking gelf.h usability... no
>  checking gelf.h presence... no
>  checking for gelf.h... no
>  configure: error: ***** gelf.h not found *****
>
>config.log says in more than one place:
>
>  /usr/include/libelf/gelf.h:49:2: error: #error "GElf is not supported on
>    this sysystem."
>
>and bails out further down with:
>
>  configure:3629: checking for gelf.h
>  configure:3636: result: no
>  configure:3643: error: ***** gelf.h not found *****
>
>ac_cv_header_gelf_h=no may have something to do with it.
>
>Any ideas?

I've updated ltrace some months ago, but i admit that i have no idea
which box this big patches are on :-/
...
$ ls -ltrn buildroot.mine.OLD.OLD/package/ltrace/
total 804
-rw-r--r-- 1 1000 1000 627890 Apr  6 14:58 ltrace-svn-20070406.00.patch
-rw-r--r-- 1 1000 1000 173414 Apr  6 15:04 ltrace-svn-20070406.01.autoreconf.patch
-rw-r--r-- 1 1000 1000   2298 Apr  6 15:07 ltrace.mk
-rw-r--r-- 1 1000   40    241 Apr  6 15:25 Config.in

I.e. Not too good.

Perhaps try this updated version?

Index: package/ltrace/ltrace.mk
===================================================================
--- package/ltrace/ltrace.mk    (revision 19878)
+++ package/ltrace/ltrace.mk    (working copy)
@@ -3,9 +3,9 @@
 # ltrace
 #
 #############################################################
-LTRACE_VERSION=0.4
+LTRACE_VERSION=0.5
 LTRACE_SOURCE=ltrace_$(LTRACE_VERSION).orig.tar.gz
-#LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-1.diff.gz
+LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-3.diff.gz
 LTRACE_SITE=http://ftp.debian.org/debian/pool/main/l/ltrace
 LTRACE_DIR=$(BUILD_DIR)/ltrace-$(LTRACE_VERSION)
 LTRACE_BINARY=ltrace
