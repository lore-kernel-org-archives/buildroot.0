From: A M <madwifi@vermark.com>
Date: Mon, 25 Jun 2007 12:14:43 -0400
Subject: [Buildroot] Buildroot Make error at dropbear package - help
Message-ID: <1182788083.3893.8.camel@max.vermark.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does anyone have an idea why am getting this error during make? I know
the message seems clear, but I do not see an option for extra options
when I ran make menuconfig.  I see dropbear as a package.

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
