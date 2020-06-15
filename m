From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 15 Jun 2020 14:54:14 +0200
Subject: [Buildroot] [PATCH 0/3] allow to recompile wireless-regdb
In-Reply-To: <CANQCQpZQ5y_vFxqYfa3csEgbP6yrohjY3Oq+aHOnia39ty3WZg@mail.gmail.com>
References: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
 <CANQCQpZQ5y_vFxqYfa3csEgbP6yrohjY3Oq+aHOnia39ty3WZg@mail.gmail.com>
Message-ID: <20200615125414.GA28894@x1.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ma, 15 jun 2020 06:31:54 -0500, Matthew Weber wrote:
> Kurt,
> 
> 
> On Fri, Jun 12, 2020 at 12:47 AM Kurt Van Dijck
> <dev.kurt@vandijck-laurijssen.be> wrote:
> >
> > This series adds an option to recompile wireless-regdb.
> > This became necessary in our product for outdoor use.
> > In some countries, different regulations apply for indoor
> > and outdoor use. The precompiled version of wireless-regdb
> > is appropriate for indoor use only.
> 
> Thanks for sending this series!
> 
> We ran into a similar situation but never tried to upstream an
> approach with the wireless-regdb project to have an outdoor profile.
> Have you guys looked to see if that would be possible?

We did not attempt to change wireless-regdb itself.
If I remember well, it could in theory support indoor and outdoor regulations,
but you need to tell the driver to do so, and that seemed not really
implemented for our driver (ralink).
Our specific usecase where the differences apply, are in Japan, where
* the regulations db was not yet up to date with the outdoor restrictions
* we wanted to avoid the risks of incomplete implementations

Since wireless-regdb supports recompiling your own db, we figured that
that stripping the indoor-only bands from the db alltogether was the
simplest and safest way to success.

Only recently, our new build-server stumbled over python2/python3 and
our modification became too big.

> With how the
> product wireless certs go it could be beneficial to have the outdoor
> profile as a standard configuration.

We remove the indoor-only bands from the db. That seems quite good.
I wasn't involved in the actual certification, but I can't imagine
how our device would have used the indoor-only bands.

Kurt
