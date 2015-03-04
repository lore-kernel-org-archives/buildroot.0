From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 11:37:28 +0100
Subject: [Buildroot] Compile Crypto++ package
In-Reply-To: <CAJpGAeFK15Vrznw7HLDSrACBHwRKLGi8freygbFcfPaA5BEpTw@mail.gmail.com>
References: <CAJpGAeFK15Vrznw7HLDSrACBHwRKLGi8freygbFcfPaA5BEpTw@mail.gmail.com>
Message-ID: <20150304113728.4dfd8bea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 4 Mar 2015 11:33:59 +0800, hardik gohil wrote:

> I am using buildroot to compile packages for MIPS architecture till now.
> 
> I want to compile Crypto++ which is not available in Buildroot-2013.02.
> 
> I don't want to use libgcrypt which is available.
> 
> Crypto++ uses GNUmakefile method but not autoconf (./configure) to compile.
> 
> Is it possible to Integrate this into buildroot or i need to compile
> separately outside by setting all the paths.

Of course it is possible to integrate this package in Buildroot. You
seem to believe that only autoconf-based packages can be supported but
that's not the case: autoconf/automake based packages are supported
using the autotools-package infrastructure, but we also support CMake,
Perl, Python, Luarocks, and other types of packages.

And for packages having a custom build system such as a manual makefile
(which is the case of Crypto++), we have the generic-package
infrastructure.

> Help me?

Please read the Buildroot documentation:
http://buildroot.org/downloads/manual/manual.html#adding-packages. And
specifically the part about generic-package:
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
