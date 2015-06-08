From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Jun 2015 23:58:28 +0200
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <55760EA8.1000503@mind.be>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
 <55760493.1070807@mind.be> <20150608214443.GH3590@free.fr>
 <55760EA8.1000503@mind.be>
Message-ID: <20150608215828.GI3590@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-08 23:52 +0200, Arnout Vandecappelle spake thusly:
> On 06/08/15 23:44, Yann E. MORIN wrote:
> > On 2015-06-08 23:09 +0200, Arnout Vandecappelle spake thusly:
> >> On 06/07/15 00:20, Yann E. MORIN wrote:
> >>> +# Duplicate that from pkg-generic because we need it now
> >>> +ifndef $(2)_MAKE
> >>> +  $(2)_MAKE = $(MAKE)
> >>> +endif
> >>
> >>  I don't see why this is needed... The defines below will only be expanded when
> >> the rule is executed (otherwise $(PKG) would not even be defined), so the
> >> definition from pkg-generic is enough, no?
> > 
> > Well, I tried to remove it, and it does not work (indetation added by me):
> 
>  D'oh, it's actually defined in pkg-autotools, not pkg-generic, but the comment
> above confused me. Which in fact makes the comment redundant, because it's not a
> redifinition.

Ah, yes, right, my bad.

I tested with a generic-package. Maybe an autotools-package (or any
other infra) would have no issue, since it is defined for them.

>  That said, I think it's better like this:
> 
> $(2)_MAKE ?= $$(MAKE)

Yup, I'll do (already usinf $$(MaKE) locally.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
