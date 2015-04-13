From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 23:36:36 +0200
Subject: [Buildroot] [PATCHv2 12/21] pkg-generic: implement source-check
 targets
In-Reply-To: <20150413212558.GN29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413210521.GL29025@free.fr> <20150413212558.GN29025@free.fr>
Message-ID: <20150413213636.GO29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-13 23:25 +0200, Yann E. MORIN spake thusly:
> On 2015-04-13 23:05 +0200, Yann E. MORIN spake thusly:
> > On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> > > +$(1)-source-check:
> > > +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> > > +	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
> > > +		$$(if $$(findstring ://,$$(p)),\
> > > +			$$(call SOURCE_CHECK,$$(p)),\
> > > +			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p))))
>                                                             ^^
> You're missing a $$(sep) before the last parenthesis, here  ||

And because my tabstop=4, I missed the right position. Regardless, the
following is correct:

> so that last line would be:
> 
>     $$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p)))$$(sep))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
