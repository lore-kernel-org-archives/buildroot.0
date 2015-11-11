From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:05:28 +0100
Subject: [Buildroot] [PATCH 1/2] libnet:new package
In-Reply-To: <56427B24.7030602@mind.be>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
 <56427B24.7030602@mind.be>
Message-ID: <20151111150528.16ffceac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

I'm just seeing your review right now. Did you mark the patches as
Changes Requested? I did not mark them as Accepted as far as I
remember, even if I applied them.

On Wed, 11 Nov 2015 00:17:56 +0100, Arnout Vandecappelle wrote:

>  We now require .hash files for github packages as well, since github nowadays
> provides stable tarballs.

This package is not fetched from github. But I've added the hash
nonetheless.

> > +LIBNET_VERSION = 1.1.6
> > +LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
> > +LIBNET_INSTALL_STAGING = YES
> > +LIBNET_LICENSE = BSD-2c
> 
>  There are also a few BSD-3c files, so I think this should be BSD-2c, BSD-3c.

I made a follow-up commit to fix this.

>  The configure script tries to build and run a program to test for ETH_P_ALL
> availability in the AC_LIBNET_CHECK_PF_PACKET function. This will obviously fail
> when cross-compiling, maybe worse when hostarch == targetarch. So I think it's
> best to explicitly pass libnet_cv_have_packet_socket=yes

I did a test build here for ARM, and did not encounter any issues.
Which configuration did you test? Or is it just by inspection of
configure.ac?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
