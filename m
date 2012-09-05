From: Soroush Rabiei <soroush.rabiei@gmail.com>
Date: Wed, 5 Sep 2012 13:32:57 +0430
Subject: [Buildroot] Compilation failure on host-pkg-config 0.25
Message-ID: <CAOMsk2RPh8kDBfbTtOVBz4vBUO_RHrJaG=7+kRL2kr0b24mubg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

This is my first mail in this list. I'm trying to configure and make an OS
for an embedded board. Using buildroot 2012.08 I'm getting this error:

>>> host-pkg-config 0.25 Autoreconfiguring
> main::scan_file() called too early to check prototype at
> /home/soroush/workspace/kernel/buildroot-2012.08/output/host/usr/bin/aclocal
> line 643.
> aclocal: couldn't open directory
> '/home/soroush/workspace/kernel/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/share/aclocal':
> No such file or directory
>

I removed corrosponding directory from /output/build and make again. Same
error appears:

>>> host-pkg-config 0.25 Extracting
> gzip -d -c /home/soroush/src/pkg-config-0.25.tar.gz | tar
> --strip-components=1 -C
> /home/soroush/workspace/kernel/buildroot-2012.08/output/build/host-pkg-config-0.25
> -xf -
> >>> host-pkg-config 0.25 Patching package//pkg-config
>
> Applying pkg-config-0.25-add-with-sysroot.patch using patch:
> patching file Makefile.am
> patching file configure.in
> patching file main.c
>
> Applying pkg-config-0.25-fix-variable.patch using patch:
> patching file main.c
> >>> host-pkg-config 0.25  Updating config.sub and config.guess
> for file in config.guess config.sub; do for i in $(find
> /home/soroush/workspace/kernel/buildroot-2012.08/output/build/host-pkg-config-0.25
> -name $file); do cp support/gnuconfig/$file $i; done; done
> >>> host-pkg-config 0.25 Patching libtool
> >>> host-pkg-config 0.25 Autoreconfiguring
> main::scan_file() called too early to check prototype at
> /home/soroush/workspace/kernel/buildroot-2012.08/output/host/usr/bin/aclocal
> line 643.
> aclocal: couldn't open directory
> '/home/soroush/workspace/kernel/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/share/aclocal':
> No such file or directory
> autoreconf:
> /home/soroush/workspace/kernel/buildroot-2012.08/output/host/usr/bin/aclocal
> failed with exit status: 1
> make: ***
> [/home/soroush/workspace/kernel/buildroot-2012.08/output/build/host-pkg-config-0.25/.stamp_configured]
> Error 1
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120905/84fc2cdb/attachment.html>
