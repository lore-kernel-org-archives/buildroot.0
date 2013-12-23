From: Pierre Ficheux <pierre.ficheux@openwide.fr>
Date: Mon, 23 Dec 2013 16:08:18 +0100 (CET)
Subject: [Buildroot] Booting problem for Beaglebone
In-Reply-To: <52565A42.1080707@univ-st-etienne.fr>
Message-ID: <800187025.16985041.1387811298810.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I still have the same problem with recent BR (2013.11 or Git) and Beaglebone Black (waiting for root device)

[    4.690564]      host=10.5.16.129, domain=daviel.openwide.fr., nis-domain=(none)
[    4.698407]      bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
[    4.704779]      nameserver0=10.5.1.1[    4.712875] Waiting for root device /dev/mmcblk0p4...



Any idea?

Thx by advance



----- Mail original -----
> De: "AUBERT alain" <alain.aubert@univ-st-etienne.fr>
> ?: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Cc: buildroot at busybox.net
> Envoy?: Jeudi 10 Octobre 2013 09:41:54
> Objet: Re: [Buildroot] Booting problem for Beaglebone
> 
> Dear Thomas
> 
> You find in attached file the buildroot  .config file
> 
> Best regards
> 
> Alain
> 
> 
> 
> 
> 
> Le 09/10/2013 17:36, Thomas Petazzoni a ?crit :
> > Dear AUBERT alain,
> >
> > On Wed, 09 Oct 2013 17:15:13 +0200, AUBERT alain wrote:
> >
> >> We have already done all steps of the building as you indicated in
> >> your mail
> >>
> >> The 2 partitions are visible in Uboot with correct pararmeters.
> >> We have done fatls mmc 0:1 and ext2ls mmc 0:2 to see the contents
> >>
> >> Moreover, we have done the same operation with buildroot 2012.05
> >> and the
> >> beaglebone board works fine
> >>
> >> It seems that the problem comes from the use of Flattened devices
> >> tree
> >> in the new version of buildroot
> >>
> >> You can find the bootlog in the attached file
> > I am not following closely the BeagleBone kernels, but from the
> > boot
> > log it seems like the MMC card is not detected. Several
> > possibilities:
> >
> >   * The MMC support is not enabled in the kernel configuration, or
> >   the
> >     proper MMC driver.
> >
> >   * The MMC device is not described in the Device Tree and/or the
> >     support for MMC on this platform is not available.
> >
> > The version of the kernel being displayed is just 3.8.11, which
> > indicates a mainline kernel (which doesn't support MMC on AM335x,
> > as
> > far as I know). However, our beaglebone_defconfig uses a TI custom
> > kernel, which I believe, should show probably show a different
> > kernel
> > version than just 3.8.11.
> >
> > Can you send us your Buildroot .config file?
> >
> > Best regards,
> >
> > Thomas
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Pierre FICHEUX -/- CTO OW/OWI, France -\- pierre.ficheux at openwide.fr
                                         http://ingenierie.openwide.fr
                                         http://www.linuxembedded.fr
I would love to change the world, but they won't give me the source code
