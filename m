From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jun 2013 09:45:35 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130616200540.5a370504@skate>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
 <20130616200540.5a370504@skate>
Message-ID: <20130617074535.GB16699@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 16, 2013 at 08:05:40PM +0200, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Sun, 16 Jun 2013 19:25:08 +0200, Yann E. MORIN wrote:
> 
> > > Indeed. Are we also talking about a daily e-mail?
> > 
> > If there are build failures, yes.
> > Of course, no need for a mail if no build failure.
> 
> Ok. This will require a little bit of work, because until now, the
> autobuild.buildroot.org machine, which sends the daily e-mails, was not
> using the Buildroot source code at all to do its job. So either the
> slave build machines will have to submit the list of maintainers of the
> failing package as part of the tarball they submit to
> autobuild.buildroot.org, or autobuild.b.o will have to look at the
> Buildroot source code to find the maintainers of the failing package.
> 
> Either way, it will not be immediate to implement.

Maybe having a make pkg-maintainers target that would output the list of
mails for a package maintainer would be a more reasonable thing to do.

That would allow the autobuilders to not have some knowledge of the
buildroot source code, while we remain free to change the "maintainer
implementation" at any point in time.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
