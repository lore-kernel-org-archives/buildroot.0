From: Drew Cohan <drewcohan@gmail.com>
Date: Tue Jul 25 11:14:08 2006
Subject: [Buildroot] buildroot compilation error "extra tokens at end of
	#ident directive"
Message-ID: <bf61e79a0607251106n321c6f1dgf2c3187cef783163@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm experiencing a compilation error "extra tokens at end of #ident
directive" while building buildroot.  Can someone please help?

Here are the steps I've taken:

1.  install a fully functional development environment using CentOS
v4.3onto an x86 box (this environment had previously compiled
buildroot without
issues on or around 6/27/06 and not touched since then, so I know it to be a
"good" environment).
2. rm -rf buildroot (to make sure everything is clean, I understand there
are better ways)
3. wget -q
http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2
4. tar xvfj buildroot-snapshot.tar.bz2
5. cd buildroot
6. make menuconfig
7. leave everything as "shipped", exit, save config
8. make
9. when the new config questions come up, choose "8" at the first prompt
(pentium 3), keep the default answers for the remaining nine questions or so
by hitting enter.

forty-five minutes later, compilation error:

CC modutils/insmod.o
/home/pkuser/buildroot/build_i686/busybox/modutils/insmod.c:352:10: extra
tokens at end of #ident directive
/home/pkuser/buildroot/build_i686/busybox/modutils/insmod.c:515:10: extra
tokens at end of #ident directive
make[2]: *** [/home/pkuser/buildroot/build_i686/busybox/modutils/insmod.o]
Error 1
make[1]: *** [_all] Error 2
make[1]: Leaving directory `/home/pkuser/buildroot/build_i686/busybox'
make: *** [/home/pkuser/buildroot/build_i686/busybox/busybox] Error 2

The two offending lines in the source code are identical:

#ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"
#ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"

Here are the results of the host environment checks buildroot does:

Checking build system dependencies:
sed works:                          Ok
GNU make version '3.80':            Ok
gcc version '3.4.5':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

I have a log of the entire build process if that would help.

Thanks,

Drew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060725/4e818a9c/attachment-0001.html
