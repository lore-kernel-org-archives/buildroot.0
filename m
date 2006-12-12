From: Allan Clark <allanc@chickenandporn.com>
Date: Tue, 12 Dec 2006 18:05:31 +0800
Subject: [Buildroot] [patch] qtopia4
In-Reply-To: <20061212083851.GA6677@zelow.no>
References: <20061211093336.GA11591@zelow.no> <20061211102408.GB20661@aon.at>
	<20061211120041.GB11591@zelow.no> <20061211134347.GA21997@aon.at>
	<20061211215648.GA15000@zelow.no> <20061211222708.GE4442@aon.at>
	<20061212083851.GA6677@zelow.no>
Message-ID: <37c712e0612120205p5c580f20k7696bbfe24626093@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/06, Thomas Lundquist <lists@zelow.no> wrote:
> On Mon, Dec 11, 2006 at 11:27:08PM +0100, Bernhard Fischer wrote:
> [...]
>
> > >It's a habit. Any real reason we should make it a requirement not to
> > >have it or is it just for looks?
> >
> > Well, it's bloat :) Habit of mine to omit them if they are not needed.
>
> hehe.
>
> but space isn't much of an issue in the buildroot scripts.

(I think we're still tlaking about ";")

I'm involved in a project where a ";" instead of a "&&" between two
dependent build steps is evil, naughty, and generally bad.  Seems the
";" hides an error code from propagating to the make parent process to
catch a failure.  Much easier to write though.

It gets better... we don't seem to like pipes for the same reason.  :(

In this case, the project deals with clearmake build-avoidance, and
once a derived object gets into the pool, whether bad or good, it's a
pain to purge.  One viewpoint...

(I guess this means I don't need to fix the qte build if Qtopia Core
will build for us :)

Allan
