From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 13:42:40 +0100
Subject: [Buildroot] [PATCH 5/8] mv-ddr-marvell: new package
In-Reply-To: <20171203214811.3124-6-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:08 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-6-thomas.petazzoni@free-electrons.com>
Message-ID: <87r2s5z8zj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Sergey Matyukevich <geomatsi@gmail.com>
 > This package adds Marvell Armada SoC DDR training algorithms.
 > This code is not built separately, it is needed as dependency
 > to build ATF firmware for Marvell Armada SoCs.

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 > [Thomas:
 >  - Remove MV_DDR_MARVELL_SRC_SYMLINK, ATF will directly pick up the
 >    mv-ddr-marvell code from where it is.
 >  - Use "mv-ddr-marvell" as the Config.in prompt, and in the comment
 >    header of the .mk file.
 >  - Add upstream URL in Config.in help text
 >  - Adjust license information.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  DEVELOPERS                              |  1 +
 >  boot/Config.in                          |  1 +
 >  boot/mv-ddr-marvell/Config.in           | 10 ++++++++++
 >  boot/mv-ddr-marvell/mv-ddr-marvell.hash |  2 ++
 >  boot/mv-ddr-marvell/mv-ddr-marvell.mk   | 12 ++++++++++++
 >  5 files changed, 26 insertions(+)
 >  create mode 100644 boot/mv-ddr-marvell/Config.in
 >  create mode 100644 boot/mv-ddr-marvell/mv-ddr-marvell.hash
 >  create mode 100644 boot/mv-ddr-marvell/mv-ddr-marvell.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index c44e8aee50..9d114b5a29 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1508,6 +1508,7 @@ F:	package/lua-resty-http/
 >  F:	package/mpir/
 
 >  N:	Sergey Matyukevich <geomatsi@gmail.com>
 > +F:	boot/mv-ddr-marvell/
 >  F:	board/linksprite/pcduino
 >  F:	board/orangepi/orangepi-zero
 >  F:	board/orangepi/orangepi-one
 > diff --git a/boot/Config.in b/boot/Config.in
 > index 2f46c8546e..3950c49524 100644
 > --- a/boot/Config.in
 > +++ b/boot/Config.in
 > @@ -10,6 +10,7 @@ source "boot/boot-wrapper-aarch64/Config.in"
 >  source "boot/grub2/Config.in"
 >  source "boot/gummiboot/Config.in"
 >  source "boot/lpc32xxcdl/Config.in"
 > +source "boot/mv-ddr-marvell/Config.in"
 >  source "boot/mxs-bootlets/Config.in"
 >  source "boot/s500-bootloader/Config.in"
 >  source "boot/syslinux/Config.in"
 > diff --git a/boot/mv-ddr-marvell/Config.in b/boot/mv-ddr-marvell/Config.in
 > new file mode 100644
 > index 0000000000..6cf6eec9ae
 > --- /dev/null
 > +++ b/boot/mv-ddr-marvell/Config.in
 > @@ -0,0 +1,10 @@
 > +config BR2_TARGET_MV_DDR_MARVELL
 > +	bool "mv-ddr-marvell"
 > +	depends on BR2_aarch64
 > +	help
 > +	  Marvell keeps algorithms for DDR training in a separate
 > +	  repository. This code is not built separately, it is needed
 > +	  as dependency to build ATF firmware for Marvell Armada 7040

s/as/as a/

I wonder if it would make sense to  depend or / select atf, but I've
left it as is for now and committed, thanks.

-- 
Bye, Peter Korsgaard
