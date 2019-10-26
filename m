From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Oct 2019 10:20:11 +0300
Subject: [Buildroot] [PATCH 1/1] package/collectd: add init script for
 SysV
In-Reply-To: <20191026085837.4c80c347@windsurf.home>
References: <20191026055013.13174-1-asafka7@gmail.com>
 <20191026085837.4c80c347@windsurf.home>
Message-ID: <CALFsTFX_6+exYZ-CCvn50KZxc8ZG7bRWXASmSYdXvhJG_zKifQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 26, 2019 at 9:58 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 26 Oct 2019 08:50:13 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/collectd/S90collectd | 33 +++++++++++++++++++++++++++++++++
> >  package/collectd/collectd.mk |  5 +++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 package/collectd/S90collectd
> >
> > diff --git a/package/collectd/S90collectd b/package/collectd/S90collectd
> > new file mode 100644
> > index 0000000000..5caff17238
> > --- /dev/null
> > +++ b/package/collectd/S90collectd
> > @@ -0,0 +1,33 @@
> > +#!/bin/sh
> > +
> > +start() {
> > +     printf "Starting collectd... "
> > +     /usr/sbin/collectd
>
> I think we like to use start-stop-daemon in our init scripts. Any
> reason why you're not using start-stop-daemon here ?

Nothing special, I sent a v2.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Asaf.
