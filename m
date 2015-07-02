From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jul 2015 23:20:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-kconfig: define
 KCONFIG_EDITORS_MAKE_ENV
In-Reply-To: <20150702175937.4733d060@free-electrons.com>
References: <1435848100-5762-1-git-send-email-talz@ezchip.com>
 <20150702175937.4733d060@free-electrons.com>
Message-ID: <20150702212031.GH3838@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2015-07-02 17:59 +0200, Thomas Petazzoni spake thusly:
> On Thu, 2 Jul 2015 17:41:40 +0300, Tal Zilcer wrote:
> 
> >  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
> >  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
> > -	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> > +	$$($(2)_KCONFIG_EDITORS_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> 
> I actually don't think adding a KCONFIG_EDITORS_MAKE_ENV variable is
> really useful here. Since it's a bunch of host tools, maybe we should
> just:
> 
> 	$$(HOST_MAKE_ENV) $$(MAKE) -C ...

I do agree with Thomas here.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
