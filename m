From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2015 20:25:10 +0200
Subject: [Buildroot] [PATCH 1/7] Add package check: unit test library
In-Reply-To: <20150704110832.739ea438@free-electrons.com>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1435929086-21205-2-git-send-email-sylvain.raybaud@green-communications.fr>
 <20150703183433.GD3652@free.fr>
 <20150704110832.739ea438@free-electrons.com>
Message-ID: <20150704182510.GA3634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-04 11:08 +0200, Thomas Petazzoni spake thusly:
> On Fri, 3 Jul 2015 20:34:34 +0200, Yann E. MORIN wrote:
> > > --- /dev/null
> > > +++ b/package/check/Config.in
> > > @@ -0,0 +1,7 @@
> > > +config BR2_PACKAGE_HOST_CHECK
> > > +	bool "host check"
> > 
> > No, this is not 'host check', this is just 'check'.
> > 
> > This location is not about the host packages, but about the target
> > packages.
> > 
> > Besides, nothing in your series depends on host-check.
> 
> See PATCH 3: there is check in GALERA_DEPENDENCIES, and there is a
> host-galera package with no explicit HOST_GALERA_DEPENDENCIES. So
> host-check is automatically part of HOST_GALERA_DEPENDENCIES.

Ah, right. I saw the dependency on check, but did not think about the
automatically-inherited host dependency.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
