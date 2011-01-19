From: Will Moore <will.moore@beraninstruments.com>
Date: Wed, 19 Jan 2011 10:07:46 -0000
Subject: [Buildroot] bug when doing clean kernel build?
In-Reply-To: <AANLkTikJiXF-w3baF2POeVr5Zh_sGUkdS+UQCQFmzb4g@mail.gmail.com>
References: <AANLkTikJiXF-w3baF2POeVr5Zh_sGUkdS+UQCQFmzb4g@mail.gmail.com>
Message-ID: <F25ADE2AF76246FD958773C4133D8E24@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kyle,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
> On Behalf Of Kyle Hayes
> Sent: 17 January 2011 21:01
> 
> I'm not sure if this is a code bug or a user bug :-)
> 
> I'm trying to repeat my problems with openssh segfaulting and to do
> that I'm trying to build with make xconfig; make clean; make.
> However, when I do this, I see that the Linux kernel, 2.6.37, is made
> with Pentium Pro selected and I explicitly selected i486 in the
> Buildroot config.  I can go in after the make finishes and reconfigure
> the kernel again to get the right processor type.  Is this expected
> behavior?

FWIW I believe configuring buildroot with i486 processor builds you a
toolchain for an i486.  A i486 toolchain seems to work well for me on a
vortex86dx.

I tend to configure buildroot to pick up a kernel config:

 make menuconfig

Select "Kernel" then "Linux Kernel".
Select "Kernel configuration (Using a defconfig)" and select "Using a custom
config file".
Select "() Configuration file path" and enter the path to your desired
kernel config.

Others with a better understanding can tell you if what you are experiencing
might be considered a bug...

X-Linux provided kernel configs changed (quite considerably) between v5.6
and v5.7 as to quite what processor / processor features they declare the
vortex86dx to have, the same may be true for the vortex86mx.  Perhaps you
can gain some understanding from a diff of these?

Regards,

Will

> 
> Best,
> Kyle
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
