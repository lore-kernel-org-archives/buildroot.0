From: William Wagner <will_wagner@carallon.com>
Date: Mon, 22 Mar 2010 19:37:59 +0000
Subject: [Buildroot] Pull request for branch x11r75patches
In-Reply-To: <4B9D62A3.7090605@carallon.com>
References: <4B96D09D.4070100@carallon.com>
	<4B9BE875.9040500@gmail.com>	<4B9C0F88.7000209@carallon.com>
	<4B9D064A.6020106@gmail.com> <4B9D62A3.7090605@carallon.com>
Message-ID: <4BA7C717.1040107@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/03/2010 15:52, Paulius Zaleckas wrote:
>> On 03/14/2010 12:19 AM, Will Wagner wrote:
>>>
>>>>> xproto_xf86miscproto: bump version
>>>>> xlib_libpciaccess: bump version
>>>>
>>>> libpciaccess fails... due to libtool patch:
>>>>
>>>> >>> Patching libtool
>>>>
>>>> Applying buildroot-libtool.patch using plaintext:
>>>> patching file ltmain.sh
>>>> Hunk #1 FAILED at 273.
>>>> Hunk #2 succeeded at 5412 (offset 3005 lines).
>>>> Hunk #3 FAILED at 2551.
>>>> Hunk #4 FAILED at 2895.
>>>> Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
>>>> Hunk #6 FAILED at 5937.
>>>> 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
>>>> Patch failed! Please fix buildroot-libtool.patch!
>>>> make: ***
>>>> [/home/paulius/buildroot/output/build/xlib_libpciaccess-0.11.0/.stamp_patched] 
>>>>
>>>> Error 1
>>>>

Sorry for taking so long to look at this, had a mad couple of weeks at work.

When building libpciaccess I get:

