From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 09:25:14 +0100
Subject: [Buildroot] [PATCH 02/29] package/qemu: build for the target
 (i386 or x86_64 only)
In-Reply-To: <f188c40e460742e03046b1c37cdfb739371e7241.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
 <f188c40e460742e03046b1c37cdfb739371e7241.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <20130130092514.6cc28821@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 29 Jan 2013 23:43:46 +0100, Yann E. MORIN wrote:

> +# Note: although QEMU uses a ./configure script, it is not compatible with
> +#       the traditional autotools options (eg. --target et al.), so we have
> +#       to override the default provided by the autotools-package infra, and
> +#       provide our own. Sigh... :-/

Then please do not use the autotools-package infrastructure for this
package. It doesn't use autoconf, it doesn't automake, it is *NOT*
autotools.

It is not because it happens to work *today* by just overriding the
QEMU_CONFIGURE_CMDS that it will continue to work tomorrow. For
example, look at the out-of-tree stuff I was working on: for autotools
packages, we will assume that out of tree build is supported, and that
it works in a certain way. Wouldn't this break the qemu package, which
pretends to be an autotools package, but in fact is not?

So, I've said this several times already: do not misuse package
infrastructures, even if it happens to "work" today. Do the right
thing, instead: qemu should use the generic-package infrastructure.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
