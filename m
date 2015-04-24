From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 19:37:27 +0200
Subject: [Buildroot] [PATCH 05/30] package/matchbox: make
 matchbox-desktop a real package
In-Reply-To: <55396900.90701@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <40921cd751a3d6dc2bca91cb2ad74001733f6931.1429725549.git.yann.morin.1998@free.fr>
 <55396900.90701@mind.be>
Message-ID: <20150424173727.GC4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-23 23:49 +0200, Arnout Vandecappelle spake thusly:
> On 04/22/15 20:09, Yann E. MORIN wrote:
> > Currently, matchbox-desktop is treated as if it were an option of the
> > matchbox package.
> > 
> > But that's not true, since it is a real package all by itself, with its
> > own archive and its own buildsystem.
> > 
> > So, make it a real package.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  One remark below...
> 
> > ---
> >  package/matchbox/Config.in                  | 7 +------
> >  package/matchbox/matchbox-desktop/Config.in | 5 +++++
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >  create mode 100644 package/matchbox/matchbox-desktop/Config.in
> > 
> > diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> > index e791cea..39aff3c 100644
> > --- a/package/matchbox/Config.in
> > +++ b/package/matchbox/Config.in
> > @@ -22,12 +22,7 @@ if BR2_PACKAGE_MATCHBOX
> >  source "package/matchbox/matchbox-lib/Config.in"
> >  source "package/matchbox/matchbox-wm/Config.in"
> >  source "package/matchbox/matchbox-panel/Config.in"
> > -
> > -config BR2_PACKAGE_MATCHBOX_DESKTOP
> > -	bool "Matchbox Desktop"
> > -	select BR2_PACKAGE_ZLIB
> > -	help
> > -	  A PDA style application launcher or 'item browser'.
> > +source "package/matchbox/matchbox-desktop/Config.in"
> 
>  Note that things should be sorted alphabetically. But I think that can better
> be combined with the one-directory-up patch.

Yup, done.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
