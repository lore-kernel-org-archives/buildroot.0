From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jun 2014 19:47:14 +0200
Subject: [Buildroot] [PATCH 07/11] support/scripts: do not display
 virtual packages in generated lists
In-Reply-To: <CAHXCMM+PxKqL0R==-d1SRJUcrAL_7V9Op=tyAeECvAjKZfcgmw@mail.gmail.com>
References: <cover.1401743146.git.yann.morin.1998@free.fr>
 <0cfa42eb55966a62df475298ffc7b9c045f79862.1401743146.git.yann.morin.1998@free.fr>
 <CAHXCMM+PxKqL0R==-d1SRJUcrAL_7V9Op=tyAeECvAjKZfcgmw@mail.gmail.com>
Message-ID: <20140604174714.GC3325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-06-03 00:53 +0200, Samuel Martin spake thusly:
> On Mon, Jun 2, 2014 at 11:06 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > If a package has both a 'real' and a 'virtual' definition, consider it
> > is a virtual package and do not display it in the generated package list.
> >
> > This is the case for jpeg and cryptodev, that are virtual packages, but
> > also real (but empty) packages used to provide a prompt to enable/disable
> > a choice to select an implementation. In this case, we do not want to
> > list the virtual packages, but only their implementations.
> >
> > So, consider packages that are both real and virtual as virtual packages.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Acked-by: Samuel Martin <s.martin49@gmail.com>
> >
> > ---
> > Changes RFC -> v2:
> >   - fix typoes  (Samuel)
> > ---
> >  support/scripts/gen-manual-lists.py | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> > index e234ef1..a3fb00c 100644
> > --- a/support/scripts/gen-manual-lists.py
> > +++ b/support/scripts/gen-manual-lists.py
> > @@ -279,13 +279,30 @@ class Buildroot:
> >                      pkg_list.append(re.sub(r"(.*?)\.mk", r"\1", file_))
> >              setattr(self, "_package_list", pkg_list)
> >          for pkg in getattr(self, "_package_list"):
> > -            if pattern.match(pkg):
> > -                return True
> > +            if type == 'real' or type == 'both':
> 
> Ooops! I forgot, since you removed the 'both' semantic in the previous
> patch, it should no longer appears here ;-)

Ah, right, I fixed it here. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
