From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Thu, 2 May 2013 09:02:18 -0700
Subject: [Buildroot] Buildroot + CoudeSourcery 2012.09
In-Reply-To: <20130502115358.7de0cc20@skate>
References: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
 <20130502115358.7de0cc20@skate>
Message-ID: <0ad466f5-7656-47de-8365-dbf01f4cb107@CH1EHSMHS011.ehs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 02, 2013 at 11:53:58AM +0200, Thomas Petazzoni wrote:
> Dear S?ren Brinkmann,
> 
> On Wed, 1 May 2013 15:03:16 -0700, S?ren Brinkmann wrote:
> 
> > I recently encountered some weird behavior, and couldn't really find
> > anything about it.
> > 
> > When I compile a rootfilesystem with CS2012.09 it looks like globbing
> > is broken, resulting in init scripts are not executed.
> > 
> > Using CS2012.03 and older works fine.
> 
> I guess you're talking about ARM ? We don't have support for CS
> ARM 2012.09 in Buildroot because it's known to miscompile the Linux
> kernel.
Yes it's ARM.
I can compile the kernel just fine with it. Though, I had to cherry-pick
a commit to fix breakage with GCC 4.7.2. Commit 'ARM: 7668/1: fix
memset-related crashes caused by recent GCC (4.7.2) optimizations'
(sha1: 455bd4c430b0c0a361f38e8658a0d6cb469942b5).

> 
> So it seems like this toolchain has problems. I think the kernel
> problem has been reported to Mentor Graphics, but nothing happened.
It's kinda weird. When I use hush it works. So it looks like some
weirdness going on with ash and something in the toolchain.
Google just found some >10 year old issue which seems similar to mine
today. I wonder if that got reintroduced somehow.

	Thanks,
	S?ren
