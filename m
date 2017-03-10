From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 10:23:54 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <20161126085144.GA23223@waldemar-brodkorb.de>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
Message-ID: <20170310102354.6cb110c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 09:51:44 +0100, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
>   http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79
> 
> Requires this as prerequisite:
> http://patchwork.ozlabs.org/patch/683830/
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

We've added -fno-dwarf2-cfi-asm to 4 packages so far, and it seems to
have fixed the problem. So I would for now prefer to keep this as it is
today, and not use the wrapper to pass this flag to all packages.

I'll mark your patch as Rejected in patchwork, since it anyway cannot
be applied because Arnout patches have not been merged.

Let me know if you disagree, of course.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
