From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 10:02:43 +0200
Subject: [Buildroot] [PATCH 5 of 5] toolchain-external: use host-tar
 instead of tar to unpack toolchains
In-Reply-To: <8a360f47132f5187ec55.1316588135@localhost6.localdomain6>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <8a360f47132f5187ec55.1316588135@localhost6.localdomain6>
Message-ID: <20110921100243.1e55b429@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 21 Sep 2011 08:55:35 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Some toolchains, like the one built with buildroot itself, use hardlinks (for
> example to link between the c++ and g++ binary). Unpacking such a toolchain
> with the --strip-components options does not work correctly if the system tar
> is too old (<1.17). Even recent releases of RedHat/CentOS still ship with
> tar 1.15.
> To avoid such problems, always use host-tar instead of tar to unpack
> toolchains.

I'm sorry but we need to find a better solution for this. I really
don't want all users to pay the price of building tar to extract
the external toolchain just because some crappy distribution has an old
version of tar. Can we make this conditional on the version of tar ?
I'd also like some comment in the code suggesting to remove this crap 1
or 2 years from now, once those RedHat/CentOS distributions will have
been upgraded.

Also, this proposal only takes care of using the compiled host tar for
toolchain extraction. Why don't we also use it to extract all other
packages (except tar itself, of course...) ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
