From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 8 Dec 2011 08:27:01 -0600
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <4EE09ED3.5060102@neotion.com>
References: <4EDE32C3.7020400@neotion.com>
 <87pqfzbaq9.fsf@macbook.be.48ers.dk> <4EE09ED3.5060102@neotion.com>
Message-ID: <201112080827.03828.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu December 8 2011, Emmanuel BOUAZIZ wrote:
> 
> On 12/08/2011 11:48 AM, Peter Korsgaard wrote:
> 
> >  Emmanuel> The only remaining problem is that the whole filesystem is
> >  Emmanuel> read-only despite the 'rw' including /var and /tmp.
> > 
> > That's because you're using squashfs. Squashfs is a readonly
> > filesystem. Either move to initramfs or use ext2 in your initrd.
> > 
> 
> > /tmp should be a tmpfs though (check /etc/fstab), and most of /var
> > symlinks to /tmp/.
> > 
> 
> Oh that's rigth, it's writable, I mixed with another directory that I wanted to write to (/usr/local). I mounted it as
> tmpfs too and everything's fine now. Thanks a lot for your help :)
> 
> Well, I'll switch back to initramfs anyway since it's less tricky.
>

You do not have to put your entire run-time file system in the initramfs,
only what you need to establish the full run-time file system.
I.E: Your full run-time file system can remain as a squashfs file.
You just have to provide the "init" scripting to get it loaded and
mounted while in the early user space of the initramfs.

See: EarlyUserSpace in the kernel documentation tree;
and maybe look at how some "LiveCD" systems handle the setup.

Mike 
> regards,
