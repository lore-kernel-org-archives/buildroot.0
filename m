From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 11:08:32 +0200
Subject: [Buildroot] [PATCH 1/7] Add package check: unit test library
In-Reply-To: <20150703183433.GD3652@free.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1435929086-21205-2-git-send-email-sylvain.raybaud@green-communications.fr>
 <20150703183433.GD3652@free.fr>
Message-ID: <20150704110832.739ea438@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 3 Jul 2015 20:34:34 +0200, Yann E. MORIN wrote:

> > --- /dev/null
> > +++ b/package/check/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_HOST_CHECK
> > +	bool "host check"
> 
> No, this is not 'host check', this is just 'check'.
> 
> This location is not about the host packages, but about the target
> packages.
> 
> Besides, nothing in your series depends on host-check.

See PATCH 3: there is check in GALERA_DEPENDENCIES, and there is a
host-galera package with no explicit HOST_GALERA_DEPENDENCIES. So
host-check is automatically part of HOST_GALERA_DEPENDENCIES.

However, I definitely agree that we don't need a Config.in menu for
host check, only for the target variant of it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
