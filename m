From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 15 Nov 2006 17:33:37 +0100
Subject: [Buildroot] C++ cross compiler
In-Reply-To: <23833.82.171.61.116.1163603087.squirrel@webmail.aerende.com>
References: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
	<20061115125910.a375dcbd.philippe.ney@pardes.ws>
	<23833.82.171.61.116.1163603087.squirrel@webmail.aerende.com>
Message-ID: <20061115173337.96dab87f.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Philippe,
>     Could you tell me how you were able to
> create a c++ cross compiler for ARM?   I.E.
> can you tell me which boxes you checked?
> 
>     The following is what I did which doesn't
> seem to work.
> 
> In make menuconfig in the "toolchain" menu I checked
> 
> [*] Build/install c++ compiler and libstdc++

OK

> and it ended up setting in .config :
> 
> BR2_INSTALL_LIBSTDCPP=y

OK

> but did not set:
> 
> BR2_PACKAGE_LIBCGICC or
> BR2_PACKAGE_QTE

That's packages. Nothing to do with the compiler

> After running make, arm-linux-g++ does not show up in the
> bin directory specified in the "Build options" menu section
> for "Toolchain and header file location".
> 
> 1. Is there another make menuconfig option that needs to
>    be set to build a C++ cross compiler?
> 
> 2. When I googled "buildroot c++ cross compiler" other people
>    were not able to create a c++ cross compiler w/buildroot and
>    I didn't see a clear resolution from the responses.

You ought to have something like :

buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-g++

(gcc-4.0.3 / binutils-2.17 / uClibc-0.9.28)

If the c++ support is not generated in your compiler, maybe you have to
check in the corresponding .mk file if the right parameters are used.


Philippe
