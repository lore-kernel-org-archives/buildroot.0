From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Nov 2012 09:59:57 +0100
Subject: [Buildroot] [PATCH 1/7] docs/manual: update 'adding packages'
 with the new _AVAILABLE symbol
In-Reply-To: <5092FA55.9000800@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <1347234052-10527-2-git-send-email-yann.morin.1998@free.fr>
 <5091D0B8.6050404@mind.be>
 <201211011721.23581.yann.morin.1998@free.fr>
 <5092FA55.9000800@mind.be>
Message-ID: <20121102095957.0169046d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 01 Nov 2012 23:40:21 +0100, Arnout Vandecappelle wrote:

> >>> +1. The +BR2_PACKAGE_LIBFOO_AVAILABLE+ symbol shall +depends on+
> >>> any +other package's +_AVAILABLE+ symbol. It may also depend on
> >>> any other +symbol, such as toolchain features, but should not
> >>> directly depend on +any package's main symbol.
> >>
> >>    ... except for _XORG7, _PYTHON, etc.
> >
> > Well, my opinion (FWIW) is those packages should not be treated
> > differently just because they are /big/.
> >
> > (One of) the goal(s) of _AVAILABLE is to allow the user to say
> > either:
> >    - I want this package, enable whatever dependencies are required.
> > or:
> >    - I need this package, but I have to provide a toolchain that has
> >      such and such feature
> >
> > _AVAILABLE makes that easy.
> >
> > Then, it's up to the user to understand what pulling-in a package
> > implies.
> 
>   I actually agree, but that's not the current reality.
> 
>   OTOH, it makes sense to promote the wanted reality in the
> documentation.

Except that even with the _AVAILABLE feature, I don't know if we want
to change how we handle things like Python modules, X.org and so on. We
will pretty likely still want to hide all of the Python modules behind
a global Python option.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
