From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:22:53 +0100
Subject: [Buildroot] [PATCH] gcc: Use upstream GCC 7.2 for ARC
In-Reply-To: <20171109215648.15975-1-abrodkin@synopsys.com>
References: <20171109215648.15975-1-abrodkin@synopsys.com>
Message-ID: <20171129232253.007d1550@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Nov 2017 00:56:48 +0300, Alexey Brodkin wrote:
> It turned out with vanilla upstream GCC 7.2 stuff could be built
> for ARC, what's more we may even build Linux kernel with rootfs
> and get it all running perfectly fine so why not use that?
> 
> Essentially GCC from SNPS GitHub still has a lot of fixes and improvements
> most of which will be a part of the next upstream release but let's see
> how it goes and if we see vanilla GCC doesn't require way too many
> back-ported patches we'll be able to get rid of SNPS GitHub here at all.
> 
> As of today the only really required back-port is the one for non-uClibc
> libc.
> 
> Back-ported from upstream master with help of:
> -------------------->8--------------------  
> git format-patch 927c0132251f -1 -- . ':!gcc/ChangeLog' ':!libgcc/ChangeLog'
> -------------------->8--------------------  

Applied to next after tweaking the commit log and commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
