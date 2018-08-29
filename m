From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 29 Aug 2018 14:58:34 -0700
Subject: [Buildroot] [PATCH 2/2] python-falcon: new package
In-Reply-To: <20180829214758.718d5e7f@windsurf>
References: <20180828101618.4746-1-grzegorz@blach.pl>
 <20180828101618.4746-2-grzegorz@blach.pl>
 <CAMWSM7jvM=oqzCns6RAx32RDDdnFF0ikvhMjXdDCPRoB_d27cA@mail.gmail.com>
 <20180829214758.718d5e7f@windsurf>
Message-ID: <CAMWSM7gW28RJsfcBOFO4dGE4sEVncv4GRvxa3n_X8YQfXa_wDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 29, 2018 at 12:47 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Joseph,
>
> On Tue, 28 Aug 2018 09:34:56 -0700, Joseph Kogut wrote:
>
> > I know python-falcon supports compiling itself using Cython, would it
> > be helpful to do something like:
> >
> > ifeq ($(BR2_PACKAGE_HOST_PYTHON_CYTHON),y)
> > PYTHON_FALCON_DEPENDENCIES += host-cython
> > endif
>
> I am not very familiar with Cython. How does that work, what does that
> do ? Is it sufficient for Cython to be installed in $(HOST_DIR) to
> allow python-falcon to detect it and use it ?
>

Cython allows Python modules to be written using a mix of Python and C
or C++ syntax with optional static typing. During setup, Cython
modules are transpiled to C or C++ and compiled normally as Python
extensions. Most projects that use Cython, including Falcon, have
implementations in vanilla Python, as well as Cython.

Based on my experience porting Kivy, having Cython available on the
host should be enough to compile the extensions.

> > So that if host-cython is selected, python-falcon will utilize it during setup?
> >
> > It might also be helpful to mention in the help text that the package
> > will optionally compile with Cython for enhanced performance, though
> > I'm not sure if that's the Buildroot way of doing things, maybe
> > someone else can chime in.
>
> Yes, if there are some optional dependencies, we can mention them in
> the package Config.in help text.
>

As I noted in my message after this one, I can't think of a reason to
not *always* depend on host-cython here. Compiling the extensions is
essentially an optimization step.

The only reason I can think of to not compile the extensions is if
performance isn't a concern, and you don't have the requisite build
environment during setup.

> Could you provide a follow-up adding this Cython support in
> python-falcon ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
