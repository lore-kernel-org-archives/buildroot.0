From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Dec 2013 08:28:30 +0100
Subject: [Buildroot] [PATCH 3/3] package/parted: add a host variant
In-Reply-To: <52A63212.4030003@mind.be>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
 <1891fdbc7ad11ce084f2be315871eb10573953b7.1386023329.git.yann.morin.1998@free.fr>
 <20131206104811.49d81180@skate> <20131206165614.GB3364@free.fr>
 <20131206180751.03555e6e@skate> <52A63212.4030003@mind.be>
Message-ID: <20131210082830.57a7728c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 09 Dec 2013 22:11:46 +0100, Arnout Vandecappelle wrote:

> >> # If target-parted can handle lvm volumes, then host-parted
> >> # should be, too, so as to be able to generate them.
> >> # If target-parted can't handle lvm volumes, there is no reason
> >> # for host-aprted to handle them.
> >> ifeq ($(BR2_PACKAGE_LVM2),y)
> >> PARTED_DEPENDENCIES += lvm2
> >> HOST_PARTED_DEPENDENCIES += lvm2
> >> PARTED_CONF_OPT += --enable-device-mapper
> >> HOST_PARTED_CONF_OPT += --enable-device-mapper
> >> else
> >> PARTED_CONF_OPT += --disable-device-mapper
> >> HOST_PARTED_CONF_OPT += --disable-device-mapper
> >> endif
> >
> > While I do understand the logic behind what you're proposing, I'm not
> > really comfortable with having the configuration of tools built for the
> > host changed depending on the target configuration. It seems to be
> > creating a bad precedent.
> 
>   We already have a precedent: libxml2.

No, libxml2 is not the same case. libxml2 host configuration is
adjusted according to the hidden BR2_PACKAGE_HOST_LIBXML2_PYTHON
configuration option, which can be selected by another package.

Therefore, it is not directly the fact of changing the selection of
target packages that modifies the configuration of host-libxml2.

>   What is so bad about one package's configuration depending on another 
> package configuration?

What I found bad here is that we're trying the configuration of the
host package to the configuration of the corresponding target package,
even though there is no real connection between the two things. But
maybe I'm over-zealous I don't know.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
