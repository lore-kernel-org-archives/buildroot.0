From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 15:09:41 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <a3f603da-9f1f-12ee-01cf-d9ef0509ad26@mind.be>
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
 <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
 <0391e860-5605-1942-28b0-5fa87f51c018@gmail.com>
 <a3f603da-9f1f-12ee-01cf-d9ef0509ad26@mind.be>
Message-ID: <20180730150941.2baf8b50@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 May 2018 00:08:56 +0200, Arnout Vandecappelle wrote:

> > 0002-arm-softfloat-libgcc.patch was added in 2007 [1] for gcc 4.1.2.
> > I believe arm soft-float should work out of the box now.  
> 
>  The patch refers to https://sourceware.org/ml/crossgcc/2008-05/msg00009.html
> which says "Unfortuantely, arm-gcc defaults to generating code for armv5t."
> Since we always explicitly pass the target CPU for ARM, the default CPU
> shouldn't matter. So, again, a runtime qemu-user test for arm920t would confirm
> that the patch isn't needed.
> 
> 
>  If both patches are indeed unneeded, I'd only remove them for GCC 8, not the
> earlier ones. They're not really hurting the earlier versions at the moment.
> 
>  By the way, I think patch 0003 can also be removed. We only need it because we
> exclude the testsuite in the extraction, to save 252MB of disk space (reducing
> the build directory size from 850 to 600MB). I don't think it's worthwhile
> carrying a patch just for that. Also, since GCC 7, the libjava directory no
> longer exists. So I'd just eliminate that HOST_GCC_EXCLUDES. Thomas, you added
> this feature back in 00e9b1e4f7, what do you think?

No strong feeling about it. It's still 250 MB of saved disk space, and
also the time of extraction (doubled, once for gcc-initial, once for
gcc-final). Back then, I was on a quest trying to reduce the build
time, and this was part of it. There is obviously a trade off between
efficiency and ease of maintenance here, and whether those tweaks are
useful enough to warrant the additional maintenance burden, I don't
know.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
