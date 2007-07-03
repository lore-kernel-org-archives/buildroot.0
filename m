From: =?big5?B?V2VpY2hlbiBMZWUgKKf1q8K+XyAtIEFza2V5IC0gVFcp?= <weichen.lee@askey.com.tw>
Date: Tue, 3 Jul 2007 13:24:49 +0800
Subject: [Buildroot] Buildroot Make error at dropbear package - help
Message-ID: <9C1F4801E7902C4DB99BD17E121A00925F5BAEBD@tpex07.askey.com.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi:
I encounter the same error in buildroot make (revision 18954).
While I enter the dir. "${buildroot}/build_arm/dropbear-0.49/" and type "make" that procedure is successful.
So I comment some line in ${buildroot}/package/dropbear/dropbear.mk,
Please see the attached file.

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of A M
Sent: Tuesday, June 26, 2007 12:15 AM
To: buildroot
Subject: [Buildroot] Buildroot Make error at dropbear package - help

Does anyone have an idea why am getting this error during make? I know the message seems clear, but I do not see an option for extra options when I ran make menuconfig.  I see dropbear as a package.

Here is the error message:

                make[1]: Entering directory
                `/home/amark/development/1.0/buildroot/build_i586/dropbear-0.49'
                /home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe  -I/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/include --sysroot=/home/amark/development/1.0/buildroot/build_i586/staging_dir/ -isysroot /home/amark/development/1.0/buildroot/build_i586/staging_dir   -c -o dbmulti.o dbmulti.c
                In file included from includes.h:30,
                                 from dbmulti.c:25:
                options.h:410:2: error: #error You must compiled with
                either DROPBEAR_CLIENT or DROPBEAR_SERVER selected
                In file included from includes.h:123,
                                 from dbmulti.c:25:
                libtomcrypt/src/headers/tomcrypt.h:12:29: error:
                tomcrypt_custom.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:67:26: error:
                tomcrypt_cfg.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:68:29: error:
                tomcrypt_macros.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:69:29: error:
                tomcrypt_cipher.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:70:27: error:
                tomcrypt_hash.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:71:26: error:
                tomcrypt_mac.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:72:27: error:
                tomcrypt_prng.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:73:25: error:
                tomcrypt_pk.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:74:27: error:
                tomcrypt_math.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:75:27: error:
                tomcrypt_misc.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:76:29: error:
                tomcrypt_argchk.h: No such file or directory
                libtomcrypt/src/headers/tomcrypt.h:77:27: error:
                tomcrypt_pkcs.h: No such file or directory
                In file included from includes.h:124,
                                 from dbmulti.c:25:
                libtommath/tommath.h:95: error: expected '=', ',', ';',
                'asm' or '__attribute__' before 'mp_word'
                make[1]: *** [dbmulti.o] Error 1
                make[1]: Leaving directory
                `/home/amark/development/1.0/buildroot/build_i586/dropbear-0.49'
                make: ***
                [/home/amark/development/1.0/buildroot/build_i586/dropbear-0.49/dropbearmulti] Error 2
                [amark at max buildroot]$



Here is a section from y .config

BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_URANDOM=y

Thanks

Audu

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dropbear.mk
Type: application/octet-stream
Size: 3388 bytes
Desc: dropbear.mk
Url : http://busybox.net/lists/buildroot/attachments/20070703/d911555f/attachment.obj 
