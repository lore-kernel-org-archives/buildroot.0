From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Feb 2014 00:24:13 +0100
Subject: [Buildroot] [PATCH 06/10] package/dvb-apps: requires kernel
 headers >= 3.3
In-Reply-To: <53029283.2050605@mind.be>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <21fff62b035accc9a65fb3dc547956de77c4e27d.1392571021.git.yann.morin.1998@free.fr>
 <53029283.2050605@mind.be>
Message-ID: <20140217232413.GE3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-02-17 23:51 +0100, Arnout Vandecappelle spake thusly:
> On 16/02/14 18:27, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > dvb-apps requires linux kernel headers >= 3.3, for:
> >     SYS_TURBO, SYS_DVBC_ANNEX_A      : introduced in 3.2
> >     SYS_DVBC_ANNEX_C, DTV_ENUM_DELSYS: introduced in 3.3
> > 
> > Fixes:
> >     http://autobuild.buildroot.net/results/a77/a7786dffa28e5472fbc9c8fe4ab302c84d7a3cb9
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/dvb-apps/Config.in | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
> > index ba3ce45..ea0a12f 100644
> > --- a/package/dvb-apps/Config.in
> > +++ b/package/dvb-apps/Config.in
> > @@ -8,13 +8,14 @@ config BR2_PACKAGE_DVB_APPS
> >  
> >  if BR2_PACKAGE_DVB_APPS
> >  
> > -comment "dvb-apps utils needs a toolchain w/ largefile, threads"
> > -	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> > +comment "dvb-apps utils needs a toolchain w/ largefile, threads, headers >= 3.3"
> 
>  Note that on a 80-column display it already breaks off after threads.
> How do we deal with that in general? Split over two comments, or ignore?

I would not like to see multi-line comments.

I am of the opinion that we do our best to work with small terminals,
but do not be over-zealous on enforcing this.

After all, we're in the third millenium, now. 80-char-wide terminals are
so second millenium! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
