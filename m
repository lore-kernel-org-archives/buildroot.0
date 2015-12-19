From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:47:13 +0100
Subject: [Buildroot] [PATCH v10 00/28] efl bump to 1.15.2
In-Reply-To: <56756A03.7050701@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
 <20151218001144.5a685de2@free-electrons.com>
 <56756A03.7050701@openwide.fr>
Message-ID: <20151219154713.0084f003@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 19 Dec 2015 15:30:27 +0100, Romain Naour wrote:

> > To be honest, with the version number now being shared with just libefl
> > and libelementary, I am not sure it is really worth the effort to have
> > a package/efl/ directory with those two packages. What about making
> > them normal top-level packages ?
> 
> This is what I wanted to do initially (in v3):
> - move all old efl package outside of package/efl/ [1]
> - add a new package efl [2]
> 
> [1] http://patchwork.ozlabs.org/patch/528603/
> [2] http://patchwork.ozlabs.org/patch/528573/
> 
> But someone asked me to keep in sync libelementary and efl, so I introduced the
> libefl package in the followup series.
> 
> Now, we can move libelementary and libefl to package/ directory.
> And even rename libefl to efl because all packages that use efl libraries
> depends on BR2_PACKAGE_EFL.
> 
> Thoughts ?

As said on IRC, I think it's better to have just package/efl/ and
package/elementary/.

Having a subdirectory for just two components that currently share
their version, but for which there is no clear statement from upstream
that they will always been doing in-sync releases, is not a good idea
IMO. Let's have two separate normal packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
