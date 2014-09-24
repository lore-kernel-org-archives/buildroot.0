From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Sep 2014 23:16:13 +0200
Subject: [Buildroot] [PATCH 20/23 v5] docs/asciidoc: call $(pkgname) and
 $(pkgdir) in a single place
In-Reply-To: <CAAXf6LV8EEHmdGytMkdCYX+CiD-UdN1PBuEU5DPkV7N_K5vnXg@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <b0636122e2367750eece267d01b569286603652d.1410692671.git.yann.morin.1998@free.fr>
 <CAAXf6LV8EEHmdGytMkdCYX+CiD-UdN1PBuEU5DPkV7N_K5vnXg@mail.gmail.com>
Message-ID: <20140924211613.GE3750@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-24 21:44 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Like for all the package infrastructures, retrieve the package name and
> > directory in the front-end macro-variable, rather than everywhere in the
> > backend macro.
> >
> > This allows us to clean up the ASCIIDOC macro, by removing all the calls
> > to $(pkgname) and $(pkgdir), and to UPPERCASE (which made the macro a
> > bit difficult to read.)
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > ---
> >  package/doc-asciidoc.mk | 39 ++++++++++++++++++++++-----------------
> >  1 file changed, 22 insertions(+), 17 deletions(-)
> >
> > diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> > index 4366f8a..38c9ced 100644
> > --- a/package/doc-asciidoc.mk
> > +++ b/package/doc-asciidoc.mk
> > @@ -104,6 +104,11 @@ endef
> >  ################################################################################
> >  # ASCIIDOC -- generates the make targets needed to build asciidoc documentation.
> >  #
> > +# argument 1 is the lowercase name of the document; the document's main file
> > +#            must have the same name, with the .txt extension
> > +# argument 2 is the uppercase name of the document
> > +# argument 3 is the directory containing the document's sources
> > +#
> >  # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
> >  # The variable <DOCUMENT_NAME>_RESSOURCES defines where the document's
> >  # resources, such as images, are located; must be an absolute path.
> > @@ -111,43 +116,43 @@ endef
> >  define ASCIIDOC
> >  # Single line, because splitting a foreach is not easy...
> >  $(pkgname)-check-dependencies: asciidoc-check-dependencies
> 
> Any reason why you did not change this occurrence of $(pkgname) ?

Gee... Drools... Yes, I missed that one.

> Other than that, I like the simplification brought by this patch!

So do I, so do I! ;-)

> Note that the order strikes me as odd. If you'd have made this change
> somewhere in the beginning of the series, the rest of the patches
> would have been simpler to read too. (no need to change this though,
> just an observation).

Yes, I wanted to re-order the series so it was more logical, and bring
cleanups before actual changes.

However, as we discussed on IRC, this series is a real rebase-and-merge
nightmare...

I'll try to see what I can do, but I'm afraid I'll keep this series in
the current order. :-(

At one point, I even considered trashing it and redoing it all from
scratch, but that's just as insane. :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
