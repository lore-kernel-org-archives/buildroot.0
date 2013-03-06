From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Wed, 6 Mar 2013 12:43:20 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - emacs
Message-ID: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

I'm not sure if this is the right place for my problem ...

I'm a Newbie at buildroot and when I start my first trial to build a system with buildroot-2013.02 I run into troubles.

A few problems I was moving around and so  "make source" worked!

When I use "make" the script works for a short time, then an editor window is opened - I don't know  what to do.  :-(

The process of the editor shown by "ps" is:
emacs -batch -q -l script -f batch-byte-compile autoconf-mode.el autotest-mode.el

The status line of the editor shows (typed manual, couldn't copy):

Jove (Text)  [Main:1]  "[No file]" - <my_workspace>/buildroot-2013.02/

output/build/host-autoconf-2.68/lib/emacs/elc.2394

[Point pushed]


When I close the Editor by CTRL X / CTRL C I get an error.

And this is the output of the last actions on terminal window:

make[4]: Leaving directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-autoconf-2.68/lib/autoscan'
Making all in emacs
make[4]: Entering directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-autoconf-2.68/lib/emacs'
WARNING: Warnings can be ignored. :-)
if test "emacs" != no; then \
          set x; \
          list='autoconf-mode.el autotest-mode.el'; for p in $list; do \
            if test -f "$p"; then d=; else d="./"; fi; \
            set x "$@" "$d$p"; shift; \
          done; \
          shift; \
          EMACS="emacs" /bin/sh ../../build-aux/elisp-comp "$@" || exit 1; \
        else : ; fi
mv: cannot stat `*.elc': No such file or directory
make[4]: *** [elc-stamp] Error 1
make[4]: Leaving directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-autoconf-2.68/lib/emacs'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-autoconf-2.68/lib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-autoconf-2.68'
make[1]: *** [all] Error 2
make[1]: Leaving directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-autoconf-2.68'
make: *** [/MY_WORKSPACE/buildroot-2013.02/output/build/host-autoconf-2.68/.stamp_built] Error 2
$

Please is anybody out there who has an idea what to do in this case?

Thanks
Werner

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130306/7dd0e3a1/attachment-0001.html>
