From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Thu, 8 Mar 2012 09:53:13 +0000
Subject: [Buildroot] BR 2012.rc1 :: DVI not activated on pandaboard?
In-Reply-To: <20120308092159.5af7ce23@skate>
References: <CAPEB33z8LrFWaQdwVA1XdSjKFWam9kTH2FO8CvkWdnj9U_7vzA@mail.gmail.com>
 <20120308092159.5af7ce23@skate>
Message-ID: <CAPEB33xVgy=UvvH8_vQtoVByWSM-VuOp1AX_Mo_UTFrZAt3NXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You are right, just checked it on console mode only and it doesn't boot
anymore. I've changed from a 3.0.2 to a 3.2.7 kernel version? I am going to
check this to make sure kernel version has nothing to do with that?
For those questions, related to kernel stuff, I will post to the right
forum.
 thanks

On 8 March 2012 08:21, Thomas Petazzoni <thomas.petazzoni@free-electrons.com
> wrote:

> Hello,
>
> Le Wed, 7 Mar 2012 23:16:21 +0000,
> MERCADIER Johann <johann.mercadier@imerir.com> a ?crit :
>
> > mmc rescan
> > fatload mmc 0:1 0x80000000 uImage
> > setenv bootargs vram=32M console=ttyO2,115200n8
> > mem=456M at 0x80000000mem=512M at 0xA0000000 omapdss.def_disp=dvi
> > omapfb.mode=dvi:1280x1024MR-24 at 60smsc95xx.macaddr=76:2F:97:85:4F:56
> > root=/dev/nfs rw
> > nfsroot=192.168.1.44:
> /home/johann/rootfs_TEST,nolock,wsize=1024,rsize=1024
> > ip=192.168.1.235 rootdelay=4 init=/linuxrc
> > bootm 0x80000000
> >
> > when booting I get there, the pandaboard probably still continue the boot
> > process but nothing is displayed on the monitor?...
> > ___[ MINICOM O/P
> >
> ]________________________________________________________________________________________
> > ...
> >    Verifying Checksum ... OK
> >    Loading Kernel Image ... OK
> > OK
> >
> > Starting kernel ...
> >
> > Uncompressing Linux... done, booting the kernel.
>
> If you don't have the kernel messages after this, then it means that
> something is wrong in your configuration. Don't expect to see anything
> on the video output before you get your kernel to boot properly, i.e to
> display messages on the serial console after "Uncompressing Linux...
> done, booting the kernel".
>
> However, this discussion is really not Buildroot-specific, it is really
> about configuring a kernel for a particular hardware platform, so you
> should probably rather ask in support places (forums, mailing lists,
> etc.) that are related to this particular piece of hardware.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120308/1a6f33ab/attachment.html>
