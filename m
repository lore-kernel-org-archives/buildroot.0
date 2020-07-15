From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 15:43:38 +0200
Subject: [Buildroot] [PATCH] system/skeleton: make /var/run a symlink to
 /run
In-Reply-To: <CADYdroM9wPyVGM2_oAcKcMYBHjYdfEPrd7YKL5QozGP3kDXPHA@mail.gmail.com>
References: <20200629104749.46938-1-nolange79@gmail.com>
 <20200714151459.6ee4ca7a@windsurf.home>
 <CADYdroPBcpgMkNme2OP8jz3SX-+3J7eDqp0r8UbWXh_swvNkVQ@mail.gmail.com>
 <20200714155207.08d6ffb1@windsurf.home>
 <CADYdroM9wPyVGM2_oAcKcMYBHjYdfEPrd7YKL5QozGP3kDXPHA@mail.gmail.com>
Message-ID: <20200715154338.1e52ffe5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 16:22:25 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> chronological:
> 
> -   Buildroot uses /var/run as RUNTIME directory for SysV, and /run for systemd.
> -   I add the lttng patch above to use either /var/run/lttng or /run/lttng
> -   I consider doing the same for dbus as I get warnings otherwise
> (actually have a post_install script replacing /var/run with /run)
> -   I consider it would be alot easier to just use /run everywhere and
> add this patch to see if that's accepted, before doing more
> if-butt-ing like with lttng

But then, you have to anyway tweak lttng to pass:

LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng

but unconditionally, and no longer depending on whether systemd is used
or not. Correct ?

But... /run is already a tmpfs in sysv-based systems, so what prevents
today from using /run/lttng even for sysv based systems ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
