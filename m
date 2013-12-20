From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 10:31:43 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/providers
In-Reply-To: <cover.1387495624.git.yann.morin.1998@free.fr>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
Message-ID: <20131220103143.53d1434e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 20 Dec 2013 00:43:23 +0100, Yann E. MORIN wrote:

> This series is a third attempt at trying to fix the BR2_EXTERNAL issue,
> in that packages in BR2_EXTERNAL can't be providers of an implementation
> for a virtual package, such as libegl.

I must say I really like this proposal! It both makes virtual packages
better, and solves the BR2_EXTERNAL problem without making invasive
changes in the package infrastructure.

A few minor questions:

 *) Shouldn't we use 'qstrip' when doing:

    POWERVR_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_POWERVR)

 *) The jpeg virtual package should also be converted in the same way.

 *) In PATCH 1, in package/rpi-userland/Config.in, you're adding an if
    BR2_PACKAGE_RPI_USERLAND ... endif block, but *before* the comment
    related to the toolchain dependencies of rpi-userland. I never
    remember if that is the situation causing indentation problem of the
    comment in menuconfig or not. Would be good to check this.

Thanks for doing this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
