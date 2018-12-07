From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 7 Dec 2018 08:18:52 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-06 (uboot-tools failure)
In-Reply-To: <20181207070029.B5B1C20DC0@mail.bootlin.com>
References: <20181207070029.B5B1C20DC0@mail.bootlin.com>
Message-ID: <CANQCQpY39H28vJbNre8UYMbYJZ9W=cpXethi1kaLNYCTd2GN4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Arnout/Peter,

On Fri, Dec 7, 2018 at 1:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2018-12-06, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>          arm |            uboot-tools-2018.07 | http://autobuild.buildroot.net/results/e8849ad00542f94efa21efd1888ab53ddd9cae73

  HOSTCC  tools/lib/libfdt/fdt_region.o
  HOSTLD  tools/mkenvimage
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.3.0/libgcc.a(_dvmd_lnx.o):
In function `__aeabi_idiv0':
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/output/build/host-gcc-final-7.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1545:
undefined reference to `raise'
collect2: error: ld returned 1 exit status
make[2]: *** [tools/mkenvimage] Error 1

Seems to be this issue
https://www.openwall.com/lists/musl/2018/05/09/1

Any theories as to why this started failing mid Oct before I start
looking?  (http://autobuild.buildroot.net/?reason=uboot-tools-2018.07)

Matt
