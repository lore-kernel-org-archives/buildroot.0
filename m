From: Brian C. Lane <bcl@brianlane.com>
Date: Fri, 18 Aug 2006 06:23:57 -0700
Subject: [Buildroot] Packages that error out during build
In-Reply-To: <75FBAF4B06609F4BB994B92502E964EA6F611C@dc03.sepago.de>
References: <75FBAF4B06609F4BB994B92502E964EA6F611C@dc03.sepago.de>
Message-ID: <44E5BF6D.2090508@brianlane.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sascha Juch wrote:
> Hello list members,
> I have a problem in compiling X.org 6.8.2 with buildroot. I don't know
> if the error reported by Drew maybe has the same reason so I just
> copy'n'pasted it here.
> 
>> On Thu Aug 10, 2006 at 05:07:38PM -0400, Drew Cohan wrote:
>>> And the last one I tried using buildroot 15797, Xorg:
>>>
>>> cc -I../../../exports/include -o xkbcomp  xkbcomp.o xkbscan.o expr.o
>>> vmod.o indicators.o misc.o alias.o 		 keymap.o keycodes.o 
>>> keytypes.o
>>> compat.o action.o 		 symbols.o geometry.o xkbpath.o
> listing.o  
>>> xkbparse.o parseutils.o utils.o  -L/usr/X11R6/lib -lxkbfile -lX11
>> Dunno, this builds for me.  But clearly if it is trying to use
> /usr/X11R6/lib for libraries, something is very wrong.
>>  -Erik
> 
> My toolchain contains: Kernel Headers 2.6.12, binutils 2.16.91.0.7 and
> gcc 4.0.3.  
> 
> Here are the last lines from the output of make:
> 
> [...]
> + install -c -m 0444 ZapfDingbats.pmf 
> + /home/sascha/svn/buildroot2/buildroot/build_i386/staging_dir/usr/X11R6
> + /lib/X11/xserver/C/print/models/PSdefault/fonts
> (mkfontscale -b -s -l
> /home/sascha/svn/buildroot2/buildroot/build_i386/staging_dir/usr/X11R6/l
> ib/X11/xserver/C/print/models/PSdefault/fonts)
> mkfontscale [ -e encoding ] [ -f fuzz ] [ directory ]
> make[10]: *** [install] Error 1
> make[10]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver/Xp
> Config/C/print/models/PSdefault/fonts'
> make[9]: *** [install] Error 2
> make[9]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver/Xp
> Config/C/print/models/PSdefault'
> make[8]: *** [install] Error 2
> make[8]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver/Xp
> Config/C/print/models'
> make[7]: *** [install] Error 2
> make[7]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver/Xp
> Config/C/print'
> make[6]: *** [install] Error 2
> make[6]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver/Xp
> Config/C'
> make[5]: *** [install] Error 2
> make[5]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver/Xp
> Config'
> make[4]: *** [install] Error 2
> make[4]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs/Xserver'
> make[3]: *** [install] Error 2
> make[3]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc/programs'
> make[2]: *** [install] Error 2
> make[2]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc'
> make[1]: *** [install] Error 2
> make[1]: Leaving directory
> `/home/sascha/svn/buildroot2/buildroot/build_i386/xc'
> make: ***
> [/home/sascha/svn/buildroot2/buildroot/build_i386/staging_dir/usr/X11R6/
> lib/libX11.so.6.2] Error 2 sascha at gulpdev:~/svn/buildroot2/buildroot$
> 
> Any idea what I'm missing here or is there maybe something broken?
> 
> Thanks a lot in advance,
> Sascha.

Its trying to run mkfontscale, which apparently errored out. I'll bet it
picked up mkfontscale from your native distribution and not from the
buildroot system, it appears from the error message that they take
different command line options.

Brian

- --
- ---[Office 70.2F]--[Outside 47.4F]--[Server 84.7F]--[Coaster 70.5F]---
Linux Software Developer                      http://www.brianlane.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Remember Lexington Green!

iD8DBQFE5b9tIftj/pcSws0RAlJuAJ9UepegAYiyjww4qD7JvOcsPXHingCfbNdx
W9unAajFUhowYU4RMjvO87w=
=a73D
-----END PGP SIGNATURE-----
