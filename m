From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 05 Aug 2020 14:29:49 +0200
Subject: [Buildroot] package/boost: Optimization is always -O3
In-Reply-To: <20200804233128.459253b8@windsurf.home>
Message-ID: <58-5f2aa600-1-33499300@111825754>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas ,

On Tuesday, August 04, 2020 23:31 CEST, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 
 
> > 
> > So this wouldn't be mappable cleanly to all optimization levels Buildroot knows.
> > I didn't find a senseable way to set the -O level manually so it is not overwritten by boost, 
> > but maybe somebody has an idea...
> 
> What about simply doing a $(SED) replacement on that gcc.jam file
> before the build, so that whatever optimization level Buildroot uses is
> the one that Boost will use ?
> 
> Yes, it's not the nicest solution, but the Jam stuff is also difficult
> to work with, so it could be a reasonable trade-off.

At first I felt a bit dirty modifying the .jam file but then I found this mail from the
boost developers who suggest [0] basically that (with a copy of the gcc.jam).

But even more luckily someone in a reply figured out how to overwrite those
values using the user-config.jam file [1]. So I have taken this approach.

I'll submit a patch shortly. Let's see what you think.

Regards,
Michael

[0] https://lists.boost.org/boost-build/2007/07/16838.php
[1] https://lists.boost.org/boost-build/2007/07/16955.php
