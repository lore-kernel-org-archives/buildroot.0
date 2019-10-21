From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Oct 2019 21:25:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 python 3.8
In-Reply-To: <20191021210603.59270fc2@windsurf>
References: <20191020203119.99538-1-james.hilliard1@gmail.com>
 <20191021210603.59270fc2@windsurf>
Message-ID: <CADvTj4ojPDhL1M3L=yzSzJh=zp+8rO0pTBYYcGHH5=CBs6n90w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 21, 2019 at 9:06 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 20 Oct 2019 14:31:19 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > +LIBSELINUX_MAKE_OPTS += \
> > +     PYLIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
> > +endif
>
> Same question: libselinux is not embedding Python, it is providing a
> Python extension written in C, so according to what's in
> https://bugs.python.org/issue36721, we should not need --embed.
I think it might depend on if python is built with static vs shared libraries.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
