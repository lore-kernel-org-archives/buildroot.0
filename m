From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 14:16:01 +0200
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <1369020695818-45544.post@n4.nabble.com>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
 <20130114120416.42b34d77@skate>
 <1361247529229-40702.post@n4.nabble.com>
 <20130219162959.34295207@skate>
 <1369020695818-45544.post@n4.nabble.com>
Message-ID: <20130522141601.1fa68730@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear prabindh,

On Sun, 19 May 2013 20:31:35 -0700 (PDT), prabindh wrote:

> Using default cross-compiled toolchain for the Beaglebone, some of the Xorg
> libraries are failing to link, with below errors:
> 
> undefined reference to `pwrite64'
> undefined reference to `pread64'

Have you enable largefile support in your configuration?

> I need C++ toolchain as well, that does not seem to be built with buildroot
> by default. Are the below the right set of options to add to have this
> support ?
> 
> "BR2_GCC_CROSS_CXX=y BR2_INSTALL_LIBSTDCPP=y"

The first one is useless, because it enables C++ on the native compiler
on the target (which is a deprecated feature anyway). And also, this
BR2_GCC_CROSS_CXX option has been removed in december 2010. I would
_really_ recommend you to upgrade to a more recent Buildroot version.
We're clearly not going to support a Buildroot version that's 2 years
old, considering how many things have changed since then.

BR2_INSTALL_LIBSTDCPP (despite its bizarre name) is the right option to
have C++ support in the cross-compiler.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
