From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 21:42:47 +0200
Subject: [Buildroot] [PATCH 4/4] i.MX6: Update Freescale
 hardware-acceleration bits to latest versions
In-Reply-To: <524A69BF.9080906@mind.be>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
 <1380136072-9879-5-git-send-email-eric.nelson@boundarydevices.com>
 <87k3i35qa0.fsf@dell.be.48ers.dk>
 <52449BF5.7030000@boundarydevices.com> <524A69BF.9080906@mind.be>
Message-ID: <20131001214247.5bdcaecb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 01 Oct 2013 08:20:47 +0200, Arnout Vandecappelle wrote:

> > By following the lead of the meta-fsl-arm project and allowing the first
> > of any packages with the Freescale EULA to prompt the user for
> > acceptance, but I'm not sure how to accomplish that.
> >
> > In the Yocto world, a tag ("ACCEPT_FREESCALE_EULA") placed in local.conf
> > is sufficient to bypass the prompt, which requires action by the user.
> 
>   We prefer to avoid that the build stops after half an hour or so 
> because it is waiting for user input. Also, I don't see a reason why we 
> have to explicitly ask the user to accept this license. If we do that, we 
> should probably do the same for all the other packages.
> 
>   If we do want explicit acceptance, then it can be done similar to the 
> Qt license, i.e. add a config option that enables the --auto-accept.

Agreed.

> > Agreed. I'm also confused about why this isn't in the freescale-imx/
> > directory.
> 
>   Because the libfslcodec fits in the multimedia libraries menu more than 
> in the hardware handling menu.

I don't quite agree here. The location of the package in the menu has
nothing to do with the location of the package .mk file and directory.
So if the libfslcodec is downloaded from the same site and with the
same version as the other package/freescale-imx/ stuff and therefore
re-use the same variables, it could very well be moved under this
directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
