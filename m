From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 15 May 2008 16:44:54 -0700
Subject: [Buildroot] Encountered BusyBox error during ARM build
In-Reply-To: <2590773a0805151623g1b5fb304v54335ccd92d7da68@mail.gmail.com>
References: <326f33790805151216x655f538fm2d25a5c12af669fc@mail.gmail.com>
	<2590773a0805151623g1b5fb304v54335ccd92d7da68@mail.gmail.com>
Message-ID: <326f33790805151644y43c38a1q2c64de32cfbae948@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

I suspected it had to do with my previous error, but the thing is I had
already done a make clean on BusyBox earlier and found that it did not solve
this problem. I did do a "make distclean", which I believe gets rid of
everything "./configure" has built, but found no success.

Before I do it, do you think I should clean uclibc as well since I did
happen to change LFS in the uclibc menuconfig? Thanks for the help!

On Thu, May 15, 2008 at 4:23 PM, Christopher Taylor <chtaylo3@gmail.com>
wrote:

> This is related to your previous post.  You'll have to do a make clean
> or a make dist-clean inside busybox.
> for you that's
>
> cd /root/buildroot/project_build_arm/uclibc/busybox-1.10.2
> make dist-clean
> cd -
> make
>
> If that doesn't work, write back.
>
> HTH!
> Chris
>
> On Thu, May 15, 2008 at 3:16 PM, Arun Reddy <reddyac@gmail.com> wrote:
> > Hi everyone,
> >
> > Going through the build process for ARM, I have encountered a problem
> with
> > BusyBox which I am not sure if I am isolating correctly. The error is
> > mentioned here:
> >
> > http://img386.imageshack.us/img386/2225/busyboxerrorlb2.jpg
> >
> > It looks like fstat64, lstat64 and stat64 have undefined references,
> which
> > are probably a result of something earlier failing. I was wondering if
> this
> > is a problem with my BusyBox configuration in particular, or is it a
> common
> > problem you guys have encountered when using Buildroot in general? I
> looked
> > online and there was a mention about defining STAT64_SUPPORT, but I found
> no
> > explanation on what it does or where it is located, so I thought I would
> get
> > some clarification here. Thank you!
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080515/4c1e77a2/attachment.htm 
