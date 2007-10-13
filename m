From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 14 Oct 2007 01:52:34 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jpeg
In-Reply-To: <20071013230802.20AADA6151@busybox.net>
References: <20071013230802.20AADA6151@busybox.net>
Message-ID: <0710140149380.9729@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build breaks :(

On Sat, 13 Oct 2007, ulf at uclibc.org wrote:

> Author: ulf
> Date: 2007-10-13 16:08:01 -0700 (Sat, 13 Oct 2007)
> New Revision: 20245
>
> Log:
> Create dir before use in jpeg pkg
>
> Modified:
>    trunk/buildroot/package/jpeg/jpeg.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/jpeg/jpeg.mk
> ===================================================================
> --- trunk/buildroot/package/jpeg/jpeg.mk	2007-10-13 23:07:04 UTC (rev 20244)
> +++ trunk/buildroot/package/jpeg/jpeg.mk	2007-10-13 23:08:01 UTC (rev 20245)
> @@ -73,6 +73,7 @@
>  	touch -c $@
>
>  $(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/lib/libjpeg.a
> +	mkdir -p $(TARGET_DIR)/usr/lib
>  	cp -dpf $(STAGING_DIR)/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
>  	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libjpeg.so*
>  	touch -c $@

.../build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
-Os -pipe
-I.../build_i486/staging_dir/usr/include
-I.../build_i486/staging_dir/include
--sysroot=.../build_i486/staging_dir/ -isysroot
.../build_i486/staging_dir -mtune=i486
-march=i486 -o .libs/cjpeg cjpeg.o rdppm.o rdgif.o rdtarga.o rdrle.o
rdbmp.o rdswitch.o cdjpeg.o -Wl,--rpath -Wl,/lib .libs/libjpeg.so
.../build_i486/staging_dir//lib/libc.so.0:
undefined reference to `_dl_app_init_array'
.../build_i486/staging_dir//lib/libc.so.0:
undefined reference to `_dl_app_fini_array'
collect2: ld returned 1 exit status
make[1]: *** [cjpeg] Error 1
make[1]: Leaving directory
`.../build_i486/jpeg-6b'


Thanks,

-- 
Cristian
