From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 09:33:44 +0200
Subject: [Buildroot] [PATCH v2] package/mender: new package
In-Reply-To: <CAAhKrJ04tvAMGuhPsTjPo-56FvD+Pt0BRBuKysveTTLMHoM1Tg@mail.gmail.com>
References: <CAAhKrJ04tvAMGuhPsTjPo-56FvD+Pt0BRBuKysveTTLMHoM1Tg@mail.gmail.com>
Message-ID: <20180605093344.23db50a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jun 2018 15:37:52 -0600, Dan Walkes wrote:

> Thanks for providing this patch.  I'm also interested in buildroot
> support for mender.

Great! Thanks for your comments and feedback on the Mender integration,
definitely useful.

> I expect it's just that they only test integration with systemd and
> systemd is not a requirement.  See the comment at [1] from Mirza Krak
> on the Mender dev team.
> 
> > Mender does not have a hard-requirement on systemd (BR2_INIT_SYSTEMD),  there is only a conveniently provided systemd service by default.  
> 
> I've started with the patch at [2], then made a few small changes to
> get the package running on an x86 qemu virtual machine with default
> sysv init scripts.  See the project at [3] and branch at [4] for
> details.

Great. Perhaps I could merge Angelo's patch, and you could send
follow-up patch improving it, such as providing non-systemd
integration ?

> For some reason I don't understand, I needed to add a step to
> specifically install the binary after the golang build, it wasn't
> happening by default for me.  See the patch at [5].
> 
> I've noticed the current mender patches do not have support for
> mender-artifact today.  In order to build the mender artifact utility
> I think I'd need to build a host golang package based on mender
> artifact [6] but it looks like only target packages are currently
> supported today with pkg-golang buildroot [7], is that correct?  How
> should I build the mender-artifact utility for the host?

The pkg-golang infrastructure should probably be extended to build host
packages as well. So far it wasn't needed, but if it's needed, then
let's do it.

>  What would
> be the correct way to invoke the mender-artifact utility to actually
> generate the artifact?  Would this be done through a custom post-image
> script?

Yes, that's generally the idea for tools that generate some kind of
firmware image.

> Has work already started on mender-artifact support in another patch
> or on a branch somewhere?

Everything submitted to the Buildroot mailing list is recorded in our
patch tracking system
(https://patchwork.ozlabs.org/project/buildroot/list/). And no, there's
no work on mender-artifact support that has been submitted, at least
not that I remember.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
