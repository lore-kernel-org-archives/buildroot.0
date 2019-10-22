From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Tue, 22 Oct 2019 16:20:36 -0400
Subject: [Buildroot] [PATCH 1/3] package/lttng-libust: bump version to
 2.11.0
In-Reply-To: <20191022215905.6eb2f5f4@windsurf>
References: <20191022144805.591535-1-eeppeliteloop@gmail.com>
 <20191022215905.6eb2f5f4@windsurf>
Message-ID: <CAB4xu_1Q_twuoii+ssnLTk1ZnfPOYiCNRS202RrvCPFcwoLvQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 22, 2019 at 3:59 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 22 Oct 2019 10:48:03 -0400
> Philippe Proulx <eeppeliteloop@gmail.com> wrote:
>
> > +ifneq ($(BR2_PACKAGE_NUMACTL),y)
> > +LTTNG_LIBUST_CONF_OPTS += --disable-numa
> > +endif
>
> This is not good: what happens when numactl is enabled ?
>
> So, I changed this to:
>
> ifeq ($(BR2_PACKAGE_NUMACTL),y)
> LTTNG_LIBUST_DEPENDENCIES += numactl
> LTTNG_LIBUST_CONF_OPTS += --enable-numa
> else
> LTTNG_LIBUST_CONF_OPTS += --disable-numa
> endif
>
> which is the typical way to handle optional dependencies.
>
> I've applied after fixing this. Thanks!

Ok thanks.

`--enable-numa` is the default which is why I didn't write it
explicitly, but it looks safer your way.

Phil
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
