From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Nov 2013 00:29:00 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <OFAD27391D.CFE95723-ON86257C1B.007F5691-86257C1B.007F8A75@rockwellcollins.com>
 (clshotwe@rockwellcollins.com's message of "Wed, 6 Nov 2013 17:14:34
 -0600")
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 <87eh6tkxuk.fsf@dell.be.48ers.dk> <20131106231048.67cf2d52@skate>
 <87k3gljh5d.fsf@dell.be.48ers.dk> <20131106225332.GB3482@free.fr>
 <8738n9jfim.fsf@dell.be.48ers.dk>
 <OFAD27391D.CFE95723-ON86257C1B.007F5691-86257C1B.007F8A75@rockwellcollins.com>
Message-ID: <87txfphzyb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "clshotwe" == clshotwe  <clshotwe@rockwellcollins.com> writes:

 >> Sure, but that's what we have 'make source' (for specific
 >> configurations) or sources.buildroot.net (for local mirror of
 >> everything) for, right?

 > I don't know what all configurations are being used so I would
 > rather be safe and pull down all of the packages. This would make
 > it easier than running make source on a bunch of different configurations.

But you still only download a single version per package, so you might
not get all the needed sources (and you most likely download a lot more
than you need).

I personally dislike the patch as it's a bit of a hack, but if there's
really a need for something like this then perhaps - But wouldn't it
make more sense if we instead tried harder to ensure all the package
versions we support were available on our mirror?

-- 
Bye, Peter Korsgaard
