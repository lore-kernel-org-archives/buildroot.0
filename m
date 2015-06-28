From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 20:12:30 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <CAHkwnC8YPier_a5Jbn3MVoFROj_TtGmxqsXC7aA2-J0UiAgO5w@mail.gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150612221456.44a97ad5@free-electrons.com>
 <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
 <20150615111757.03ec0b48@free-electrons.com>
 <CAHkwnC8YPier_a5Jbn3MVoFROj_TtGmxqsXC7aA2-J0UiAgO5w@mail.gmail.com>
Message-ID: <20150628201230.066d6ed2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jun 2015 17:33:21 +0200, Fabio Porcedda wrote:

> > Good. We'll see how it looks. So now the per-package sysroot also
> > contains the C library and kernel headers as well? It's really a
> > complete sysroot?
> 
> Yes, i copy the whole directory ${STAGING_DIR}, e.g.
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot

Ok. When you say "whole", you say that you also "package" what the
toolchain installs, and create a complete sysroot from scratch for each
package being built, including for the toolchain libs/headers ?

> > I'm indeed fine with solving this part as a next step, however, I'd
> > like to at least have some basic ideas of how it will be solved, to see
> > the big picture and see if solving the big picture is doable.
> 
> My idea is to solve it in the same way as the staging directory,
> copying the whole "output/host" directory expect for the sysroot part
> if it is a host package.
> Or maybe there is better way to do it?

Again, when you say "whole", you also separate in multiple host dirs
whatever is installed by each package, and then create a custom
host dir when each package is being built, containing only the
dependencies that it needs?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
