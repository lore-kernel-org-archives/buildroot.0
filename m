From: Nam Hoang <rosemanit@gmail.com>
Date: Sat, 2 Jun 2007 08:45:05 +0700
Subject: [Buildroot] Problem in compiling package Metacity
Message-ID: <b872c6870706011845j26b44cc5ua676bf13e48a8cfc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I compile package Metacity using buildroot (after compiling libgtk2),
it shows error message:

...
> make[4]: Entering directory
> `/home/roseman/mini-linux/buildroot/build_i386/metacity-2.16.3/src'
> Making all in wm-tester
> make[5]: Entering directory
> `/home/roseman/mini-linux/buildroot/build_i386/metacity-2.16.3
> /src/wm-tester'
> /home/roseman/mini-linux/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-gcc
> -DHAVE_CONFIG_H -I. -I. -I../..     -Os -pipe  -Wall -Wchar-subscripts
> -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wpointer-arith
> -Wcast-align -Wsign-compare -c main.c
> main.c:22:21: error: gtk/gtk.h: No such file or directory
> main.c: In function 'usage':
> main.c:36: warning: implicit declaration of function 'g_print'
> main.c:36: warning: nested extern declaration of 'g_print'
> main.c: In function 'main':
> ...
>

I checked, and see that gtk include-file exists in both host and target
system. It's in :
        /usr/include/gtk-2.0
        buildroot/build_i386/staging_dir/include/gtk-2.0
        buildroot/build_i386/staging_dir/usr/include/gtk-2.0
I don't understand why compiler can't see the gtk library. What wrong I did
?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070602/a879bdd4/attachment.htm 
