From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 11:20:35 +0100
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add renaming
 functionality to barebox image copy
In-Reply-To: <2748BB04F99E7E45A3203C831E8B20FE34D361CD@SERBE4I2.intra.erbe-med.de>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35E84@SERBE4I2.intra.erbe-med.de>
 <20190222094056.5f155e17@windsurf>
 <ef5bbef6-02e5-7c44-bec1-f65896df581f@mind.be>
 <20190222111958.68393178@windsurf>
 <2748BB04F99E7E45A3203C831E8B20FE34D361CD@SERBE4I2.intra.erbe-med.de>
Message-ID: <20190225112035.4ed3ad33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Mon, 25 Feb 2019 10:00:37 +0000
"Steinhilber, Markus" <Markus.Steinhilber@erbe-med.com> wrote:

> > Good idea! It is simple (just one string option), and it preserves
> > backward compatibility (the default value of the option would be
> > empty).  
> 
> I have to say that I don't see a benefit in the proposed behavior
> over my patch. My patch adds also a single string option (ok, it can
> be a string list to be fair) and also doesn't break backward
> compatibility. Additionally it can be used as a rename option. With a
> default value of empty it behaves exactly as without the patch.
> 
> I also don't see it as too complex. It practically the original
> if-structure with an added if for each case to check if the value is
> set and use it or do the 'backward compatibility' way.

It's purely a matter of "design principle", i.e how Buildroot normally
does/implements/designs things. We try to be consistent and have the
same basic design principles applied across Buildroot, so that the way
package A does things is similar to how package B does things.

And nowhere in Buildroot we have this idea of two string options, where
the Nth entry of the first list "maps" to the Nth entry of the second
list. While it works, it's a bit of an awkward/strange semantic for
Config.in string options, hence our preference for a single option that
allows to specify a prefix or path where the Barebox binaries should be
installed.

So, there is nothing wrong per-se with your initial approach: it
functionally works. It is just that we (Arnout, me, as long-time
Buildroot developers/contributors) find that it doesn't fit very well
in the usual BR design principles, and there is a simple alternate
solution that works *and* fits better with the usual BR design
principles. It's as simple as that :-)

Hopefully this clarifies our suggestion on your contribution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
