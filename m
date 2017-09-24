From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Sep 2017 21:45:30 +0200
Subject: [Buildroot] [PATCH 30/49 v2] package/libqb: new package
In-Reply-To: <627dd05c-f4e7-990a-50d0-a167bf81bdfa@mind.be>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <c5a9ad9b87390d6b6b0a16d1f647ce7c4f2fd92e.1504993178.git.yann.morin.1998@free.fr>
 <627dd05c-f4e7-990a-50d0-a167bf81bdfa@mind.be>
Message-ID: <20170924194530.GF2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-09-23 18:51 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 09-09-17 23:39, Yann E. MORIN wrote:
> [snip]
> > +From f9857721bfe5c47253bc2cf487d9dcc94cbce3c2 Mon Sep 17 00:00:00 2001
> > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +Date: Mon, 26 Dec 2016 19:38:45 +0100
> > +Subject: [PATCH] bconfigure: fix CLOCK_MONOTONIC check for cross-compilation
> 
>  Upstream status?

PR #279. ;-)

OK, I admit: I just sent it. ;-)

[--SNIP--]
> > +LIBQB_VERSION = v1.0.1
> > +LIBQB_SITE = $(call github,ClusterLabs,libqb,$(LIBQB_VERSION))
> 
>  There is an uploaded tarball (which probably contains a configure script).

That tarball was uploaded in May 2017, while the release  was tagged in
November 2017. Of course, I did the package in-between those two
dates...

>  There's also a 1.0.2 now.

Yup, I've now seen that.

> > +LIBQB_LICENSE = LGPLv2.1+
> > +LIBQB_LICENSE_FILES = COPYING
> 
>  SPDX + license hash.

ACK.

> > +LIBQB_DEPENDENCIES = host-pkgconf
> > +
> > +# Straight out of the repository, no configure present. Also, we do patch
> > +# configure.ac.
> > +LIBQB_AUTORECONF = YES
> > +
> > +LIBQB_INSTALL_STAGING = YES
> > +
> > +define LIBQB_M4
> > +	$(INSTALL) -d -m 0755 $(@D)/m4
> 
>  We use mkdir -p everywhere else.

ACK.

> > +endef
> > +LIBQB_POST_EXTRACT_HOOKS += LIBQB_M4
> > +
> > +# Don't build docs
> 
>  We don't usually have these comments, do we?

ACK.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
