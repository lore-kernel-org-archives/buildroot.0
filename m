From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 2 Mar 2009 13:06:44 +0100
Subject: [Buildroot] depend or select in Config.in & Autotarget question
In-Reply-To: <20090302124019.106a2593@bandomeer.europe.flane.local>
References: <20090302124019.106a2593@bandomeer.europe.flane.local>
Message-ID: <20090302130644.1162039b@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2 Mar 2009 12:40:19 +0100
Olaf Rempel <razzor@kopf-tisch.de> wrote:

> Hi List,
> 
> what is the preferred method to resolve package dependencies in
> Config.in? eg. when package-B needs package-A to build, should B
> "select" A or should B "depend" on A?

Packages can select other packages. For example if you application
depends on one or more libraries/software, then you should select these
packages.

Packages depends on toolchain options, so that you need to configure
your toolchain correct before you go out selecting packages.

Changing the toolchain after a first build will set you back all the
way to start.

> And when using "depend" should there be an info when A is not active
> (like ipsec-tools => openssl)?
>

Yes, but typically we make a comment which depends on the missing
depends.

I.e. "Qt - disabled (requires C++ support)", or I think something
similar is present in the kconfig menu.

> I've started with the Makefile.autotools.in conversion of some
> packages that I use. When should a AUTORECONF:=yes be used? So far it
> had no affect in my tests?
> 

autoreconf may be needed for packages where mainline is shipping
outdated scripts which does not work anymore for up to date
distributions/new architectures.

If it's not needed for the package to compile, do not set it. It will
only slow down the build time.

-- 
Best regards,
Hans-Christian Egtvedt
