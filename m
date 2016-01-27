From: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Date: Wed, 27 Jan 2016 19:32:17 +0530
Subject: [Buildroot] [PATCH] updated the package lxc to latest version
	1.1.5
In-Reply-To: <20160127132359.645387ae@free-electrons.com>
References: <1453894151-30929-1-git-send-email-santosh.multhalli@rockwellcollins.com>
 <20160127132359.645387ae@free-electrons.com>
Message-ID: <CAGE8XjpWtgOtDLB1k+finr8ck0tpTXXLh03mqbPu=LfMVjHkjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas/Bernd,

the download location of lxc package has been moved from
https://linuxcontainers.org/downloads
to
https://linuxcontainers.org/downloads/lxc
so I think we need to change LXC_SITE as well

do you guys concur with it


Thanks,
Santosh Multhalli


On Wed, Jan 27, 2016 at 5:53 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Santosh,
>
> On Wed, 27 Jan 2016 16:59:11 +0530, santosh.multhalli wrote:
> > ---
> >  package/lxc/lxc.hash | 2 +-
> >  package/lxc/lxc.mk   | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
> > index d5b8ec5..31186eb 100644
> > --- a/package/lxc/lxc.hash
> > +++ b/package/lxc/lxc.hash
> > @@ -1,2 +1,2 @@
> >  # Locally calculated after checking pgp signature
> > -sha256 8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc
> lxc-1.1.4.tar.gz
> > +sha256
> 9588ad1b04e114ee7370f690c65131e28098b28d2521d97c73557d11897ed0be
> lxc-1.1.5.tar.gz
> > diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> > index b11464e..e382f4d 100644
> > --- a/package/lxc/lxc.mk
> > +++ b/package/lxc/lxc.mk
> > @@ -4,8 +4,8 @@
> >  #
> >
> ################################################################################
> >
> > -LXC_VERSION = 1.1.4
> > -LXC_SITE = https://linuxcontainers.org/downloads
> > +LXC_VERSION = 1.1.5
> > +LXC_SITE = https://linuxcontainers.org/downloads/lxc
> >  LXC_LICENSE = LGPLv2.1+
> >  LXC_LICENSE_FILES = COPYING
> >  LXC_DEPENDENCIES = libcap host-pkgconf
>
> Thanks for your patch. Unfortunately, we already have an almost
> identical patch pending doing the same:
> http://patchwork.ozlabs.org/patch/572124/. Compared to your patch, it
> doesn't change the LXC_SITE variable, which is a bit strange.
>
> One quick comment though (for your next patches!): the title of the
> commit should always have the form:
>
>         <package>: <description>
>
> So for your case, it should be:
>
>         lxc: bump to version 1.1.5
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160127/686b5129/attachment.html>
