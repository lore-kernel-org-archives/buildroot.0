From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jan 2016 21:58:10 +0100
Subject: [Buildroot] [PATCH v2] Makefile: drop ldconfig handling
In-Reply-To: <20151231180135.GH3495@free.fr>
References: <1451573280-7301-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20151231180135.GH3495@free.fr>
Message-ID: <20160101215810.77c4a518@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, 31 Dec 2015 19:01:35 +0100, Yann E. MORIN wrote:

> I disagree on that one.
> 
> We basically tell user that they can do "whatever they want" in a
> post-build-script. So, if a user has a mean to create the ld.so.cache,
> we should not prevent him to do so.
> 
> For example, a user may have a first-install procedure on his machine,
> that runs ldocnfig natively on the machine. Custom (aka br2-external
> packages may install libraries in weird locations (proprietary stuff)
> and can not change that (because other proprietary binary-only stuff).
> In this vase a "first-install" procedure may run ldconfig natively on
> the target, and that would be OK.
> 
> Or he may have a cross-ldconfig (from wherever that comes) so he could
> run that in a post-build script.
> 
> So I believe this check should be before the overlay and post-build
> scripts.

You're absolutely right I believe. We should leave as much freedom as
possible for people to do what they want in their rootfs overlay and
post build scripts. I'll resend an updated version of my patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
