From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 28 Apr 2012 14:48:27 +0000 (UTC)
Subject: [Buildroot] [OT] How to get rootfs.cpio combined with a kernel?
References: <jn3vnk$go5$1@dough.gmane.org> <201204272212.07280.arnout@mind.be>
Message-ID: <jngvvq$m1a$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-27, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Monday 23 April 2012 18:24:20 Grant Edwards wrote:

>>[...]
>> 
>> Any pointers to documentation on how one might combine a kernel object
>> and a rootfs cpio image to get a uImage file?
>
>  Short answer: the kernel build system doesn't support it.

That's pretty much what I had concluded. 

>  Long answer: the initramfs is compiled into one of the many builtin.o
> files that are created all over the place.  This is linked into vmlinux.
> See "Build vmlinux" in the top-level Makefile of the kernel.
>
>  The good thing is that the command to build vmlinux is stored in
> .vmlinux.cmd, so you can use that to re-run the link - but you'd have
> to keep all the individual built-in.o files of course.  The bad
> thing, however, is that this is not the end.  You probably want to
> create a bzImage or similar, which is an additional,
> architecture-specific linking step.
>
>  Conclusion: unless you're willing to spend a lot of effort on this,
> you're better off to either keep the compiled kernel tree for linking
> with the rootfs, or using a separate kernel and rootfs image.

I was reluctant to do that because I wanted to distribute them as a
single uImage and store them in a single flash partition.  But...

> If you're using U-Boot, you can even combine them in one uImage.

That's something I hadn't discovered, and I think that is the right
answer: build the kernel and rootfs separately, and then combine them
into a single uImage for installation in flash in booting by U-Boot.
I'll study the U-Boot docs...

Thanks!

-- 
Grant
