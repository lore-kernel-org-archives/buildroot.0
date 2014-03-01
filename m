From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Mar 2014 21:53:06 +0100
Subject: [Buildroot] [PATCH 09/17] manual: update the virtual package
 section with the new infra-structure
In-Reply-To: <CAHXCMMK-DEM9twKkaf9jyMugDU2TebXs1x527GFRw0vZF7KiVg@mail.gmail.com>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
 <5adb45b81357b97d8bff1f46a13b73c8cace4546.1393695127.git.yann.morin.1998@free.fr>
 <CAHXCMMK-DEM9twKkaf9jyMugDU2TebXs1x527GFRw0vZF7KiVg@mail.gmail.com>
Message-ID: <20140301205306.GD3354@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-01 19:58 +0100, Samuel Martin spake thusly:
> On Sat, Mar 1, 2014 at 6:32 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > @@ -51,21 +54,9 @@ The Makefile +package/something-virtual/something-virtual.mk+ should contain:
> >  04: #
> >  05: ################################################################################
> >  06:
> > -07: SOMETHING_VIRTUAL_SOURCE =
> > -08: SOMETHING_VIRTUAL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL))
> > -09:
> > -10: ifeq ($(BR2_PACKAGE_HAS_SOMETHING_VIRTUAL),y)
> > -11: ifeq ($(SOMETHING_VIRTUAL_DEPENDENCIES),)
> > -12: $(error No something-virtual implementation selected. Configuration error.)
> > -13: endif
> > -14: endif
> > -15:
> > -16: $(eval $(generic-package))
> > +16: $(eval $(virtual-package))
> 
> it should be:
> 07: $(eval $(virtual-package))

Ah yes, good catch! Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
