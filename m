From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 09 Nov 2009 23:43:34 +0100
Subject: [Buildroot] libtiff compilation fails when libjpeg62-dev is
 present on host
In-Reply-To: <20091109071956.GC26599@jasper.tkos.co.il>
References: <20091109071956.GC26599@jasper.tkos.co.il>
Message-ID: <1257806614.24296.9.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lundi 09 novembre 2009 ? 09:19 +0200, Baruch Siach a ?crit :
> Hi Buildroot list,
> 
> I need to compile libtiff as a dependency of ImageMagic on a recent Debian 
> Squeeze host.  The strange this is that when the libjpeg62-dev is installed on 
> the host libtools finds the host /usr/lib/libjpeg.la file during build, which makes 
> the build to fail at link time as follows:
> 
> libtool: link: /opt/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -Os -pipe -Os  --sysroot /home/baruch/git/buildroot/build_arm/staging_dir/ -shared  .libs/tif_aux.o .libs/tif_close.o .libs/tif_codec.o .libs/tif_color.o .libs/tif_compress.o .libs/tif_dir.o .libs/tif_dirinfo.o .libs/tif_dirread.o .libs/tif_dirwrite.o .libs/tif_dumpmode.o .libs/tif_error.o .libs/tif_extension.o .libs/tif_fax3.o .libs/tif_fax3sm.o .libs/tif_flush.o .libs/tif_getimage.o .libs/tif_jpeg.o .libs/tif_luv.o .libs/tif_lzw.o .libs/tif_next.o .libs/tif_ojpeg.o .libs/tif_open.o .libs/tif_packbits.o .libs/tif_pixarlog.o .libs/tif_predict.o .libs/tif_print.o .libs/tif_read.o .libs/tif_strip.o .libs/tif_swab.o .libs/tif_thunder.o .libs/tif_tile.o .libs/tif_unix.o .libs/tif_version.o .libs/tif_warning.o .libs/tif_write.o .libs/tif_zip.o  -Wl,--whole-archive ../port/.libs/libport.a -Wl,--no-whole-archive  /usr/lib/libjpeg.so -lz -lm -lc      -Wl,-soname -Wl,libtiff.so.3 -o .libs/libtiff.so.3.8.2
> /usr/lib/libjpeg.so: file not recognized: File format not recognized
> collect2: ld returned 1 exit status
> 
> Removing libjpeg62-dev, or even renaming the host /usr/lib/libjpeg.la file 
> makes the problem go away. Is there a sane solutions for this?
> 
> baruch
> 

I got the same problem with a bunch of package (gtk/glib/dbus-glib...)
using an external toolchain.

I usually fix the problem by enabling libtool patching on the package.

-- 
Lionel Landwerlin <llandwerlin@gmail.com>
