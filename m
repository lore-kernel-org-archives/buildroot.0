From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Oct 2016 17:03:35 +0200
Subject: [Buildroot] [PATCH] core/legal-info: allow ignoring packages
 from the legal-info
In-Reply-To: <CAHXCMMJDzgm9f0o2xNbeQq53zem3OHOyJ03=G-QWZz=EN_oHmQ@mail.gmail.com>
References: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
 <CAHXCMMJDzgm9f0o2xNbeQq53zem3OHOyJ03=G-QWZz=EN_oHmQ@mail.gmail.com>
Message-ID: <20161015150335.GF3668@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2016-10-15 16:58 +0200, Samuel Martin spake thusly:
> On Sat, Oct 15, 2016 at 3:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > It might be necessary to not even mention a package in the output of
> > legal-info:
> >
> >   - virtual packages have virtually nothing to save in the legal-info
> >     output;
> >
> >   - for proprietary packages, it might not even be legal to even
> >     mention them, being under NDA or some other such restrictive
> >     conditions.
> >
> > Introduce the new FOO_GEN_LEGAL_INFO variable that a package can set
> > to 'NO' (default to 'YES') to indicate that the package should be
> > completely ignored from the legal-info output, in which case the
> > package is not mentioned in the maniufest, its source archive,
> s/maniufest/manifest/

Fixed.

> > patches and license files are not saved into legal-info/ .
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> >
> > ---
> > Note: the name of the variable if up for discussion. However, this will
> s/if up/is up/

Fixed.

> > most probably never be used in Buildroot itself, but only in local
> > proprietary forks or br2-external trees. So we will probably never ever
> > see it publicly. So, we do not care much about that variable name...
> Yann, you mention setting FOO_GEN_LEGAL_INFO=NO could benefit to
> virtual packages, but I see no change/patch on the virtual-package
> infrastructure. Did I miss something?

Indeed. No, you did not miss anything: I did not (yet) change the
virtual packages. I'll do so when this patch gets applied (after all the
controversy about it have been shaken out).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
