From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 4 Oct 2019 10:51:41 +0200
Subject: [Buildroot] [PATCH 5/9] package/libnetconf2: add package
In-Reply-To: <20191002092859.4312bab1@windsurf.home>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-5-heiko.thiery@gmail.com>
 <20191002092859.4312bab1@windsurf.home>
Message-ID: <CAEyMn7aftGM_4VOgq=THLgmBVFn__qMgiMuqxnu8A=PkUsiTug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +################################################################################
> > +#
> > +# libnetconf2
> > +#
> > +################################################################################
> > +
> > +LIBNETCONF2_VERSION = v0.12-r2
> > +LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,$(LIBNETCONF2_VERSION))
> > +LIBNETCONF2_INSTALL_STAGING = YES
> > +LIBNETCONF2_LICENSE = BSD-3-Clause
> > +LIBNETCONF2_LICENSE_FILES = LICENSE
> > +LIBNETCONF2_DEPENDENCIES += libyang libssh
> > +HOST_LIBNETCONF2_DEPENDENCIES += host-libyang host-libssh
>
> Use = instead of +=
>
> > +
> > +LIBNETCONF2_CONF_OPTS += \
>
> Ditto.
>
> > +     -DENABLE_TLS=ON \
> > +     -DENABLE_SSH=ON \
>
> So SSH support is optional ? Why did you made it mandatory ?

For the target application that is used we need the LIBSSH_SERVER. But
you're right, this can be an optional.

I will enable it in the package that requiers it and let it disabled
for the host. With this the "host-libssh" support is not needed any
more.
