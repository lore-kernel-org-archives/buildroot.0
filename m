From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jun 2012 10:37:29 +0200
Subject: [Buildroot] [PATCH resend] owl-linux: new package
In-Reply-To: <CAHt8ZCOE0ZfTQh2kw54YCEhS3tUSUSGVP9dAoQc8K31r2=4wyg@mail.gmail.com>
References: <1340651389-7856-1-git-send-email-spdawson@gmail.com>
 <20120626093557.2de31adb@skate>
 <CAHt8ZCOE0ZfTQh2kw54YCEhS3tUSUSGVP9dAoQc8K31r2=4wyg@mail.gmail.com>
Message-ID: <20120626103729.4b0fbffd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 26 Jun 2012 09:07:46 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> > Maybe group the ARM9 and EABI checks into one comment? And maybe make
> > it visible only on ARM?
> >
> > comment "owl-linux is only supported on ARM9 architecture with EABI"
> > ? ? ? ?depends on !(BR2_arm920t || BR2_arm922t || BR2_arm926t) || !BR2_ARM_EABI
> > ? ? ? ?depends on BR2_arm
> >
> > or something like that.
> 
> Good idea; I will do this.

Thanks!

> > At some point in the discussion, it was mentioned that this driver
> > might only work with one particular CodeSourcery toolchain, which would
> > suggest that it uses the C library, and therefore contain userspace
> > code. But here you're only installing the kernel module itself. Could
> > you clarify this point, just for our (my?) knowledge?
> 
> I'm using the Buildroot-generated uClibc-based toolchain, and have had
> no problems so far. The kernel module installed by this package is all
> that is required to make the H&D Wireless hardware work.

Ok, if there's only kernel code, then I guess the only problem is the
ABI, which you've already handled by requiring EABI, so that looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
