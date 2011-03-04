From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Fri, 4 Mar 2011 14:56:28 -0800 (PST)
Subject: [Buildroot] [OT?] Re:  Applying custom kernel patches
In-Reply-To: <4D716A17.1040008@wp.pl>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
	<518665.81144.qm@web161818.mail.bf1.yahoo.com>
	<4D716A17.1040008@wp.pl>
Message-ID: <100123.65141.qm@web161814.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----

> From: W.P. <laurentp@wp.pl>
> To: buildroot at uclibc.org
> Sent: Fri, March 4, 2011 2:39:19 PM
> Subject: [Buildroot] [OT?] Re:  Applying custom kernel patches
> 
> U?ytkownik Steve Calfee napisa?:
> >> From: bruce bushby <bruce.bushby@gmail.com>
> >>     
> >
> >  
> >> I've tried placing my patches  in:
> >>  /opt/buildroot/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
> >>
> >>
> >>  I also tried putting them in
> >>  /opt/buildroot/package/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
> >>
> >>     
> > Hi,
> >
> > You may have a path problem for your  patches. The path should be given in 
>your 
>
> > *_defconfig. 
> >
> >
> > And buildroot will automatically apply patches at the  appropriate time if 
>they 
>
> > are named in the form linux*patch. See the  makefile.
> >
> > so 0001-linux-2.6.38-rc5.patch should be  linux-001-2.6.38-rc5.patch
> >
> > Regards, Steve
> >
> >  
> Could someone write a HOWTO?
> I mean:
> step 0): "I have  kernel.xxx.yy.zzz directory unpacked AND a set of
> patches (that applies  correctly from kernel root) patch.00xx.patch"
> step 1): where should I put  (link?) kernel source?,
> step 2): where should I put patches?.
> step 3): how  do I inform buildroot about patches?
> 
> W.P.

Hi W.P.
Yes, Docs are always nice. For now though from my boards defconfig:

#
# Kernel
#
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_2_6_36=y
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_VERSION="2.6.36.1"
BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/target/device/beagleboard/kernel-patches/"
# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/target/device/beagleboard/beagleboard-linux-2.6.36.1.config"

BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_ZIMAGE is not set

and the files I have put in target/device:


~/buildroot/bbkernel/target/device$ tree beagleboard/
beagleboard/
|-- Config.in
|-- Makefile.in
|-- README
|-- beagleboard-busybox-1.17.x.config
|-- beagleboard-linux-2.6.36.1.config
|-- beagleboard_defconfig
|-- beagleboard_external_toolchain_defconfig
|-- dropbear
|   |-- dropbear_dss_host_key
|   `-- dropbear_rsa_host_key
|-- kernel-patches
|   `-- linux-kernel-2.6.36-bb-xm-usb-pwr.patch
|-- patchrootfs.sh
|-- shadow
`-- skeleton
    `-- etc
        |-- dropbear
        |   |-- dropbear_dss_host_key
        |   `-- dropbear_rsa_host_key
        |-- network
        |   `-- interfaces
        `-- shadow

6 directories, 16 files


You can put these kinds of files anywhere, but it seems to be the natural home 
for board support packages.

Regards, Steve


      
