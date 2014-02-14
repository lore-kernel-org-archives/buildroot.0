From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 15:13:50 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356C692F6@de02wembxa.internal.synopsys.com>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356C692F6@de02wembxa.internal.synopsys.com>
Message-ID: <20140214151350.54cb66c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Fri, 14 Feb 2014 10:23:00 +0000, Anton Kolesov wrote:

> > >        arc |            imagemagick-6.8.8-4 | NOK |
> > http://autobuild.buildroot.net/results/97ec0c366c24bd03fe4c26851e8729a4d
> > 8eaf4d0/
> > 
> > Internal compiler error. Anton, would you mind checking if your recent
> > bump of the ARC toolchain components solves this compiler problem?
> 
> No, that hasn't fixed yet. I've opened bug report for this error, but no ETA. Should I disable affected packages for ARC until solution will be ready?

Yes, please.

> > >        arc |                  libxml2-2.9.1 | NOK |
> > http://autobuild.buildroot.net/results/4abdea83c6915aa02b6dc55c9a9dd964
> > ba70ac4b/
> > 
> > Another internal compiler error. Anton, same thing, is that fixed by your
> > recent bump?
> 
> Yes, it passes for me with the "next" branch.

Argh. So libxml2 doesn't build at all on master. This is pretty
annoying, because this package has a fairly large number of reverse
dependencies, so marking all of them "depends on !BR2_arc" to avoid
build problems occurring on master is going to be annoying.

I was discussing this morning with better whether he should have merged
your ARC toolchain components bump to master instead of next. He merged
in next to be on the safe side, but the consequence is that we have a
good number of packages that don't build for ARC in master, causing
autobuilder failures, that we know are solved in next.

Oh well, I guess it's just a matter of waiting for the release at the
end of the month, and get next merged into master.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
