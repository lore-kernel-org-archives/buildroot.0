From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 16:37:16 +0100
Subject: [Buildroot] [PATCH v4 1/9] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20180324152852.GA2620@scaer>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
 <20180324152852.GA2620@scaer>
Message-ID: <20180324163716.1818c77e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Mar 2018 16:28:52 +0100, Yann E. MORIN wrote:

> > +ifneq ($(1),host-skeleton)
> > +$(2)_DEPENDENCIES += host-skeleton
> > +endif  
> 
> In fact, I'm not too sure I should have given my Reviewed-by tag,
> because now the graph-depends are all borked: all packages have a
> dependency arrow toward host-skeleton.

It is not borked, that's completely correct. Maybe not pretty and
convenient, but definitely not "borked".

> What about adding host-skeleton as a dependency to skeleton-init-common
> and skeleton-custom only?

Really feels wrong to me: there is absolutely no reason for
skeleton-init-common and skeleton-custom to depend on host-skeleton.

> Or we can also just add host-skeleton as a special case in
> support/scripts/graph-depends...

That feels like a much better solution to me. We already do that for
the skeleton anyway. Would that be OK for you?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
