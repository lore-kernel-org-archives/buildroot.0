From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 07:52:40 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <e3cfa132-94c0-2b3d-7593-3286bab1e535@mind.be>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be>
 <572AEB2E.1050305@gmail.com> <572AFC1F.3070004@gmail.com>
 <20160505142533.67f8e473@free-electrons.com>
 <572D9A1E.20609@gmail.com>
 <e3cfa132-94c0-2b3d-7593-3286bab1e535@mind.be>
Message-ID: <20160508075240.142f5f78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 May 2016 01:41:37 +0200, Arnout Vandecappelle wrote:

> > I've just seen bluez5 requires glibc or musl toolchain.
> > I tried to rebuild all with glibc (instead of uClibc) but the RPi3 refuses to
> > boot due to a kernel panic.  
> 
>   Please use a serial port for debugging: the screenshot isn't really readable, 
> and the interesting part has probably scrolled off-screen.
> 
>   However, it's extremely unlikely that changing uClibc to glibc would cause a 
> kernel panic, because the kernel isn't using libc. So you have probably 
> inadvertedly changed something else as well.

If you look at the kernel panic from the screenshot (I was able to read
it), it says that init was killed, i.e that the kernel couldn't run it
init. So uClibc vs. glibc could definitely make a difference here.

Marco: could you upload online the tarball image of your root
filesystem, so that we can have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
