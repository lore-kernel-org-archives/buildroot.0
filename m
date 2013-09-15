From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Sep 2013 15:18:57 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
	customization
In-Reply-To: <20130912224742.GG3362@free.fr>
References: <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <20130912220757.GD3362@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639AC9248@ex-mb1.corp.adtran.com>
 <20130912224742.GG3362@free.fr>
Message-ID: <CAAXf6LXjT2a4myNX6q7rXKVEjMRrTV4NbMv4rG6XDDjgE8yYDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 13, 2013 at 12:47 AM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:
> Andy, All,
>
> On 2013-09-12 22:28 +0000, ANDY KENNEDY spake thusly:
[..]
> What I'm arguing is that the content of BR2_EXTERNAL that _interacts
> with Buildroot's internal infrastructure_ *are* a derived work of
> Buildroot.
>
> Let's take a (very simplistic) example:
>
> BR2_EXTERNAL/
> package/
> pkg-1/
> Config.in *
> pkg-1.mk *
> pkg-1-main.c -
> pkg-1.h -
>
> * : a derived work of Buildroot
> - : not a derived work of Buildroot
>
> Config.in and pkg-1.mk are clearly (in my opinion) a derived work of
> Buildroot, since they are written with the very intent to be interacting
> with Buildroot's internal infrastructure.
>
> But pkg-1-main.c and pkg-1.h (which are the C sources of pkg-1) are *not*
> a derived work of Buildroot, and thus can well be under whatever license.

I agree with Yann here: the location of files is not relevant in this case:
clearly the .mk and Config files derive from buildroot. The .mk file would
use infrastructure like generic-package, and define setting such as
FOO_SOURCE, FOO_DEPENDENCIES, specifically to work with buildroot's core
infrastructure. This means that these derived files also become GPL.

Things would be different if we decide that the generic-package and other
infrastructures are an interface to buildroot (which I don't believe they
are). This is similar to why user-space applications running under the
Linux kernel (GPLv2) are not automatically GPLv2 too: the system call
interface is considered the standard interface between the kernel and
applications.

Regarding Andy's argument about making money: I have no objections about
someone selling a product made with buildroot. Same for creating a derived
build system, then selling it for big money. However, while doing so, the
gpl license must be honored, so source code of buildroot must be
distributed. As for anything in the gpl world, this means that purely
selling a product (the derived build system) doesn't make a lot of sense,
as any of your clients can distribute it freely. Instead, the value is now
in the innovation and service you can provide. On both aspects, the
buildroot community itself is already doing a great job at this for free,
so there is little value in forking buildroot for money IMO.


Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130915/068ff317/attachment.html>
