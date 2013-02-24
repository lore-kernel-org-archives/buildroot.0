From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 18:26:20 +0100
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5126AC9B.30302@mind.be>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com>
 <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com> <5126A675.2060308@mind.be>
 <5126A8C7.2000009@petroprogram.com> <5126AC9B.30302@mind.be>
Message-ID: <20130224182620.2283ceb3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 22 Feb 2013 00:24:11 +0100, Arnout Vandecappelle wrote:

> > What you mean that mdev or udev does not create device nodes ???
> > If older kernels don't support devtmpfs like Baruch
> > said then who does that device node creation if not the mdev or udev
> > when event happens ???
> 
>   Well, nobody...
> 
>   Turns out that mdev still does device node creation. Makes me
> wonder if I'm not mistaken about udev as well... I just remember
> hearing that device node creation was removed when DEVTMPFS was
> introduced.

Yes, I think you got the thing wrong: udev and mdev are still creating
the device nodes. Of course, they might have already been created by
devtmpfs, but I don't think it is a requirement. At least, devtmpfs is
definitely not a requirement for mdev to work (except in Buildroot, in
which we made the decision that if mdev is to be used, then devtmpfs
support must be there).

> >>   That said, you can create custom mdev/udev rules to create device
> >> nodes. But it's all manual - and much simpler to just create the
> >> device nodes manually.
> >>
> >
> > for mdev it's just a single file, /etc/mdev.conf (I can even
> > copy-paste it here, it's not that long and will cover 99% of needs).
> 
>   Yes, but that file just specifies the chmod/chown rules, not how to 
> create the device nodes. But as I just saw in the code, mdev does in
> fact create the device nodes.

udev can also create symbolic links to device files based on custom
rules, or other funky things.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
