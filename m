From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Feb 2014 08:27:44 +0100
Subject: [Buildroot] ipv6 and eglibc
In-Reply-To: <530ED709.2090409@gmail.com>
References: <53031C60.6020803@gmail.com> <20140218094655.27e2a040@skate>
 <530ED709.2090409@gmail.com>
Message-ID: <20140227082744.26a4b047@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Thu, 27 Feb 2014 07:11:21 +0100, Marco Trapanese wrote:

> Thomas,
> here my current package files of postres:
> 
> Config.in
> config BR2_PACKAGE_POSTGRES
>      bool "postgres"
>      depends on BR2_INET_IPV6
>      help
>       Postgres SQL server
> 
> comment "postgres requires a toolchain with IPV6 support enabled"
>      depends on !BR2_INET_IPV6

This comment does not comply with the standard practices. See
http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options.

> 
> postgres.mk
> POSTGRES_VERSION=9.3.2
> POSTGRES_SOURCE=postgresql-$(POSTGRES_VERSION).tar.gz
> POSTGRES_SITE=http://ftp.postgresql.org/pub/source/v$(POSTGRES_VERSION)/($POSTGRES_SOURCE)
> POSTGRES_CONF_OPT=--with-system-tzdata=/usr/share/zoneinfo
> POSTGRES_DEPENDENCIES=readline zlib
> 
> $(eval $(autotool-package))

This should be autotools-package. Make sure you read the Buildroot
manual carefully, section
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_autotools_based_packages.

> I added the source item in the main Config.in and I selected the 
> "postgres" package in the nconfig menu.
> However, I can't see any reference to it neither in the Makefile nor in 
> the build directory (of course after a make clean all cycle).

See above, you made a small typo when calling the autotools-package
macro.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
