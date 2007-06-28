From: Paul Barrette <r01325@freescale.com>
Date: Thu, 28 Jun 2007 15:53:47 -0400
Subject: [Buildroot] buildroot uClibc build problems for powerpc
Message-ID: <468411CB.8040200@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having build issues with the latest buildroot for the ppc.  I have 
been using buildroot for a few years now for embedded development and it 
is time to upgrade for new pkgs, toolchain etc (great tool btw!).

Here are the particulars with a bare minimum compile for:
   powerpc
   builroot toolchain
   linux-2.6.21.x
    snapshot uClibc (def the same issue)
   binutils 2.17.50.0.16
   build C++ compiler

I get the following error:

make[1]: Entering directory 
`/localdisk/pb/latest_buildroot/buildroot/toolchain_build_powerpc_nofpu/uClibc' 

 CC utils/readelf
 STRIP -x -R .note -R .comment ../utils/readelf
 CC utils/ldconfig
 STRIP -x -R .note -R .comment ../utils/ldconfig
 CC utils/ldd
 STRIP -x -R .note -R .comment ../utils/ldd
 CC utils/iconv
../libc/misc/wchar/wchar.c:132:2: warning: #warning 
__CTYPE_HAS_UTF_8_LOCALES not set!
../libc/misc/wchar/wchar.c: In function '_wchar_utf8sntowcs':
../libc/misc/wchar/wchar.c:169: error: expected declaration specifiers 
before 'attribute_hidden'
../libc/misc/wchar/wchar.c:172: error: expected '=', ',', ';', 'asm' or 
'__attribute__' before 'attribute_hidden'
../libc/misc/wchar/wchar.c:1186: error: storage class specified for 
parameter '_UC_iconv_t'
In file included from ../libc/misc/wchar/wchar.c:1570:
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:40: 
error: storage class specified for parameter 'memcpy'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:44: 
error: storage class specified for parameter 'memmove'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:53: 
error: storage class specified for parameter 'memccpy'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:59: 
error: storage class specified for parameter 'memset'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:63: 
error: storage class specified for parameter 'memcmp'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:67: 
error: storage class specified for parameter 'memchr'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:85: 
error: storage class specified for parameter 'strcpy'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:89: 
error: storage class specified for parameter 'strncpy'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:93: 
error: storage class specified for parameter 'strcat'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:96: 
error: storage class specified for parameter 'strncat'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:100: 
error: storage class specified for parameter 'strcmp'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:103: 
error: storage class specified for parameter 'strncmp'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:107: 
error: storage class specified for parameter 'strcoll'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:111: 
error: storage class specified for parameter 'strxfrm'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:131: 
error: storage class specified for parameter 'strdup'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:168: 
error: storage class specified for parameter 'strchr'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:171: 
error: storage class specified for parameter 'strrchr'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:185: 
error: storage class specified for parameter 'strcspn'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:189: 
error: storage class specified for parameter 'strspn'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:192: 
error: storage class specified for parameter 'strpbrk'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:195: 
error: storage class specified for parameter 'strstr'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:200: 
error: storage class specified for parameter 'strtok'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:214: 
error: storage class specified for parameter 'strtok_r'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:247: 
error: storage class specified for parameter 'strlen'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:260: 
error: storage class specified for parameter 'strerror'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:286: 
error: storage class specified for parameter '__glibc_strerror_r'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:288: 
error: storage class specified for parameter 'strerror_r'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:339: 
error: storage class specified for parameter 'ffs'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:353: 
error: storage class specified for parameter 'strcasecmp'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:357: 
error: storage class specified for parameter 'strncasecmp'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:377: 
error: storage class specified for parameter 'strsep'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:430: 
error: storage class specified for parameter 'strlcat'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/string.h:432: 
error: storage class specified for parameter 'strlcpy'
In file included from ../libc/misc/wchar/wchar.c:1572:
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/iconv.h:34: 
error: storage class specified for parameter 'iconv_t'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/iconv.h:42: 
error: expected '=', ',', ';', 'asm' or '__attribute__' before 'iconv_open'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/iconv.h:47: 
error: expected ')' before '__cd'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/iconv.h:56: 
error: expected ')' before '__cd'
In file included from ../libc/misc/wchar/wchar.c:1573:
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/bin/../lib/gcc/powerpc-linux-uclibc/4.2.0/include/stdarg.h:105: 
error: storage class specified for parameter 'va_list'
In file included from ../libc/misc/wchar/wchar.c:1574:
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/libgen.h:27: 
error: storage class specified for parameter 'dirname'
/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/staging_dir/usr/include/libgen.h:35: 
error: storage class specified for parameter '__xpg_basename'
../libc/misc/wchar/wchar.c:1576: error: storage class specified for 
parameter '__iconv_codesets'
../libc/misc/wchar/wchar.c:1585: error: storage class specified for 
parameter 'error_msg'
../libc/misc/wchar/wchar.c:1588: error: expected '=', ',', ';', 'asm' or 
'__attribute__' before '{' token
../libc/misc/wchar/wchar.c:1602: error: expected '=', ',', ';', 'asm' or 
'__attribute__' before '{' token
../libc/misc/wchar/wchar.c:1731: error: old-style parameter declarations 
in prototyped function definition
../libc/misc/wchar/wchar.c:1731: error: expected '{' at end of input
make[2]: *** [../utils/iconv] Error 1
make[1]: *** [utils] Error 2
make[1]: Leaving directory 
`/localdisk/pb/latest_buildroot/buildroot/toolchain_build_powerpc_nofpu/uClibc' 

make: *** 
[/localdisk/pb/latest_buildroot/buildroot/build_powerpc_nofpu/root/usr/bin/ldd] 
Error 2

Any help would be greatly appreciated!
Thanks,
Paul

-- 
Paul Barrette 
Freescale Semiconductor
paul.barrette at freescale.com
(613) 723-9161 x4034

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070628/ccf9a525/attachment.htm 
