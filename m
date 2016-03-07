From: Pieter Smith <pieter@boesman.nl>
Date: Mon, 7 Mar 2016 19:31:45 +0100
Subject: [Buildroot] [v3,
	1/4] barebox: prepare for secondary config build
In-Reply-To: <56DC9E47.2090207@mind.be>
References: <1453329821-3167-2-git-send-email-pieter@boesman.nl>
 <56D0DCFB.8060601@mind.be> <20160228081204.GB4297@smipidev>
 <20160229074707.GA17808@smipidev> <56D620F2.3090605@mind.be>
 <20160302075049.GA10481@smipidev> <56D72D29.5050600@mind.be>
 <20160302213256.GA11826@smipidev> <20160305131603.GA7616@smipidev>
 <56DC9E47.2090207@mind.be>
Message-ID: <20160307183145.GA8550@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 06, 2016 at 10:16:55PM +0100, Arnout Vandecappelle wrote:
> On 03/05/16 14:16, Pieter Smith wrote:

[snip]

> > I am having some trouble with this. I am not able to handle ifdef-space
> > diversity in this way. Ifdef-space diversity is used to determine how barebox
> > should be configured, whether / how the barebox environment should be built,
> > and to print user-friendly config errors. The ifdef logic is not all trivial
> > (almost half of the makefile logic), so I would like to avoid duplicating it
> > between barebox and barebox-2. The only way I know of to avoid this duplication
> > is by extracting the logic info a definition and using $(eval), which is
> > exactly what you want to avoid.
> 
>  Ah yes, I didn't realize that. Indeed, for those things there is no way to
> handle them with $(PKG).
> 
>  Actually I would like those things to move to kconfig-package, but that would
> be dragging things a bit too far for this series.
> 
>  So yes, your idea of $(call barebox-package) looks good. One small remark that
> you can already fix before submitting: in the patch that adds the
> barebox-package function, say explicitly in the commit message if anything has
> changed except for $ -> $$ and BAREBOX -> $(1). That'll make review easier.

Thanks for having a look. I will break the series up into smaller pieces to
ease review:
1 - 2 as before.
3. Break out barebox-package (Explain the $ -> $$ subst).
4. Make the variable name-space configurable (Explain BAREBOX -> $(1) subst).
5. Make the package source name-space configurable (Explain BAREBOX -> $(2)
   subst).
6. Introduce boot/barebox-2/barebox-2.mk and Config.in with
   $(call barebox-package,BAREBOX_2,BAREBOX)
7. Add a defconfig for the BBB.

[snip]

Thank you for helping to bang this into shape.

- Pieter
