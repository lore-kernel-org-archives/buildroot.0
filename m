From: Crispin Wellington <cwellington@iipc.com.au>
Date: Thu, 16 Nov 2006 15:11:46 +0800
Subject: [Buildroot] Problems building asterisk in buildroot under Debian on
	intel	platform
Message-ID: <1163661107.26662.9.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have got my buildroot system fully building without asterisk. But when
I switch asterisk on in the config and do a make I get...

----------------------------------------------------
buildroot$ make

Checking build system dependencies:
sed works:                          Ok
GNU make version '3.80':            Ok
.//toolchain/dependencies/dependencies.sh: line 81: [: 1:3: integer
expression expected
gcc version '1:3.3.5':              Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

wget --passive-ftp -P /home/crispin/initramfs/src/buildroot/dl
ftp://ftp.digium.com/pub/asterisk/asterisk-1.2.0-beta1.tar.gz
--15:03:35--
ftp://ftp.digium.com/pub/asterisk/asterisk-1.2.0-beta1.tar.gz
           =>
`/home/crispin/initramfs/src/buildroot/dl/asterisk-1.2.0-beta1.tar.gz'
Resolving ftp.digium.com... 69.16.138.164, 216.27.40.102
Connecting to ftp.digium.com[69.16.138.164]:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /pub/asterisk ... done.
==> PASV ... done.    ==> RETR asterisk-1.2.0-beta1.tar.gz ... 
No such file `asterisk-1.2.0-beta1.tar.gz'.

make: ***
[/home/crispin/initramfs/src/buildroot/dl/asterisk-1.2.0-beta1.tar.gz]
Error 1
-------------------------------------------------------

So this is an older version of asterisk. So I tried updating it to
1.2.13. I went into package/asterisk/asterisk.mk and changed the
asterisk version line to:

ASTERISK_VERSION := 1.2.13

The build now begins and progresses but eventually fails with the
following:

