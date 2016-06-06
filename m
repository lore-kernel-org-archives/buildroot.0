From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 22:33:45 +0200
Subject: [Buildroot] [PATCH 00/10] Bump NXP package versions
In-Reply-To: <CAAMH-ytGSshRJTZiqmQ4DeztuA5L_GtfnF8aTCUorx9vw87baA@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <CAAMH-ytGSshRJTZiqmQ4DeztuA5L_GtfnF8aTCUorx9vw87baA@mail.gmail.com>
Message-ID: <20160606223345.2296107b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Jun 2016 16:32:28 +0200, Gary Bisson wrote:

> First of all, thank you for taking care of this update. It's good to
> have someone else looking at those ;-)

And thanks to you for reviewing!

> I'm ok moving things to freescale-imx, I think it makes it easier for
> people looking at i.MX-specific packages instead of browsing through
> both hardware handling packages and multimedia libraries.
> However I guess Thomas and/or Peter will have ack this change.

We normally want all packages to be directly under package/, precisely
because it is easier to find them this way.

The only case where we accept to have sub-directories for groups of
packages is when several packages need to share some variables, like
package/qt5/qt5.mk.

For freescale-imx stuff, it seems like the only variable left shared by
various packages in FREESCALE_IMX_SITE, and in fact it's already used
outside of package/freescale-imx/.

So I would almost suggest to get rid of the sub-directory, and move
this variable, as well as the other macro defined in freescale-imx.mk
to another file, though I'm not sure which one.

Peter?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
