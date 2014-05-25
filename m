From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 May 2014 23:44:13 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for powerpc64le.
In-Reply-To: <1401001162-8868-1-git-send-email-jeffbailey@google.com> (Jeff
 Bailey's message of "Sat, 24 May 2014 23:59:22 -0700")
References: <1401001162-8868-1-git-send-email-jeffbailey@google.com>
Message-ID: <87r43h7cuq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeff" == Jeff Bailey <jeffbailey@google.com> writes:

 > This patch adds support for powerpc64le-linux-gnu.  This includes
 > needed patches to fakeroot and gmp.

 > gmp patch is from upstream HG tree.
 > fakeroot patch is from Ubuntu written by Adam Conrad.

 > Signed-off-by: Jeff Bailey <jeffbailey@google.com>
 > ---
 >  Makefile                                           |  2 +-
 >  arch/Config.in                                     | 10 +++++++-
 >  arch/Config.in.powerpc                             |  9 ++++---
 >  package/binutils/Config.in.host                    |  2 +-
 >  package/fakeroot/01-powerpc64le-support.patch      | 29 ++++++++++++++++++++++
 >  package/gcc/Config.in.host                         |  2 +-
 >  package/glibc/Config.in                            | 11 ++++----
 >  ...c-provide-default-bmod-to-mod-threshold-1.patch | 22 ++++++++++++++++
 >  toolchain/toolchain-buildroot/Config.in            | 10 ++++----
 >  9 files changed, 80 insertions(+), 17 deletions(-)
 >  create mode 100644 package/fakeroot/01-powerpc64le-support.patch
 >  create mode 100644 package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch


 > +++ b/arch/Config.in.powerpc
 > @@ -99,9 +99,11 @@ config BR2_POWERPC_SOFT_FLOAT
 
 >  config BR2_ARCH
 >  	default "powerpc"	if BR2_powerpc
 > +	default "powerpc64le"	if BR2_powerpc64le
 
 >  config BR2_ENDIAN
 > -	default "BIG"
 > +        default "BIG"    if BR2_powerpc
 > +        default "LITTLE" if BR2_powerpc64le

Config.in should be indented with <tab>, not spaces.

Committed with that fixed to next, thanks.

-- 
Bye, Peter Korsgaard
