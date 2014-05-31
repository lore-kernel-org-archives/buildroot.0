From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 00:37:39 +0200
Subject: [Buildroot] [PATCH 03/11 RFC] support/scripts: prepare handling
 virtual packages in generated lists
In-Reply-To: <CAHXCMMLo6YeU4R5k+_agkuuvvEfdpKUesNgdXf_4fgAb_Ggx1A@mail.gmail.com>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <79b154e4585560398b477fca5a01e33d4ac3075a.1401395407.git.yann.morin.1998@free.fr>
 <CAHXCMMLo6YeU4R5k+_agkuuvvEfdpKUesNgdXf_4fgAb_Ggx1A@mail.gmail.com>
Message-ID: <20140531223739.GF3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-05-31 23:19 +0200, Samuel Martin spake thusly:
> On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP commit log--]

Typoes fixed.

> > diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> > index b33fcf0..8dec089 100644
> > --- a/support/scripts/gen-manual-lists.py
> > +++ b/support/scripts/gen-manual-lists.py
[--SNIP--]
> > @@ -238,11 +238,13 @@ class Buildroot:
> >          return bool([ symbol for x in symbol.get_referenced_symbols()
> >              if x.get_name().startswith(self._deprecated.get_name()) ])
> >
> > -    def _is_package(self, symbol):
> > +    def _is_package(self, symbol, type = 'real'):
> >          """ Return True if the symbol is a package or a host package, otherwise
> >          False.
> >
> >          :param symbol:  The symbol to check
> > +        :param type:    Limit to 'real', 'virtual' or 'both' types of packages
> > +                        Note: only 'real' is (implictly) handled for now
> 
> also, the default value for the type parameter is 'real'.

Added.

I also removed 'both', as it's indeed never used.

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