make O=/home/willw/martin/glowworm/controller/buildroot -C 
/home/willw/buildroot xlib_libpciaccess
make[1]: Entering directory `/home/willw/buildroot'
 >>> xlib_libpciaccess 0.11.0 Extracting
 >>> xlib_libpciaccess 0.11.0 Patching package/x11r7/xlib_libpciaccess
for file in config.guess config.sub; do for i in $(find 
/home/willw/martin/glowworm/controller/buildroot/build/xlib_libpciaccess-0.11.0 
-name $file); do cp package/gnuconfig/$file $i; done; done
 >>>   Patching libtool
 >>>   Autoreconfiguring
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: 
/home/willw/martin/glowworm/controller/buildroot/host/usr/bin/aclocal -I 
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal 
-I 
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal 
--force -I m4
configure.ac:40: warning: AC_CACHE_VAL(lt_prog_compiler_pic_works, ...): 
suspicious cache-id, must contain _cv_ to be cached
../../lib/autoconf/general.m4:1998: AC_CACHE_VAL is expanded from...
../../lib/autoconf/general.m4:2019: AC_CACHE_CHECK is expanded from...
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal/libtool.m4:632: 
AC_LIBTOOL_COMPILER_OPTION is expanded from...
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal/libtool.m4:4932: 
AC_LIBTOOL_PROG_COMPILER_PIC is expanded from...
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal/libtool.m4:2700: 
_LT_AC_LANG_C_CONFIG is expanded from...
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal/libtool.m4:2699: 
AC_LIBTOOL_LANG_C_CONFIG is expanded from...
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal/libtool.m4:80: 
AC_LIBTOOL_SETUP is expanded from...
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal/libtool.m4:60: 
_AC_PROG_LIBTOOL is expanded from...
/home/willw/martin/glowworm/controller/buildroot/staging/usr/share/aclocal/libtool.m4:25: 
AC_PROG_LIBTOOL is expanded from...
configure.ac:40: the top level

Seems like it is autoreconfiguring which then works fine. Do you have 
any other changes in your tree that means it won't be doing that?


> /home/paulius/buildroot/output/build/staging_dir/usr/bin/i386-linux-uclibc-gcc 
> -Os -pipe -Os -g2 
> -I/home/paulius/buildroot/output/build/staging_dir/usr/include 
> -I/home/paulius/buildroot/output/build/staging_dir/include 
> --sysroot=/home/paulius/buildroot/output/build/staging_dir/ -isysroot 
> /home/paulius/buildroot/output/build/staging_dir -mtune=i386 
> -march=i386 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I.. -fvisibility=hidden 
> -I/home/paulius/buildroot/output/build/staging_dir/usr/include/xorg 
> -I/home/paulius/buildroot/output/build/staging_dir/usr/include/pixman-1 -I/home/paulius/buildroot/output/build/staging_dir/usr/include/drm 
> -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes 
> -Wmissing-declarations -Wnested-externs -fno-strict-aliasing 
> -Wbad-function-cast -Wold-style-definition 
> -Wdeclaration-after-statement -fvisibility=hidden 
> -I/home/paulius/buildroot/output/build/staging_dir/usr/include/xorg 
> -I/home/paulius/buildroot/output/build/staging_dir/usr/include/pixman-1 -I/home/paulius/buildroot/output/build/staging_dir/usr/include/drm 
> -I/home/paulius/buildroot/output/build/staging_dir/usr/include/X11/dri 
> -I../uxa -I../src/render_program -Os -pipe -Os -g2 
> -I/home/paulius/buildroot/output/build/staging_dir/usr/include 
> -I/home/paulius/buildroot/output/build/staging_dir/include 
> --sysroot=/home/paulius/buildroot/output/build/staging_dir/ -isysroot 
> /home/paulius/buildroot/output/build/staging_dir -mtune=i386 
> -march=i386 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64 -MT i810_driver.lo -MD -MP -MF 
> .deps/i810_driver.Tpo -c i810_driver.c  -fPIC -DPIC -o 
> .libs/i810_driver.o
> In file included from i810_driver.c:73:
> i830.h:70:26: error: intel_bufmgr.h: No such file or directory
> In file included from i810_driver.c:73:
> i830.h:77: error: expected declaration specifiers or '...' before 
> 'drm_intel_bo'
> i830.h:140: error: expected specifier-qualifier-list before 'dri_bo'
> i830.h: In function 'i830_uxa_pixmap_is_dirty':
> i830.h:153: error: 'struct intel_pixmap' has no member named 
> 'flush_write_domain'
> i830.h: In function 'i830_pixmap_tiled':
> i830.h:158: error: 'struct intel_pixmap' has no member named 'tiling'
> i830.h: At top level:
> i830.h:161: error: expected '=', ',', ';', 'asm' or '__attribute__' 
> before '*' token
> i830.h:162: error: expected declaration specifiers or '...' before 
> 'dri_bo'
> i830.h:207: error: expected specifier-qualifier-list before 'dri_bo'
> i830.h:263: error: expected specifier-qualifier-list before 'dri_bufmgr'
> In file included from i830.h:410,
>                  from i810_driver.c:73:
> i830_batchbuffer.h: In function 'intel_batch_space':
> i830_batchbuffer.h:44: error: 'intel_screen_private' has no member 
> named 'batch_bo'
> i830_batchbuffer.h:44: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h: In function 'intel_batch_require_space':
> i830_batchbuffer.h:50: error: 'intel_screen_private' has no member 
> named 'batch_bo'
> i830_batchbuffer.h: In function 'intel_batch_start_atomic':
> i830_batchbuffer.h:59: error: 'intel_screen_private' has no member 
> named 'in_batch_atomic'
> i830_batchbuffer.h:62: error: 'intel_screen_private' has no member 
> named 'in_batch_atomic'
> i830_batchbuffer.h:63: error: 'intel_screen_private' has no member 
> named 'batch_atomic_limit'
> i830_batchbuffer.h:63: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h: In function 'intel_batch_end_atomic':
> i830_batchbuffer.h:70: error: 'intel_screen_private' has no member 
> named 'in_batch_atomic'
> i830_batchbuffer.h:71: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h:71: error: 'intel_screen_private' has no member 
> named 'batch_atomic_limit'
> i830_batchbuffer.h:72: error: 'intel_screen_private' has no member 
> named 'in_batch_atomic'
> i830_batchbuffer.h: In function 'intel_batch_emit_dword':
> i830_batchbuffer.h:77: error: 'intel_screen_private' has no member 
> named 'batch_ptr'
> i830_batchbuffer.h:78: error: 'intel_screen_private' has no member 
> named 'batch_emitting'
> i830_batchbuffer.h:79: error: 'intel_screen_private' has no member 
> named 'batch_ptr'
> i830_batchbuffer.h:79: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h:80: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h: At top level:
> i830_batchbuffer.h:85: error: expected declaration specifiers or '...' 
> before 'dri_bo'
> i830_batchbuffer.h: In function 'intel_batch_emit_reloc':
> i830_batchbuffer.h:90: error: 'intel_screen_private' has no member 
> named 'batch_ptr'
> i830_batchbuffer.h:90: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h:91: error: 'bo' undeclared (first use in this 
> function)
> i830_batchbuffer.h:91: error: (Each undeclared identifier is reported 
> only once
> i830_batchbuffer.h:91: error: for each function it appears in.)
> i830_batchbuffer.h:92: warning: implicit declaration of function 
> 'dri_bo_emit_reloc'
> i830_batchbuffer.h:92: warning: nested extern declaration of 
> 'dri_bo_emit_reloc'
> i830_batchbuffer.h:92: error: 'intel_screen_private' has no member 
> named 'batch_bo'
> i830_batchbuffer.h:93: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h:94: error: 'intel_screen_private' has no member 
> named 'batch_used'
> i830_batchbuffer.h: In function 'intel_batch_mark_pixmap_domains':
> i830_batchbuffer.h:104: error: 'struct intel_pixmap' has no member 
> named 'flush_write_domain'
> i830_batchbuffer.h:104: error: 'struct intel_pixmap' has no member 
> named 'flush_write_domain'
> i830_batchbuffer.h:108: error: 'struct intel_pixmap' has no member 
> named 'flush_read_domains'
> i830_batchbuffer.h:109: error: 'struct intel_pixmap' has no member 
> named 'batch_read_domains'
> i830_batchbuffer.h:110: error: 'struct intel_pixmap' has no member 
> named 'flush_write_domain'
> i830_batchbuffer.h:111: error: 'struct intel_pixmap' has no member 
> named 'batch_write_domain'
> i830_batchbuffer.h:112: error: 'struct intel_pixmap' has no member 
> named 'batch'
> i830_batchbuffer.h:113: error: 'struct intel_pixmap' has no member 
> named 'batch'
> i830_batchbuffer.h:113: error: 'intel_screen_private' has no member 
> named 'batch_pixmaps'
> i830_batchbuffer.h:114: error: 'struct intel_pixmap' has no member 
> named 'flush'
> i830_batchbuffer.h:115: error: 'struct intel_pixmap' has no member 
> named 'flush'
> i830_batchbuffer.h:115: error: 'intel_screen_private' has no member 
> named 'flush_pixmaps'
> i830_batchbuffer.h: In function 'intel_batch_emit_reloc_pixmap':
> i830_batchbuffer.h:125: error: 'intel_screen_private' has no member 
> named 'batch_ptr'
> i830_batchbuffer.h:130: error: 'struct intel_pixmap' has no member 
> named 'bo'
> i830_batchbuffer.h:132: error: too many arguments to function 
> 'intel_batch_emit_reloc'
> In file included from i810_driver.c:73:
> i830.h: At top level:
> i830.h:430: error: expected ')' before '*' token
> i830.h:434: error: expected declaration specifiers or '...' before 
> 'dri_bo'
> i830.h: In function 'intel_debug_fallback':
> i830.h:528: error: 'intel_screen_private' has no member named 
> 'fallback_debug'
> i830.h: At top level:
> i830.h:569: error: expected ')' before '*' token
> i830.h:579: error: expected '=', ',', ';', 'asm' or '__attribute__' 
> before '*' token
> make[4]: *** [i810_driver.lo] Error 1
> make[4]: Leaving directory 
> `/home/paulius/buildroot/output/build/xdriver_xf86-video-intel-2.10.0/src' 
>
> make[3]: *** [all-recursive] Error 1
> make[3]: Leaving directory 
> `/home/paulius/buildroot/output/build/xdriver_xf86-video-intel-2.10.0/src' 
>
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory 
> `/home/paulius/buildroot/output/build/xdriver_xf86-video-intel-2.10.0'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory 
> `/home/paulius/buildroot/output/build/xdriver_xf86-video-intel-2.10.0'
> make: *** 
> [/home/paulius/buildroot/output/build/xdriver_xf86-video-intel-2.10.0/.stamp_built] 
> Error 2

This error is because libdrm has not been rebuilt (or it failed to build 
correctly maybe?). The intel driver has a dependancy so can't see why 
this would not happen.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
