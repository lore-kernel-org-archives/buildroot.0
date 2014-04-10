From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Apr 2014 23:19:19 +0200
Subject: [Buildroot] [PATCH 0/3] [RFC] pkg-autotools: introduce infra to
 gettextize packages (branch yem/gettextize)
In-Reply-To: <cover.1397081821.git.yann.morin.1998@free.fr>
References: <cover.1397081821.git.yann.morin.1998@free.fr>
Message-ID: <20140410231919.2538fac1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 10 Apr 2014 00:20:00 +0200, Yann E. MORIN wrote:

> This small series introduces the gettextize of a package as an optional
> sequence in the autotools package infra.
> 
>     WARNING! Completely untested, only an RFC!
> 
> Currently, wget is the sole user, and the way it is done for wget is
> just working by chance (see commit log of path 3 for the complete
> explanations.)
> 
> So, move the gettextization to the pkg-autotools infra, so we have a
> chance to do it correctly and consistently across packages.

I haven't looked at the details. But to me, when only one package needs
something, it is *way* too early to make changes to the common
infrastructure. Especially when there is a solution that allows to
solve the problem by making changes to the package .mk file itself.

I believe changes to the package infrastructure should only be made
when:

 * There is really no solution to solve the particular problem at the
   package .mk file level;

 * There are a sufficient (say 5 or 10 maybe) packages that have a
   similar problem, and therefore factorization would make sense.

So far, I don't really see a compelling reason to complexity the
package infrastructure just for the need of one particular package.
Need that may very well be transient, because a future bump of wget
will most likely remove the need for the gnulib patch, therefore for
the autoreconf.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
