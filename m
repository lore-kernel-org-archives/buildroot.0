From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 10:57:02 +0100
Subject: [Buildroot] [PATCH] make: fix build with glibc 2.27
In-Reply-To: <1335b4d70acf1aacdc0d4f40fedfa69320debf6a.1521187256.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 16 Mar 2018 10:00:56 +0200")
References: <1335b4d70acf1aacdc0d4f40fedfa69320debf6a.1521187256.git.baruch@tkos.co.il>
Message-ID: <87h8pggx75.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > glibc 2.27 changed _GNU_GLOB_INTERFACE_VERSION to 2. This triggers build
 > of the internal glob implementation in make. This internal
 > implementation needs the __alloca symbol that glibc does not define.

 > Add upstream patch that adds support for _GNU_GLOB_INTERFACE_VERSION 2.

 > Fixes:
 > http://autobuild.buildroot.net/results/8ff/8ff06ad8438cfcac85577b24675dd1d66f7d3d03/
 > http://autobuild.buildroot.net/results/5cc/5ccee6bb332e800e81052a3094746edde83403b1/
 > http://autobuild.buildroot.net/results/841/8418f5ed56dacd6900946e7d56ad36ad03c7bf7e/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 > diff --git a/package/make/make.mk b/package/make/make.mk
 > index 5717628fa3e9..01cd2eaa18f2 100644
 > --- a/package/make/make.mk
 > +++ b/package/make/make.mk
 > @@ -7,9 +7,11 @@
 >  MAKE_VERSION = 4.2.1
 >  MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 >  MAKE_SITE = $(BR2_GNU_MIRROR)/make
 > -MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 > +MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-pkgconf

The patch looks good, but why are you pulling in host-pkgconf?

-- 
Bye, Peter Korsgaard
