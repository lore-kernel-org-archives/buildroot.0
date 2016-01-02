From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2016 11:10:43 +0100
Subject: [Buildroot] [PATCH 22/84 RFC] package/perl: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <56871AD6.3040702@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <9a9c7803ba0a2c468d0a58f809f1fe8d4539e048.1451076704.git.yann.morin.1998@free.fr>
 <56871AD6.3040702@mind.be>
Message-ID: <20160102101043.GA3477@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-01-02 01:33 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:24, Yann E. MORIN wrote:
> > Move the perl library/modules inclusion to the perl's Config.in.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/Config.in      | 47 -----------------------------------------------
> >  package/perl/Config.in | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 47 insertions(+), 48 deletions(-)
> > 
> [snip]
> > diff --git a/package/perl/Config.in b/package/perl/Config.in
> > index cdd5aab..635a6f8 100644
> > --- a/package/perl/Config.in
> > +++ b/package/perl/Config.in
> > @@ -1,4 +1,4 @@
> > -config BR2_PACKAGE_PERL
> > +menuconfig BR2_PACKAGE_PERL
> >  	bool "perl"
> >  	depends on BR2_USE_MMU # fork()
> >  	help
> > @@ -24,4 +24,50 @@ config BR2_PACKAGE_PERL_MODULES
> >  	  Leave empty for all modules (as far as the external libraries
> >  	  are available).
> >  
> > +comment "Perl libraries/modules"
> 
>  This comment looks pretty weird in xconfig, but OK in menuconfig and something
> definitely needs to be put in there, so OK.

Hmm.. I never use xconfig, because I think xconfig already looks weird to
me. ;-)  But indeed it looks weird. But the "custom modules selection"
looks weird as well (well, I guess all 'string' and 'int' look weird in
xconfig, and gconfig is only so slightly better).

What I'm a bit worried for xconfig and gconfig, is that, if we remove
the "Perl libraries/modules" comment, the "custom modules selection"
just above would seem to indicate that the custom modules are listed
below, which it is not since it is a string option, not a comment.

But Eh... Graybeard speaking... ;-)

> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks! I appreciate you re-reviewed the series! :-)

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> 
> [snip]
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
