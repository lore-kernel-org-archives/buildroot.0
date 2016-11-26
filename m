From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:12:25 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <c7f2be5d-3849-d30b-bf39-731477bc1927@mind.be>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
 <20161126145224.2aa5ef33@free-electrons.com>
 <c7f2be5d-3849-d30b-bf39-731477bc1927@mind.be>
Message-ID: <20161126151225.1eeaff6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 14:59:34 +0100, Arnout Vandecappelle wrote:

> > Hum, thanks but this patch you're pointing to is really material for
> > next at this point, so I cannot apply your patch, which should be
> > applied on master in order to fix the autobuilder issues.  
> 
>  Begging to differ: doing the same without patch 683830 would be a much bigger
> patch (adding yet another -D option to the wrapper, updating the wrapper
> itself). But OK, it's getting a bit later to still take _any_ risk, so probably
> the bigger patch is better.

That's my point: that late in the cycle, I don't want to touch too
many things around the toolchain wrapper. So adding one more CFLAGS or
LDFLAGS specific to m68k is OK (worst thing is a regression on m68k,
which probably isn't very widely used). But a change that touches the
toolchain wrapper, and can potentially break major architectures, I'm
not a big fan.

If nobody provides the bigger patch, I think I'm going to live with the
m68k autobuilder failures until the release, and merge afterwards.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
