From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Sep 2011 09:18:42 +0200
Subject: [Buildroot] [git commit] initramfs: fix boot with dynamic /dev
In-Reply-To: <201108240953.23168.arnout@mind.be>
References: <20110720150418.E95188B391@busybox.osuosl.org>
 <201108240953.23168.arnout@mind.be>
Message-ID: <20110901091842.784dbcf3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 24 Aug 2011 09:53:22 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  I now switched to a cpio that I use as an initrd and of course I
> encounter the same issue...

Ah, yes, of course.

>  So we can do the same thing for cpio archives.  Then I have two
> issues:
> 
>  - Are cpio archives used for something else than initrd?

I don't think so. I would say that we can assume that cpio archives are
always used for initramfs.

>  - Clearly this should be refactored so we don't duplicate the same
> stuff in initramfs.mk and cpio.mk.

In fact I think the initramfs.mk and cpio.mk should be merged. Instead
of having initramfs.mk generating the "initramfs file list", we could
just have cpio.mk generate the cpio archive and then have the kernel
configuration tuned to include this cpio archive as an initramfs. I
haven't thought too much about the details of this but I remember we
already discussed this in the past and it's probably doable.

>  Given that /init is only used in initramfs situations, why don't we
> create it unconditionally as part of the .root skeleton?  OK, it adds
> 4K to the ext2fs but that shouldn't be the issue, right?

Well, I'd prefer to keep it for the initramfs situation only. Not
because of the size, just for the sake of cleanliness and clarity.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
