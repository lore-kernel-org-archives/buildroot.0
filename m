From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 16:47:20 +0200
Subject: [Buildroot] [PATCH 04/16 v3] core: introduce an intermediate
 rule before the configurators
In-Reply-To: <66b17c41-1687-d92c-abdd-510dd6f8323b@gmail.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <22c8e4df35485da3ab9dd836465e4892305c7073.1468750623.git.yann.morin.1998@free.fr>
 <66b17c41-1687-d92c-abdd-510dd6f8323b@gmail.com>
Message-ID: <20160827144720.GE5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-06 17:13 +0200, Romain Naour spake thusly:
> Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :
> > Currently, all configurators depend on generating the out-of-tree
> > Makefile wrapper.
> > 
> > In an upcoming patch, we'll need to also generate a kconfig fragment,
> > so it will have to kick in before we run the configurators.
> > 
> > Introduce a new intermediate "prepare-kconfig" rule, so we can
> > commonalise the dependencies of the configurators. Move the dependency
> > on the Makefile wrapper to that new intermediate rule.
> 
> I think we need to add prepare-kconfig to PHONY target list (for consistency as
> you said on IRC ;-))

Yes, indeed, it should be made .PHONY ...

> With that fixed:
> Reviewed-by: Romain Naour <romain.naour@gmail.com>

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
