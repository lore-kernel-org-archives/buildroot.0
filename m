From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Nov 2014 10:42:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-19
In-Reply-To: <20141120073014.164A510107F@stock.ovh.net>
References: <20141120073014.164A510107F@stock.ovh.net>
Message-ID: <20141120084238.GC2220@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Nov 20, 2014 at 08:30:13AM +0100, Thomas Petazzoni wrote:
>       xtensa |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/1a46e53cf892534f1b3a16c249fa710485290b5a/
>          arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/e732d1bac8fe68fd8bba50e4e9d908be3d996c83/

I can't reproduce these build failures here. They seem to happen only on your 
build server. Below are the build log of clamscan link from my machine (after 
adding V=1 to make) that seems to fail on your machine. I don't this anything 
unusual here.

/bin/sh ../libtool  --tag=CC   --mode=link /home/baruch/git/buildroot/output/host/usr/bin/armv5-ctng-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-strict-aliasing   -o clamscan output.o getopt.o optparser.o actions.o misc.o clamscan.o manager.o  ../libclamav/libclamav.la -lpthread 
libtool: link: rm -f .libs/clamscan.nm .libs/clamscan.nmS .libs/clamscan.nmT
libtool: link: (cd .libs && /home/baruch/git/buildroot/output/host/usr/bin/armv5-ctng-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -fno-strict-aliasing -c -fno-builtin "clamscanS.c")
libtool: link: rm -f ".libs/clamscanS.c" ".libs/clamscan.nm" ".libs/clamscan.nmS" ".libs/clamscan.nmT"
libtool: link: /home/baruch/git/buildroot/output/host/usr/bin/armv5-ctng-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -fno-strict-aliasing -o clamscan output.o getopt.o optparser.o actions.o misc.o clamscan.o manager.o  ../libclamav/.libs/libclamav.so -L/home/baruch/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib /home/baruch/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libxml2.so -lbz2 -lssl -lcrypto -lz -lm -ldl -lpthread -Wl,-rpath -Wl,/home/baruch/git/buildroot/output/build/clamav-0.98.4/libclamav/.libs -Wl,-rpath -Wl,/home/baruch/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -Wl,-rpath -Wl,/home/baruch/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib
libtool: link: rm -f ".libs/clamscanS.o"
make[3]: Leaving directory '/home/baruch/git/buildroot/output/build/clamav-0.98.4/clamscan'

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
