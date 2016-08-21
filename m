From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 21 Aug 2016 09:42:37 +0300
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <20160820000709.0ceef3cd@free-electrons.com>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
Message-ID: <20160821064237.h2d5u7hei3h6qghg@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Aug 20, 2016 at 12:07:09AM +0200, Thomas Petazzoni wrote: 
> >     mips64el |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/01317aeaff7d127a05e0488a51e81f2d43750687/
> 
> /home/buildroot/build/instance-1/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libz.a(zutil.o): In function `zcalloc':
> zutil.c:(.text+0x48): multiple definition of `zcalloc'
> /home/buildroot/build/instance-1/output/build/quagga-1.0.20160315/lib/.libs/libzebra.a(memory.o):memory.c:(.text+0x1a0): first defined here
> collect2: error: ld returned 1 exit status
> 
> Should not be too difficult to fix. Gustavo? Or Baruch maybe?

Should be fixed by http://patchwork.ozlabs.org/patch/661213/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
