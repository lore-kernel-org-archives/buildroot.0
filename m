From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 06:34:21 +0800
Subject: [Buildroot] ParaGUI package?
In-Reply-To: <52CED5E4.90603@mind.be>
References: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
 <20140108113404.413a4685@skate> <52CED5E4.90603@mind.be>
Message-ID: <20140110063421.2709bb16@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 09 Jan 2014 18:01:24 +0100, Arnout Vandecappelle wrote:

> >> Makefile.am: error: required file './NEWS' not found
> >> Makefile.am: error: required file './ChangeLog' not found
> >
> > These seems to be the real problems. Easiest solution is to add a post
> > patch hook with "touch $(@D)/NEWS $(@D)/ChangeLog"
> 
>   Actually, perhaps we should always to this when PKG_AUTORECONF is YES? 
> There are quite a lot of packages that have this touch trick.

I think I'd prefer these packages to be fixed upstream by adding the
"foreign" argument to AM_INIT_AUTOMAKE. It's not like a patch doing
this should be hard to get merged upstream, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
