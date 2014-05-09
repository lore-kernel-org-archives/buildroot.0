From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 May 2014 17:28:56 +0200
Subject: [Buildroot] [PATCH 3/7] graph-depends: handle the depth
 argument in a more pythonic way
In-Reply-To: <CAHXCMMJSZsKT+jaE0VXoAzJvXmR8e6vEPR2tR988AqT7d5xXQg@mail.gmail.com>
References: <cover.1399647182.git.yann.morin.1998@free.fr>
 <c7673129299755f4b0d5f309796cd4bdb55226c2.1399647182.git.yann.morin.1998@free.fr>
 <CAHXCMMJSZsKT+jaE0VXoAzJvXmR8e6vEPR2tR988AqT7d5xXQg@mail.gmail.com>
Message-ID: <20140509152856.GG3173@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-05-09 17:14 +0200, Samuel Martin spake thusly:
> Yann, all,
> 
> On Fri, May 9, 2014 at 4:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Add some comment as well, enhance help text.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  support/scripts/graph-depends | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> > index 5bfbc64..dd8b549 100755
> > --- a/support/scripts/graph-depends
> > +++ b/support/scripts/graph-depends
> > @@ -33,13 +33,16 @@ FULL_MODE = 1
> >  PKG_MODE  = 2
> >
> >  mode = 0
> > +
> > +# Limit drawing the dependency graph to this depth. 0 means 'no limit'.
> >  max_depth = 0
> >
> >  parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
> >  parser.add_argument("--package", '-p', metavar="PACKAGE",
> >                      help="Graph the dependencies of PACKAGE")
> > -parser.add_argument("--depth", '-d', metavar="DEPTH",
> > -                    help="Limit the dependency graph to DEPTH levels")
> > +parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth",
> > +                    help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
> > +parser.set_defaults(depth=0)
> 
> You can also do:
> 
> parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth",
>     help="Limit the dependency graph to DEPTH levels; 0 means no limit.",
>     type=int, default=0)

Aha! Nice! Thank you. :-)

Then I suppose that:    max_depth = int(args.depth)
has to be just:         max_depth = args.depth
Right?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
