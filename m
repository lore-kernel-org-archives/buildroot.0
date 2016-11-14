From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 14 Nov 2016 17:26:53 +0000
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.8.6 in
 synopsys defconfigs
In-Reply-To: <20161114171516.GB3399@free.fr>
References: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
 <20161111151832.1649d24e@free-electrons.com>
 <1479126748.3874.28.camel@synopsys.com>
 <20161114150740.394bdd02@free-electrons.com>
 <1479133987.4408.48.camel@synopsys.com>
 <20161114154211.66ff86bf@free-electrons.com>
 <1479134749.4408.54.camel@synopsys.com> <20161114171516.GB3399@free.fr>
Message-ID: <1479144361.4408.75.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, 2016-11-14 at 18:15 +0100, Yann E. MORIN wrote:
> Alexey, All,
> 
> On 2016-11-14 14:46 +0000, Alexey Brodkin spake thusly:
> [--SNIP--]
> > 
> > The point is we were sitting on the patch for quite some time and when we saw
> > RC1 was cut (as always unexpectedly :)) simply sent out what we had in our tree.
> 
> "Unexpectedly" is a bit of untrue: we've been doing releases every three
> months since February 2009, 7 years ago, with a one-month freeze before
> the release.
> 
> So, anything that comes on-or-after the first day of the release month is
> not guaranteed to go in master, unless it is a fix.
> 
> This is far from "unexpected". ;-)

I think you understood my sarcasm.

Frankly on my first submission of defconfigs for ARC boards I intentionally left
kernel version unspecified, i.e. the most recent kernel in BR was used
implicitly there. The reason was to stick to latest because all development
for ARC happens upstream and there's really no reason to use anything except
latest stable.

Well I may foresee very rare situations when latest stable is broken for us and so we
will urgently change version... but usually that's not the case.

Instead now we have to bump kernel version either every month so users of BR from
its master branch use latest kernel or at least right before RC1 so we have latest
in the release... IMHO that's a bit of overhead.

I'm not sure if described approach makes sense for many defconfigs in BR,
probably this is only ARC issue but I'd prefer it to be solved in some
"automated" way instead of following:
?a) Bumps in stable repo and then
?b) Bumps of default kernel version in BR

Any thoughts?

-Alexey
