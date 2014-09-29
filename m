From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Sep 2014 22:01:05 +0200
Subject: [Buildroot] [PATCH 09/25 v6] docs/manual: do not hardcode name
 of the generated document
In-Reply-To: <CAAXf6LVCKLRLj_CLgVkEpjtET=90rK5v+6sE493cOmFxLgY8ew@mail.gmail.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <06692733754cdc2bf2b340c5e6b0201f5770740d.1411812968.git.yann.morin.1998@free.fr>
 <CAAXf6LVCKLRLj_CLgVkEpjtET=90rK5v+6sE493cOmFxLgY8ew@mail.gmail.com>
Message-ID: <20140929200105.GB6211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-29 21:33 +0200, Thomas De Schampheleire spake thusly:
> On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIp--]
> > -                       "to generate the manual"; \
> > +                       "to generate a document"; \
> Nit: I would write 'to generate documents' here.
> > -               echo "You need w3m on your host to generate the manual"; \
> > +               echo "You need w3m on your host to generate a document"; \
> Same here.
> > -               echo "You need dblatex on your host to generate the pdf manual"; \
> > +               echo "You need dblatex on your host to generate a PDF document"; \
> This would become 'to generate PDF documents'

OK, I don;t mind. Will do.

> > +$$(O)/docs/$(1)/$(1).$(5): $$($(call UPPERCASE,$(1))_SOURCES) \
> 
> I didn't mean to also change this uppercase call from $$ to $. The
> 'exception' is until now only made when calling the inner infra from
> the outer one. On this line, we are already in the inner infra so one
> would use $$.

But that does not matter, does it?

The expansion of $(call UPPERCASE) is done on a parameter, so we might
as well expand it right at call time, rather than at evaluation time,
no?

> > +                          $(1)-check-dependencies \
> > +                          $(1)-check-dependencies-$(4) \
> > +                          $(1)-prepare-sources
> > +       $$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
> 
> What is the purpose of the quotes here, given your recent commit of
> qstrip in MESSAGE ?

Because I looked at what was done in pkg-generic or some such, and
mimicked. At which point someone noticed on the ML (or IRC) about the
quoting issue, and I did not adapt my code.

But it does not really matter: we can quote messages, now. Or not.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
