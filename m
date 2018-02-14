From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 09:01:48 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf>
 <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
 <20180213231930.26ab0efb@windsurf.lan>
 <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
Message-ID: <20180214090148.5b21f55e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Feb 2018 14:56:56 +1100, Andrew Donnellan wrote:

> > Can we do something about this ? We're really happy otherwise by the
> > patchwork instance at ozlabs.org, and we would hate having to run our
> > own instance :-/  
> 
> We've done some digging...
> 
> https://patchwork.ozlabs.org/patch/872845/
> https://patchwork.ozlabs.org/patch/872846/
> 
> These are the other two patches in the series, and yet patchwork has 
> assigned them two different series, so evidently something screwy is 
> happening there.
> 
> sfr took a look at the mail logs for us, it looks like:
> 
> - all 3 emails were received and processed by our SMTP system
> - patch 2 was received first, and patches 1 and 3 were received during 
> the same second a couple of seconds later
> 
> Patch 3 has not hit the database at all, it's possible we've hit some 
> race condition somewhere that prevented it from being saved at the same 
> time as patch 1, or perhaps we ran into something completely 
> different... we're going to add some extra logging to see if we can 
> capture more info next time this happens.
> 
> Many apologies for the inconvenience!

As asked by Jeremy, I've changed the patchwork e-mail address to which
the Buildroot patches are being sent, so that you can add more logging,
but only for Buildroot stuff.

Regarding the patches not properly assigned to series, we have already
seen that many times, even in situations were no patches are lost. Some
patches in the series are properly marked as being part of the series,
and some are not. It feels like if some patches are received before the
cover letter, patchwork gets confused, but that's just a guess. It
doesn't happen very often, but it does happen. However, this is a lot
less annoying that "losing" patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
