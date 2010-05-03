From: Javier Viguera <javier.viguera@digi.com>
Date: Mon, 3 May 2010 16:57:06 +0200
Subject: [Buildroot] buildroot 2010.05-rc1 fail to build gst-plugins-ugly
Message-ID: <4BDEE442.4060006@digi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Same problem again with 2010.05-rc1.

Seems that the patch applied by Peter is not exactly the same than 
Lionel's because Lionel's was working and current RC1 is not:

Now is trying to link to a host libmad.

libtool: link: 
/usr/local/DigiEL-5.5/x-tools/arm-unknown-linux-gnueabi/bin/arm-linux-gcc 
-O3 -mcpu=cortex-a8 -mfpu=neon -ftree-vectorize -mfloat-abi=softfp -O3 
-mabi=aapcs-linux -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 --sysroot 
/data/repo/buildroot.git/output/staging/ -shared 
.libs/libgstmad_la-gstmad.o .libs/libgstmad_la-gstid3tag.o 
-lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lxml2 
-lglib-2.0 -lintl -lgsttag-0.10 -lgstaudio-0.10 /usr/lib/libmad.so 
/usr/lib/libid3tag.so -lz  -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
-mabi=aapcs-linux -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
-mabi=aapcs-linux -pthread   -pthread -Wl,-soname -Wl,libgstmad.so 
-Wl,-version-script -Wl,.libs/libgstmad.ver -o .libs/libgstmad.so

/usr/lib/libmad.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status

Again attached buildroot's config file.

-- 
Regards,

Javier Viguera
Software Engineer

Digi International Spain, S.A.
http://www.digi.com
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: br.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100503/b764ac41/attachment-0001.diff>
