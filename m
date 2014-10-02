From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Oct 2014 21:14:08 +0200
Subject: [Buildroot] [PATCH 23/25 v6] doc/asciidoc: always use UTC
In-Reply-To: <CAAXf6LU2KNsD4N9_XnTiwbKT8VRDdBZMk1Knkvm-V87q_s3HDQ@mail.gmail.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <de84d86d9a8fe394f9481b0b17eae6667c18ec07.1411812968.git.yann.morin.1998@free.fr>
 <CAAXf6LU2KNsD4N9_XnTiwbKT8VRDdBZMk1Knkvm-V87q_s3HDQ@mail.gmail.com>
Message-ID: <20141002191408.GA19775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-02 12:21 +0200, Thomas De Schampheleire spake thusly:
> On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Just force the timezone to be UTC when doing the rendering of the
> > manual, so we are not dependent on the machine or user doign the
> 
> doing

Fixed.

> > rendering.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > ---
> >  package/doc-asciidoc.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> > index 6185982..04c6299 100644
> > --- a/package/doc-asciidoc.mk
> > +++ b/package/doc-asciidoc.mk
> > @@ -93,6 +93,8 @@ define $(2)_$(4)_INSTALL_CMDS
> >  endef
> >  endif
> >
> > +$$(O)/docs/$(1)/$(1).$(6): export TZ=UTC
> > +
> >  ifeq ($(6)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
> >  $$(O)/docs/$(1)/$(1).$(6):
> >         $$(warning PDF generation is disabled because of a bug in \
> > --
> > 1.9.1
> >
> 
> Although I don't mind such a change, I fail to understand the use case
> here. Is this only regarding the printed date at the beginning of the
> manual?

Yes, that's about that. What bothers me is potential for inconsistency.
Also, for something that is world-readable, I usually prefer to read
dates that are not tainted by any local, user-specific timezone. UTC is
a the reference time, so I believe it is better lookign to see UTC than
any other timezone.

Indeed, it's just a trivial (as in: not important) change.

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
