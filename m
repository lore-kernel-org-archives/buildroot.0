From: William Welch <bvwelch@gmail.com>
Date: Sat, 21 Feb 2015 16:31:21 -0600
Subject: [Buildroot] trouble configuring for beaglebone black and
 external Linaro toolchain, 2015.02-rc2
In-Reply-To: <20150221232708.19c7f576@free-electrons.com>
References: <CAPALihNuWHDrxf=RcinmAGcx-zchGh=--L209e__O7e+BRpT2w@mail.gmail.com>
 <20150221232708.19c7f576@free-electrons.com>
Message-ID: <CAPALihMRa3w2S6t_xtq=0LwtPk4wn-GUVLGSUADz-n7kn3Ja1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

OK,

thank you,

William

(many lines downloading the toolchain deleted...)

2015-02-21 13:11:49 (1.50 MB/s) -
?/home/bwelch/svn/nm-plus/unfuddle/pluslocation_res/trunk/productionfs/buildroot/buildroot/output/build/.gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz.yCmDiD/output?
saved [51278488/51278488]

gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz: OK (sha256:
0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891)
[7m>>> toolchain-external undefined Extracting[27m
mkdir -p
/home/bwelch/svn/nm-plus/unfuddle/pluslocation_res/trunk/productionfs/buildroot/buildroot/output/host/opt/ext-toolchain
xzcat
/home/bwelch/svn/nm-plus/unfuddle/pluslocation_res/trunk/productionfs/buildroot/buildroot/dl/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
| tar --strip-components=1 --exclude='usr/lib/locale/*' -C
/home/bwelch/svn/nm-plus/unfuddle/pluslocation_res/trunk/productionfs/buildroot/buildroot/output/host/opt/ext-toolchain
 -xf -
[7m>>> toolchain-external undefined Patching[27m
[7m>>> toolchain-external undefined Configuring[27m
/home/bwelch/svn/nm-plus/unfuddle/pluslocation_res/trunk/productionfs/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-linux-gnueabihf/4.9.2/cc1:
error while loading shared libraries: libz.so.1: cannot open shared object
file: No such file or directory
Incorrect ABI setting: EABIhf selected, but toolchain is incompatible
make: ***
[/home/bwelch/svn/nm-plus/unfuddle/pluslocation_res/trunk/productionfs/buildroot/buildroot/output/build/toolchain-external-undefined/.stamp_configured]
Error 1


On Sat, Feb 21, 2015 at 4:27 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear William Welch,
>
> On Sat, 21 Feb 2015 13:23:09 -0600, William Welch wrote:
>
> > Thank you for all the great work you are doing in buildroot.
> >
> > I first built a system using the beaglebone_defconfig, and the make went
> > fine.  But when I try to select the external linaro toolchain, the make
> > fails-- EABIhf selected, but toolchain is incompatible...
> >
> > Steps to repeat:
> >
> > make beaglebone_defconfig
> > make menuconfig
> >    choose external, and it will automatically choose Linraro ARM 2014.09
> > make
> > It will download the toolchain
> > -- gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
> > but then fail while configuring the toolchain.
> >
> > What am I missing here?
>
> Please post the latest ~200 lines of the build output. Otherwise, we
> have no idea what your failure is.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150221/2fa5c187/attachment.html>
