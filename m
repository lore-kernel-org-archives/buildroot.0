From: Ormund Williams <ormundw@panix.com>
Date: Sat, 03 Mar 2007 20:53:13 -0500
Subject: [Buildroot] building glib2 fails
Message-ID: <1172973194.17423.23.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All

I've been sucessfully building a file system using BuildRoot, but when I
added glib2 . . .

====================>
...
...
...
Making install in gobject
make[3]: Entering directory
`/home/ormund/abti/extentrac/software/gui/os/buildroot/build_i686/glib-2.12.9/gobject'
make glib-genmarshal
make[4]: Entering directory
`/home/ormund/abti/extentrac/software/gui/os/buildroot/build_i686/glib-2.12.9/gobject'
make[4]: `glib-genmarshal' is up to date.
make[4]: Leaving directory
`/home/ormund/abti/extentrac/software/gui/os/buildroot/build_i686/glib-2.12.9/gobject'
echo "#ifndef __G_MARSHAL_H__" > xgen-gmh \
        && echo "#define __G_MARSHAL_H__" >> xgen-gmh \
        && /usr/bin/glib-genmarshal --nostdinc
--prefix=g_cclosure_marshal ./gmarshal.list --header >> xgen-gmh \
        && echo "#endif /* __G_MARSHAL_H__ */" >> xgen-gmh \
        && (cmp -s xgen-gmh gmarshal.h 2>/dev/null || cp xgen-gmh
gmarshal.h) \
        && rm -f xgen-gmh xgen-gmh~ \
        && echo timestamp > stamp-gmarshal.h
/bin/sh: line 2: /usr/bin/glib-genmarshal: No such file or directory
make[3]: *** [stamp-gmarshal.h] Error 127
make[3]: Leaving directory
`/home/ormund/abti/extentrac/software/gui/os/buildroot/build_i686/glib-2.12.9/gobject'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory
`/home/ormund/abti/extentrac/software/gui/os/buildroot/build_i686/glib-2.12.9'
make[1]: *** [install] Error 2
make[1]: Leaving directory
`/home/ormund/abti/extentrac/software/gui/os/buildroot/build_i686/glib-2.12.9'
make: ***
[/home/ormund/abti/extentrac/software/gui/os/buildroot/build_i686/staging_dir/lib/libglib-2.0.a] Error 2

<====================

This is today's buildroot snapshot (buildroot-20070303).

Any idea why it does'nt install?

__
Ormund
