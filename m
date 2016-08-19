From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 19 Aug 2016 17:48:45 +0000
Subject: [Buildroot] Analysis of build results for 2016-08-17
In-Reply-To: <20160818231053.37c1b26b@free-electrons.com>
References: <20160818063027.302C6102F5A@stock.ovh.net>
 <20160818231053.37c1b26b@free-electrons.com>
Message-ID: <1471628924.31233.27.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

On Thu, 2016-08-18 at 23:10 +0200, Thomas Petazzoni wrote:
> > ?????????arc |??????????????????clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/8b7767c01cf1b578d5fc14d
> > c74cfaf9a038f7228/
> /home/buildroot/autobuild/run/instance-2/output/build/clapack-3.2.1/SRC/dlasd1.c: In function 'dlasd1_':
> /home/buildroot/autobuild/run/instance-2/output/build/clapack-3.2.1/SRC/dlasd1.c:288:1: internal compiler error: in
> arc_ifcvt, at config/arc/arc.c:8429
> 
> Vlad, Alexey ?
> > 
> > ?????????arc |?????????????????coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/5730d7ccd6cf19bc395bdcb
> > cb663516afa3e4d92/
> src/tr.c: In function 'single_binary_main_tr':
> src/tr.c:1947:1: error: insn does not satisfy its constraints:
> 
> Another ARC toolchain issue. Vlad, Alexey ?


> > ????????m68k |???????????????????ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/cb1ec52e6f322372f447699
> > 2a4622345917c5617/
> > ?????????arc |???????????????????ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/831f3e32be7ab0c0978bb81
> > cf1e40185d7bb5298/
> > ????????m68k |???????????????????ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/8c09ca6b57375b114ebf88e
> > f7f3b3f04e57ca1f8/
> > ?????????arc |???????????????????ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/6a5da21a39a04662ed9a692
> > 63795691fae1e9922/
> > ?????????arc |???????????????????ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/f00a6c59723ee0758140fcb
> > 668144ff5db5f681a/
> The m68k problem is:
> 
> ?CC	libavcodec/opus_silk.o
> /tmp/ccsdGWKf.s: Assembler messages:
> /tmp/ccsdGWKf.s:48484: Error: value -32780 out of range
> 
> Waldemar ?
> 
> The ARC problem is:
> 
> libavcodec/vc1_pred.c: In function 'ff_vc1_pred_b_mv':
> libavcodec/vc1_pred.c:882:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:8429
> 
> Vlad, Alexey ?
> ? ? ? ? ?arc |???????????????????libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/1bc47ee8622c25a67908ba5
> > ?> 25335e45dc8163c67/
> > ?Another ARC toolchain issue:
> > ?
> > ?iso9660.c: In function 'strip_trail':
> > ?iso9660.c:157:1: internal compiler error: in arc_legitimize_pic_address, at config/arc/arc.c:5032
> > ?


Seems like all these failures happens due to the same toolchain issue our team working at. We will send a patch when the
problem is solved. We hope it will happen soon =)

Also I send two patches that fixes another issues:
1)?https://patchwork.ozlabs.org/patch/660918/
This patch fixes binutils failure:
> ? ? ? ? ?arc |????binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/00455b6a8324920ad843d90ce
> 0413451522691a8/

2)?https://patchwork.ozlabs.org/patch/660917/
And this one is for Qt4:
http://autobuild.buildroot.net/results/541/54172d55f39b2fcfa5b7fb4d4ee01566678babbc//


Thank you!

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