-----------------------------------------------------------------
/home/crispin/initramfs/src/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc  -pipe  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations  -Iinclude -I../include -D_REENTRANT -D_GNU_SOURCE  -Os -pipe -march=i686        -DLOW_MEMORY -fomit-frame-pointer  -DPOLLCOMPAT -DDLFCNCOMPAT   -c -o cryptostub.o cryptostub.c
/home/crispin/initramfs/src/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc  -pipe  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations  -Iinclude -I../include -D_REENTRANT -D_GNU_SOURCE  -Os -pipe -march=i686        -DLOW_MEMORY -fomit-frame-pointer  -DPOLLCOMPAT -DDLFCNCOMPAT   -c -o poll.o poll.c
/home/crispin/initramfs/src/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc  -pipe  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations  -Iinclude -I../include -D_REENTRANT -D_GNU_SOURCE  -Os -pipe -march=i686        -DLOW_MEMORY -fomit-frame-pointer  -DPOLLCOMPAT -DDLFCNCOMPAT   -c -o dlfcn.o dlfcn.c
dlfcn.c:40:25: mach-o/dyld.h: No such file or directory
dlfcn.c:41:26: mach-o/nlist.h: No such file or directory
dlfcn.c:42:28: mach-o/getsect.h: No such file or directory
dlfcn.c:82: error: parse error before '*' token
dlfcn.c:83: warning: type defaults to `int' in declaration of `NSSymbol'
dlfcn.c:83: error: `NSSymbol' declared as function returning a function
dlfcn.c:83: warning: function declaration isn't a prototype
dlfcn.c:83: error: function `NSSymbol' is initialized like a variable
dlfcn.c:123: error: parse error before "NSModule"
dlfcn.c:123: warning: no semicolon at end of struct or union
dlfcn.c:130: error: parse error before '}' token
dlfcn.c:133: error: variable `mainStatus' has initializer but incomplete
type
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:133: error: `NSModule' undeclared here (not in a function)
dlfcn.c:133:42: warning: multi-character character constant
dlfcn.c:133: error: parse error before '\x44594d4f'
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:133: warning: excess elements in struct initializer
dlfcn.c:133: warning: (near initialization for `mainStatus')
dlfcn.c:158: error: parse error before '*' token
dlfcn.c:158: warning: type defaults to `int' in declaration of
`search_linked_libs'
dlfcn.c:158: warning: data definition has no type or storage class
dlfcn.c:160: error: parse error before '*' token
dlfcn.c:160: warning: function declaration isn't a prototype
dlfcn.c: In function `get_lib_name':
dlfcn.c:230: warning: implicit declaration of function
`_dyld_image_count'
dlfcn.c:237: warning: implicit declaration of function
`_dyld_get_image_header'
dlfcn.c:237: warning: comparison between pointer and integer
dlfcn.c:239: warning: implicit declaration of function
`_dyld_get_image_name'
dlfcn.c:239: warning: assignment makes pointer from integer without a
cast
dlfcn.c: At top level:
dlfcn.c:251: error: parse error before '*' token
dlfcn.c:252: warning: function declaration isn't a prototype
dlfcn.c: In function `get_mach_header_from_NSModule':
dlfcn.c:253: warning: implicit declaration of function `NSNameOfModule'
dlfcn.c:253: error: `mod' undeclared (first use in this function)
dlfcn.c:253: error: (Each undeclared identifier is reported only once
dlfcn.c:253: error: for each function it appears in.)
dlfcn.c:253: warning: initialization makes pointer from integer without
a cast
dlfcn.c:260: warning: passing arg 2 of `strcmp' makes pointer from
integer without a cast
dlfcn.c:262: warning: assignment makes pointer from integer without a
cast
dlfcn.c: In function `isValidStatus':
dlfcn.c:388: error: dereferencing pointer to incomplete type
dlfcn.c:391: error: dereferencing pointer to incomplete type
dlfcn.c:391: error: dereferencing pointer to incomplete type
dlfcn.c:394: error: `TRUE' undeclared (first use in this function)
dlfcn.c:395: error: `FALSE' undeclared (first use in this function)
dlfcn.c: In function `lookupStatus':
dlfcn.c:408: error: dereferencing pointer to incomplete type
dlfcn.c:408: error: dereferencing pointer to incomplete type
dlfcn.c:409: error: dereferencing pointer to incomplete type
dlfcn.c: In function `insertStatus':
dlfcn.c:416: error: dereferencing pointer to incomplete type
dlfcn.c:417: error: dereferencing pointer to incomplete type
dlfcn.c:418: error: dereferencing pointer to incomplete type
dlfcn.c:419: error: dereferencing pointer to incomplete type
dlfcn.c:420: error: dereferencing pointer to incomplete type
dlfcn.c:422: error: dereferencing pointer to incomplete type
dlfcn.c:424: error: dereferencing pointer to incomplete type
dlfcn.c: In function `allocStatus':
dlfcn.c:437: error: dereferencing pointer to incomplete type
dlfcn.c:438: error: dereferencing pointer to incomplete type
dlfcn.c: In function `promoteLocalToGlobal':
dlfcn.c:444: error: parse error before "module"
dlfcn.c:444: warning: function declaration isn't a prototype
dlfcn.c:447: warning: implicit declaration of function
`_dyld_func_lookup'
dlfcn.c:447: warning: dereferencing type-punned pointer will break
strict-aliasing rules
dlfcn.c:448: error: dereferencing pointer to incomplete type
dlfcn.c:448:25: warning: multi-character character constant
dlfcn.c:448: error: parse error before '\x44594d4f'
dlfcn.c:448: error: dereferencing pointer to incomplete type
dlfcn.c: In function `reference':
dlfcn.c:455: error: dereferencing pointer to incomplete type
dlfcn.c:455:22: warning: multi-character character constant
dlfcn.c:455: error: parse error before '\x44594d4f'
dlfcn.c:462: error: dereferencing pointer to incomplete type
dlfcn.c:467: error: dereferencing pointer to incomplete type
dlfcn.c:468: error: dereferencing pointer to incomplete type
dlfcn.c: In function `my_find_image':
dlfcn.c:489: warning: assignment makes pointer from integer without a
cast
dlfcn.c:492: warning: assignment makes pointer from integer without a
cast
dlfcn.c: At top level:
dlfcn.c:506: error: parse error before '*' token
dlfcn.c:507: warning: return type defaults to `int'
dlfcn.c: In function `search_linked_libs':
dlfcn.c:511: error: `nssym' undeclared (first use in this function)
dlfcn.c:512: error: `dyld_NSLookupSymbolInImage' undeclared (first use
in this function)
dlfcn.c:514: error: invalid application of `sizeof' to incomplete type
`mach_header' 
dlfcn.c:515: error: dereferencing pointer to incomplete type
dlfcn.c:515: error: dereferencing pointer to incomplete type
dlfcn.c:517: error: `LC_LOAD_DYLIB' undeclared (first use in this
function)
dlfcn.c:517: error: dereferencing pointer to incomplete type
dlfcn.c:517: error: dereferencing pointer to incomplete type
dlfcn.c:520: error: dereferencing pointer to incomplete type
dlfcn.c:525: warning: implicit declaration of function
`dyld_NSLookupSymbolInImage'
dlfcn.c:534: warning: implicit declaration of function
`NSIsSymbolNameDefined'
dlfcn.c: In function `dyld_error_str':
dlfcn.c:546: error: `NSLinkEditErrors' undeclared (first use in this
function)
dlfcn.c:546: error: parse error before "dylder"
dlfcn.c:551: warning: implicit declaration of function `NSLinkEditError'
dlfcn.c:551: error: `dylder' undeclared (first use in this function)
dlfcn.c: In function `dlsymIntern':
dlfcn.c:562: error: `nssym' undeclared (first use in this function)
dlfcn.c:574: error: `dyld_NSLookupSymbolInImage' undeclared (first use
in this function)
dlfcn.c:585: warning: implicit declaration of function
`dyld_NSLookupSymbolInImage'
dlfcn.c:615: error: dereferencing pointer to incomplete type
dlfcn.c:615:22: warning: multi-character character constant
dlfcn.c:615: error: parse error before '\x44594d4f'
dlfcn.c:617: warning: implicit declaration of function
`NSLookupSymbolInModule'
dlfcn.c:617: error: dereferencing pointer to incomplete type
dlfcn.c:622: error: dereferencing pointer to incomplete type
dlfcn.c:625: error: dereferencing pointer to incomplete type
dlfcn.c:627: error: dereferencing pointer to incomplete type
dlfcn.c:629: warning: implicit declaration of function
`dyld_NSLookupSymbolInImage'
dlfcn.c:629: error: dereferencing pointer to incomplete type
dlfcn.c:638: error: dereferencing pointer to incomplete type
dlfcn.c:641: error: dereferencing pointer to incomplete type
dlfcn.c:641:27: warning: multi-character character constant
dlfcn.c:641: error: parse error before '\x44594d4f'
dlfcn.c:649: warning: implicit declaration of function
`NSLookupAndBindSymbol'
dlfcn.c:682: warning: implicit declaration of function
`NSAddressOfSymbol'
dlfcn.c:682: warning: return makes pointer from integer without a cast
dlfcn.c: In function `loadModule':
dlfcn.c:687: error: `NSObjectFileImage' undeclared (first use in this
function)
dlfcn.c:687: error: parse error before "ofi"
dlfcn.c:688: error: `NSObjectFileImageReturnCode' undeclared (first use
in this function)
dlfcn.c:690: error: `NSLinkEditErrors' undeclared (first use in this
function)
dlfcn.c:690: error: parse error before "ler"
dlfcn.c:695: error: `ofirc' undeclared (first use in this function)
dlfcn.c:695: warning: implicit declaration of function
`NSCreateObjectFileImageFromFile'
dlfcn.c:695: error: `ofi' undeclared (first use in this function)
dlfcn.c:698: error: `NSObjectFileImageSuccess' undeclared (first use in
this function)
dlfcn.c:700: error: `NSObjectFileImageInappropriateFile' undeclared
(first use in this function)
dlfcn.c:701: error: `dyld_NSLookupSymbolInImage' undeclared (first use
in this function)
dlfcn.c:716: error: `NSObjectFileImageFailure' undeclared (first use in
this function)
dlfcn.c:719: error: `NSObjectFileImageArch' undeclared (first use in
this function)
dlfcn.c:722: error: `NSObjectFileImageFormat' undeclared (first use in
this function)
dlfcn.c:725: error: `NSObjectFileImageAccess' undeclared (first use in
this function)
dlfcn.c:742: error: dereferencing pointer to incomplete type
dlfcn.c:745: error: dereferencing pointer to incomplete type
dlfcn.c:747: error: dereferencing pointer to incomplete type
dlfcn.c:748:10: warning: multi-character character constant
dlfcn.c:748: error: parse error before '\x44594f46'
dlfcn.c:749: error: dereferencing pointer to incomplete type
dlfcn.c:749:18: warning: multi-character character constant
dlfcn.c:749: error: parse error before '\x44594d4f'
dlfcn.c:754: error: dereferencing pointer to incomplete type
dlfcn.c:756: error: `ler' undeclared (first use in this function)
dlfcn.c:761: error: dereferencing pointer to incomplete type
dlfcn.c:770: error: dereferencing pointer to incomplete type
dlfcn.c:770: warning: implicit declaration of function `NSLinkModule'
dlfcn.c:771: error: `NSLINKMODULE_OPTION_RETURN_ON_ERROR' undeclared
(first use in this function)
dlfcn.c:772: error: `NSLINKMODULE_OPTION_PRIVATE' undeclared (first use
in this function)
dlfcn.c:773: error: `NSLINKMODULE_OPTION_BINDNOW' undeclared (first use
in this function)
dlfcn.c:774: warning: implicit declaration of function
`NSDestroyObjectFileImage'
dlfcn.c:775: error: dereferencing pointer to incomplete type
dlfcn.c:777: error: dereferencing pointer to incomplete type
dlfcn.c:777: error: dereferencing pointer to incomplete type
dlfcn.c:780: error: dereferencing pointer to incomplete type
dlfcn.c:783: error: dereferencing pointer to incomplete type
dlfcn.c: In function `dlcompat_init_func':
dlfcn.c:807: warning: dereferencing type-punned pointer will break
strict-aliasing rules
dlfcn.c:809: warning: dereferencing type-punned pointer will break
strict-aliasing rules
dlfcn.c:810: error: `dyld_NSLookupSymbolInImage' undeclared (first use
in this function)
dlfcn.c: In function `dlcompat_cleanup':
dlfcn.c:841: error: dereferencing pointer to incomplete type
dlfcn.c: In function `dlopen':
dlfcn.c:916: error: dereferencing pointer to incomplete type
dlfcn.c: In function `dlclose':
dlfcn.c:1050: error: dereferencing pointer to incomplete type
dlfcn.c:1050:21: warning: multi-character character constant
dlfcn.c:1050: error: parse error before '\x44594d4f'
dlfcn.c:1053: error: dereferencing pointer to incomplete type
dlfcn.c:1059: error: dereferencing pointer to incomplete type
dlfcn.c:1065: error: dereferencing pointer to incomplete type
dlfcn.c:1071: error: dereferencing pointer to incomplete type
dlfcn.c:1090: warning: implicit declaration of function
`getsectbynamefromheader'
dlfcn.c:1090: error: dereferencing pointer to incomplete type
dlfcn.c:1091: warning: comparison between pointer and integer
dlfcn.c:1093: error: `NSUNLINKMODULE_OPTION_KEEP_MEMORY_MAPPED'
undeclared (first use in this function)
dlfcn.c:1097: error: dereferencing pointer to incomplete type
dlfcn.c:1100: warning: implicit declaration of function `NSUnLinkModule'
dlfcn.c:1100: error: dereferencing pointer to incomplete type
dlfcn.c:1105: error: dereferencing pointer to incomplete type
dlfcn.c:1106: error: dereferencing pointer to incomplete type
dlfcn.c: In function `image_for_address':
dlfcn.c:1142: warning: initialization makes integer from pointer without
a cast
dlfcn.c:1145: warning: implicit declaration of function
`_dyld_get_image_vmaddr_slide'
dlfcn.c:1146: warning: assignment makes pointer from integer without a
cast
dlfcn.c:1149: error: invalid application of `sizeof' to incomplete type
`mach_header' 
dlfcn.c:1150: error: dereferencing pointer to incomplete type
dlfcn.c:1150: error: dereferencing pointer to incomplete type
dlfcn.c:1152: error: `LC_SEGMENT' undeclared (first use in this
function)
dlfcn.c:1152: error: dereferencing pointer to incomplete type
dlfcn.c:1153: error: dereferencing pointer to incomplete type
dlfcn.c:1155: error: dereferencing pointer to incomplete type
dlfcn.c:1155: error: dereferencing pointer to incomplete type
dlfcn.c: In function `dladdr':
dlfcn.c:1177: warning: initialization makes integer from pointer without
a cast
dlfcn.c:1194: warning: assignment makes pointer from integer without a
cast
dlfcn.c:1197: error: invalid application of `sizeof' to incomplete type
`mach_header' 
dlfcn.c:1198: error: dereferencing pointer to incomplete type
dlfcn.c:1198: error: dereferencing pointer to incomplete type
dlfcn.c:1200: error: `LC_SEGMENT' undeclared (first use in this
function)
dlfcn.c:1200: error: dereferencing pointer to incomplete type
dlfcn.c:1201: error: dereferencing pointer to incomplete type
dlfcn.c:1203: error: dereferencing pointer to incomplete type
dlfcn.c:1203: error: dereferencing pointer to incomplete type
dlfcn.c:1205: warning: assignment makes pointer from integer without a
cast
dlfcn.c:1220: error: invalid application of `sizeof' to incomplete type
`mach_header' 
dlfcn.c:1221: error: dereferencing pointer to incomplete type
dlfcn.c:1221: error: dereferencing pointer to incomplete type
dlfcn.c:1223: error: dereferencing pointer to incomplete type
dlfcn.c:1225: error: dereferencing pointer to incomplete type
dlfcn.c:1230: error: dereferencing pointer to incomplete type
dlfcn.c:1231: error: dereferencing pointer to incomplete type
dlfcn.c:1234: error: invalid application of `sizeof' to incomplete type
`mach_header' 
dlfcn.c:1235: error: dereferencing pointer to incomplete type
dlfcn.c:1235: error: dereferencing pointer to incomplete type
dlfcn.c:1237: error: `LC_SYMTAB' undeclared (first use in this function)
dlfcn.c:1237: error: dereferencing pointer to incomplete type
dlfcn.c:1240: error: dereferencing pointer to incomplete type
dlfcn.c:1241: error: dereferencing pointer to incomplete type
dlfcn.c:1244: error: dereferencing pointer to incomplete type
dlfcn.c:1249: error: dereferencing pointer to incomplete type
dlfcn.c:1250: error: dereferencing pointer to incomplete type
dlfcn.c:1250: error: `N_PEXT' undeclared (first use in this function)
dlfcn.c:1251: error: dereferencing pointer to incomplete type
dlfcn.c:1251: error: `N_EXT' undeclared (first use in this function)
dlfcn.c:1254: error: increment of pointer to unknown structure
dlfcn.c:1254: error: arithmetic on pointer to an incomplete type
dlfcn.c:1257: error: dereferencing pointer to incomplete type
dlfcn.c:1257: error: dereferencing pointer to incomplete type
dlfcn.c:1259: error: dereferencing pointer to incomplete type
dlfcn.c:1262: error: increment of pointer to unknown structure
dlfcn.c:1262: error: arithmetic on pointer to an incomplete type
dlfcn.c:1266: error: dereferencing pointer to incomplete type
dlfcn.c:1267: error: dereferencing pointer to incomplete type
dlfcn.c: In function `search_linked_libs':
dlfcn.c:515: warning: value computed is not used
dlfcn.c: In function `dladdr':
dlfcn.c:1198: warning: value computed is not used
dlfcn.c:1221: warning: value computed is not used
dlfcn.c:1235: warning: value computed is not used
dlfcn.c: At top level:
dlfcn.c:133: error: storage size of `mainStatus' isn't known
dlfcn.c:83: warning: 'NSSymbol' declared `static' but never defined
make[1]: *** [dlfcn.o] Error 1
make[1]: Leaving directory
`/home/crispin/initramfs/src/buildroot/build_i686/asterisk-1.2.13'
make: ***
[/home/crispin/initramfs/src/buildroot/build_i686/asterisk-1.2.13/asterisk] Error 2
-----------------------------------------------------------------------

Now all these NS strings remind me of Mac OSX, and the missing
mach-o/*.h files seem to me to suggest that the build thinks it is for a
Mach kernel on OSX. However I am on Debian Linux, compiling for an i386
target. It seems to have gotten confused about the build platform
between 1.2.0-beta1 and 1.2.13

Does anyone have any pointers on how to get this up to date version of
asterisk to build under buildroot?

Thankyou.

Kind Regards
Crispin Wellington
