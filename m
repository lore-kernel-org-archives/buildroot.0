From: William Wagner <will_wagner@carallon.com>
Date: Thu, 25 Feb 2010 16:00:34 +0000
Subject: [Buildroot] buildroot-libtool.patch problem
Message-ID: <4B869EA2.1070800@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When updating a number of packages I am running into problems with the 
libtool patch. The updated version of the package I am trying to build 
has a newer version of ltmain.sh (2.2.6) for which the patch in 
buildroot does not apply.

Example output of it failing is:
for file in config.guess config.sub; do for i in $(find 
/home/willw/martin/glowworm/controller/buildroot/build/host-xlib_libfontenc-1.0.5 
-name $file); do cp package/gnuconfig/$file $i; done; done
 >>>   Patching libtool

Applying buildroot-libtool.patch using plaintext:
patching file ltmain.sh
Hunk #1 FAILED at 273.
Hunk #2 succeeded at 5413 (offset 3005 lines).
Hunk #3 FAILED at 5557.
Hunk #4 FAILED at 5901.
Hunk #5 succeeded at 8069 with fuzz 1 (offset 2446 lines).
Hunk #6 FAILED at 8394.
4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool.patch!
make[1]: *** 
[/home/willw/martin/glowworm/controller/buildroot/build/host-xlib_libfontenc-1.0.5/.stamp_patched] 
Error 1
make[1]: Leaving directory `/home/willw/buildroot'
make: *** [all] Error 2

I have been fixing this by setting LIBTOOL_PATCH = NO which seems to 
work, although I am not certain if some of the changes in the patch are 
still needed.

Can anyone offer some insight into this? Do we need to use a different 
version of the patch depending on the version of ltmain.sh?

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
