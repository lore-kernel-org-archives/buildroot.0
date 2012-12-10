From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Dec 2012 18:49:53 +0100
Subject: [Buildroot] [PATCH 05/51] package/vde2: new package
In-Reply-To: <50C58418.3060201@mind.be>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-6-git-send-email-yann.morin.1998@free.fr>
 <50C58418.3060201@mind.be>
Message-ID: <201212101849.53568.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Monday 10 December 2012 Arnout Vandecappelle wrote:
> On 09/12/12 17:34, Yann E. MORIN wrote:
[--SNIP--]
> > diff --git a/package/vde2/Config.in b/package/vde2/Config.in
> > new file mode 100644
> > index 0000000..1591bc4
> > --- /dev/null
> > +++ b/package/vde2/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_VDE2
> > +	bool "vde2"
> > +	help
> > +	  VDE is an ethernet compliant virtual network that can be
> > +	  spawned over a set of physical computer over the Internet.
> 
>   computer -> computers
> 
> > +	  VDE is part of virtualsquare project.
> 
>   _the_ virtualsquare project.

Well, I just copy-pasted what's on the VDE website:
> > +	  http://vde.sourceforge.net/

I'll fix that (although I'm very keen on keeping the exact same wording
as used by upstream).

[--SNIP--]
> > diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
> > new file mode 100644
> > index 0000000..b2e0fea
> > --- /dev/null
> > +++ b/package/vde2/vde2.mk
> > @@ -0,0 +1,36 @@
> > +#############################################################
> > +#
> > +# vde2
> > +#
> > +#############################################################
> > +
> > +VDE2_VERSION         = 2.3.2
> > +VDE2_SOURCE          = vde2-$(VDE2_VERSION).tar.bz2
> > +VDE2_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
> 
>   Should be a downloads.sourceforge.net URL.

Yes, right. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
