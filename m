From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Mar 2012 09:22:58 +0100
Subject: [Buildroot] [PATCH] package/giblib: fix breakage
In-Reply-To: <20120314075721.68ff49ac@skate>
References: <1331680899-25945-1-git-send-email-yann.morin.1998@free.fr>
 <20120314075721.68ff49ac@skate>
Message-ID: <201203140922.58929.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 14 March 2012 07:57:21 Thomas Petazzoni wrote:
> Le Wed, 14 Mar 2012 00:21:39 +0100,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
> > index 8288b74..b298606 100644
> > --- a/package/giblib/giblib.mk
> > +++ b/package/giblib/giblib.mk
> > @@ -8,7 +8,7 @@ GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
> >  GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
> >  GIBLIB_INSTALL_STAGING = YES
> >  GIBLIB_DEPENDENCIES = imlib2
> > -GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr/lib \
> > -		  --with-imlib2-exec-prefix=$(STAGING)/usr/bin
> > +GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr \
> > +		  --with-imlib2-exec-prefix=$(STAGING)/usr
> 
> s/STAGING/STAGING_DIR/.

As I said: totaly untested! ;-)

> Also, the modification on ./configure should be removed, and instead
> the package marked AUTORECONF=YES. I'll test this this evening.

I tried to run 'autoreconf' manually, and it broke on my machine, so I
decided to make it manually, so that at least we could test the end result
(too late for me yesterday to test it). And if it were to work, then the
patch could be cleaned-up in a second step.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
