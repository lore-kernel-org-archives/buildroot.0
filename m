From: Steinhilber, Markus <Markus.Steinhilber@erbe-med.com>
Date: Mon, 25 Feb 2019 10:00:37 +0000
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add renaming
 functionality to barebox image copy
In-Reply-To: <20190222111958.68393178@windsurf>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35E84@SERBE4I2.intra.erbe-med.de>
 <20190222094056.5f155e17@windsurf>
 <ef5bbef6-02e5-7c44-bec1-f65896df581f@mind.be>
 <20190222111958.68393178@windsurf>
Message-ID: <2748BB04F99E7E45A3203C831E8B20FE34D361CD@SERBE4I2.intra.erbe-med.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at bootlin.com]
> Hello,
>
> On Fri, 22 Feb 2019 09:53:18 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >  Indeed, this use case happens to (almost) work by chance because
> > barebox and barebox-aux are two different packages rather than one
> > like for U-Boot. But if you anyway have the luck of having such an
> > option, I don't mind adding a little bit extra to be able to make better use of it.
> >
> >  Perhaps a possibility is to add a config option that prefixes the
> > output name with something? You'd still need to rename it in the
> > post-build script (or, more likely, handle that in the genimage.cfg
> > file). But it does solve the identical-name problem, it looks pretty simple, and it doesn't break anything.
>
> Good idea! It is simple (just one string option), and it preserves backward compatibility (the default value of the option would be
> empty).

I have to say that I don't see a benefit in the proposed behavior over my patch. My patch adds also a single string option (ok, it can be a string list to be fair) and also doesn't break backward compatibility. Additionally it can be used as a rename option. With a default value of empty it behaves exactly as without the patch.

I also don't see it as too complex. It practically the original if-structure with an added if for each case to check if the value is set and use it or do the 'backward compatibility' way.

> Markus, could you look at implementing this instead ?

I think I could, but not right now as I'm busy with some other things.

Regards,
Markus
________________________________

Erbe Elektromedizin GmbH Firmensitz: 72072 Tuebingen Geschaeftsfuehrer: Christian O. Erbe, Reiner Thede Registergericht: Stuttgart HRB 380137
