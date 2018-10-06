From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Oct 2018 19:37:50 +0200
Subject: [Buildroot] [PATCH 1/1] nmap: update license
In-Reply-To: <20181006154143.44ec552a@windsurf>
References: <20181004172730.12889-1-fontaine.fabrice@gmail.com>
 <20181006154143.44ec552a@windsurf>
Message-ID: <20181006173750.GF2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabrice, All,

On 2018-10-06 15:41 +0200, Thomas Petazzoni spake thusly:
> On Thu,  4 Oct 2018 19:27:30 +0200, Fabrice Fontaine wrote:
> > nmap is licensed under GPL-2.0 but with exceptions or a commercial
> > license (see COPYING, especially the "IMPORTANT NMAP LICENSE TERMS"
> > part)
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/nmap/nmap.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> > index 420aec82d7..6b7502b02b 100644
> > --- a/package/nmap/nmap.mk
> > +++ b/package/nmap/nmap.mk
> > @@ -10,7 +10,7 @@ NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
> >  NMAP_DEPENDENCIES = libpcap
> >  NMAP_CONF_OPTS = --without-liblua --without-zenmap \
> >  	--with-libdnet=included --with-liblinear=included
> > -NMAP_LICENSE = GPL-2.0
> > +NMAP_LICENSE = GPL-2.0 with exceptions or commercial
> 
> I agree with the GPL-2.0 with exceptions, Debian also calls the license
> nmap-GPL-2
> (https://metadata.ftp-master.debian.org/changelogs/main/n/nmap/nmap_7.70+dfsg1-3_copyright).
> 
> However, I'm not sure about the "or commercial". We used to have that
> for Qt, but dropped it, I'm not sure to remember why. Yann ?

For Wt, we dropped the option of approving the opensource license. See
ce79e0b2306302f50663d587cd423ea427f6f8cb and following commits for the
full explanations.

The underlying reason is that the 'commercial' licensing terms are
negotiated, and different per users, and we never saw any such licnsing
terms, some of which may even prevent redistribution or even forbid any
publicity of the use of that package or whatnot (they are private terms,
they can be whatever).

As such, our licensing info can only act on publicly known information,
i.e. the licening terms that are available when downloading the package.

Note that this only means we have to know the licensing terms; it does
not imply that they be an open source or free license; they can be a
"proprietary" license, as long as it is publicly known.

So, now, about this specific nmap case... After reviwing the COPYING
file, I would just state:

    NMAP_LICENSE = GPL-2.0 w/ exception

But given how specific the nmap project states that they are really
*not* compatible with the GPL-2.0, and as such that exception should
rather be seen as a restriction to the GPL-2.0. So, this is a totally
different license, based on the GPL-2.0, but incompatible with it.

So, in the end, I would just state:

    NMAP_LICENSE = nmap license

and let the user sort the mess on their own, because we can't do much
better... :-/

Regards,
Yann E. MORIN.

> >  NMAP_LICENSE_FILES = COPYING
> >  
> >  # needed by libpcap
> 
> 
> 
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
