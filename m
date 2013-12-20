From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 10:49:04 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/providers
In-Reply-To: <201312201043.01660.yann.morin.1998@free.fr>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
 <20131220103143.53d1434e@skate>
 <201312201043.01660.yann.morin.1998@free.fr>
Message-ID: <20131220104904.7cb29c07@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 20 Dec 2013 10:43:01 +0100, Yann E. MORIN wrote:

> > I must say I really like this proposal! It both makes virtual packages
> > better, and solves the BR2_EXTERNAL problem without making invasive
> > changes in the package infrastructure.
> 
> Note that I still intend to work on the post-pone patch, as this would
> allow more integration of BR2_EXTERNAL.

Like what?

> > A few minor questions:
> > 
> >  *) Shouldn't we use 'qstrip' when doing:
> > 
> >     POWERVR_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_POWERVR)
> 
> Probably. I must say I forgot to mark this PR as an RFC. I did not
> actually test it, besides checking the Kconfig variable was properly
> set in .config.
> 
> I'll conduct more thourough tests tonight and this WE.
> 
> So: this was an RFC. ;-)

Yeah, no problem. But it clearly does look nice.

> >  *) The jpeg virtual package should also be converted in the same way.
> 
> I've looked at the jpeg and cryptodev packages, but they do not follow
> the "standard" virtual packages scheme (or, as Gustavo put it on IRC
> yesterday: "they are not real virtual packages").

Don't know about cryptodev, but jpeg is really a virtual package, but
it's true that it is handled in a different way than the OpenGL
packages, in that jpeg/Config.in provides a choice between the
different providers. Not sure what we want to do here. Maybe nothing, I
don't know.

> >  *) In PATCH 1, in package/rpi-userland/Config.in, you're adding an if
> >     BR2_PACKAGE_RPI_USERLAND ... endif block, but *before* the comment
> >     related to the toolchain dependencies of rpi-userland. I never
> >     remember if that is the situation causing indentation problem of the
> >     comment in menuconfig or not. Would be good to check this.
> 
> I'll look into that, too.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
