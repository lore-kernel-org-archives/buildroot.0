From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 21:26:02 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
Message-ID: <trinity-d7a2b402-806b-4ff1-8f3e-69ce39c68b1c-1426623962608@3capp-gmx-bs62>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, Mar 17, 2015 at 08:59:23PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Tue, 17 Mar 2015 20:52:03 +0100, Peter Seiderer wrote:
> 
> > Will provide a patch for postgresql to check for fork/BR2_USE_MMU, is there any special string
> > for the comment besides 'needs threads'?
> 
> No there is no comment about a BR2_USE_MMU dependency, because it's not
> something the user can "fix" : if your architecture doesn't have a MMU,
> it's like this, there's nothing you can do about it.
> 
> > No special point, had the build environment still from [1] around...
> > 
> > In retrospect (in case bfin is disabled because of fork) the patch subject should
> > have been something different...
> 
> Well, the patch by itself is then completely useless, because Blackfin
> is a noMMU architecture, so postgresql will never work on it.
>

You are right (did not know that the 'uclinux' in 'bfin-buildroot-uclinux-uclibc' stands
for microcontroller Linux/noMMU)...

The only minor purpose leftover is as gcc ICE exampel for 'bfin-uclinux-gcc (ADI-2014R1-RC2) 4.3.5' (see [1])...

Revert the patch or keep it?

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2015-March/121094.html

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
