From: Stefan Maier <doenermuell@xmail.net>
Date: Thu, 10 May 2007 23:46:37 -0800
Subject: [Buildroot] Error compiling libgkt2, libglib2
Message-ID: <1178865997.4644114d65788@www.x-mail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I'm very new to buildroot, so you could possibly give me a hint...

Compiling libgtk2 for my x86-embedded system fails during compiling of glib2 with the
message:

...
make glib-genmarshal
make[4]: Entering directory
`/home/fp/buildroot070506/buildroot/build_i686/glib-2.12.9/gobject'
make[4]: ?glib-genmarshal? is up-to-date
make[4]: Leaving directory
`/home/fp/buildroot070506/buildroot/build_i686/glib-2.12.9/gobject'
echo "#ifndef __G_MARSHAL_H__" > xgen-gmh \
        && echo "#define __G_MARSHAL_H__" >> xgen-gmh \
        && /usr/bin/glib-genmarshal --nostdinc --prefix=g_cclosure_marshal
./gmarshal.list --header >> xgen-gmh \
        && echo "#endif /* __G_MARSHAL_H__ */" >> xgen-gmh \
        && (cmp -s xgen-gmh gmarshal.h 2>/dev/null || cp xgen-gmh gmarshal.h) \
        && rm -f xgen-gmh xgen-gmh~ \
        && echo timestamp > stamp-gmarshal.h
/bin/sh: line 2: /usr/bin/glib-genmarshal: no such file or directory
make[3]: *** [stamp-gmarshal.h] Error 127
...

Is it just my fault or is something wrong with the makefile? Copying the file
build_i686/glib-2.12.9/gobject/glib-genmarshal to staging_dir/usr/bin directory
manually didn't solve it.

Next error:
cp: Cannot stat
"/home/fp/buildroot070506/buildroot/build_i686/staging_dir/lib/libgmodule-2.0.so? not
possible: no such file or directory

For me it seems, that I have to change the makefile....but....How?

Perhaps someone has a clue...

Stefan
------------------------------------------------------------------------------------
X-Mail.net Communications Center
