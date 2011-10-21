From: vbr vbr <vvvg77@gmail.com>
Date: Fri, 21 Oct 2011 09:29:28 -0700
Subject: [Buildroot] proc not mouning
In-Reply-To: <1D6034426110564DA0DEA9EE9793B383581782088E@NBE-MBX01.americas.swk.pri>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
 <4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
 <4D88F97B.4060605@michaelburghart.de>
 <20110322195502.GA8662@tarshish>
 <4D88FFC6.1010404@michaelburghart.de>
 <20110322200337.GB8662@tarshish>
 <4D8904BF.5060503@michaelburghart.de>
 <4D898F3C.8010603@michaelburghart.de>
 <20110323171608.GC3225@nataf.siach.name>
 <1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
 <1D6034426110564DA0DEA9EE9793B3835817742BC0@NBE-MBX01.americas.swk.pri>
 <20110324195830.5a30d30c@surf>
 <1D6034426110564DA0DEA9EE9793B383581782088E@NBE-MBX01.americas.swk.pri>
Message-ID: <CAOrAeomsFZ_dsJGCYrpH07XoHA9dqCWMQjExsZt5=L5MrynHcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am running into a similar issue when trying to run an i386 image with
ISO9660. Under qemu, it boots up to the point where it constantly complains
about /dev/null and /dev/ttyS0 not being present. I am using the default
inittab.

I have tried using udev, mdev and devtmpfs. The kernel config has these
options:

CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y

Is there a workaround? Maybe creating them manually in inittab?

Thanks
Vincent

On Thu, Mar 24, 2011 at 12:04 PM, Heyendal, Carl <CHeyendal@stanleyworks.com
> wrote:

> > -----Original Message-----
> > From: buildroot-bounces at busybox.net [mailto:buildroot-
> > bounces at busybox.net] On Behalf Of Thomas Petazzoni
> > Sent: March 24, 2011 2:59 PM
> > To: buildroot at busybox.net
> > Subject: Re: [Buildroot] proc not mouning
> >
> > Hello,
> >
> > On Wed, 23 Mar 2011 16:35:16 -0400
> > "Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:
> >
> > > I was originally generating the root filesystem as a cpio archive and
> > > using that to populate my SD card. Later on, as a build optimization,
> > > I disabled generating rootfs.cpio at the top level Buildroot
> > > menuconfig. Instead I started copying 'output/target/*' over to my SD
> > > card. That's when the trouble began I guess. I switched back to using
> > > rootfs.cpio to populate the SD card and I no longer have the
> > > problem. :-)
> >
> > >From the Buildroot documentation at
> > http://buildroot.org/downloads/buildroot.html :
> >
> >  target/ which contains almost the complete root filesystem for the
> >  target: everything needed is present except the device files in /dev/
> >  (Buildroot can't create them because Buildroot doesn't run as root and
> >  doesn't want to run as root). Therefore, this directory should not be
> >  used on your target. Instead, you should use one of the images built
> > in
> >  the images/ directory. If you need an extracted image of the root
> >  filesystem for booting over NFS, then use the tarball image generated
> >  in images/ and extract it as root.
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> Thanks for the RTFMS. :-)
>
> /carl h.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111021/14b9ff72/attachment-0001.html>
