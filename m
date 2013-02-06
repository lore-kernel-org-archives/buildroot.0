From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 22:07:41 +0100
Subject: [Buildroot] [PATCH 5/7] package/ceph: new package
In-Reply-To: <51103C8D.3060202@mind.be>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <2c2dba5f2433d9f8cb2da88b89d131072eb8f3df.1359993560.git.yann.morin.1998@free.fr>
 <51103C8D.3060202@mind.be>
Message-ID: <201302062207.41427.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Monday 04 February 2013 Arnout Vandecappelle wrote:
> On 04/02/13 17:01, Yann E. MORIN wrote:
[--SNIP--]
> > diff --git a/package/ceph/ceph-no-envz.patch b/package/ceph/ceph-no-envz.patch
> > new file mode 100644
> > index 0000000..c0369ba
> > --- /dev/null
> > +++ b/package/ceph/ceph-no-envz.patch
> > @@ -0,0 +1,63 @@
> > +tools+base: do not include envz.h on uClibc
> > +
> > +uClibc does not have envz, and no envz function is in fact used.
> > +So, simply do not include it under uClibc.
>   If it's not used, why not just remove the header (and upstream the patch)?

Well... IIRC, upstream never replied to my patch.
So I kept it as-is, in case we needed to later bump ceph version
with as litle impact as possible.

> > diff --git a/package/ceph/ceph.mk b/package/ceph/ceph.mk
> > new file mode 100644
> > index 0000000..33cee8c
> > --- /dev/null
> > +++ b/package/ceph/ceph.mk
> > @@ -0,0 +1,57 @@
> > +#############################################################
> > +#
> > +# ceph
> > +#
> > +#############################################################
> > +
> > +CEPH_VERSION         = 0.56.2
> > +CEPH_SOURCE          = ceph-$(CEPH_VERSION).tar.bz2
> > +CEPH_SITE            = http://ceph.com/download/
> > +CEPH_LICENSE         = LGPLv2.1 CC-BY-SA Apache-2.0 GPLv2 LGPLv2+ BSD-3c MIT PD
> 
>   I'm not sure if PD is a generally accepted abbreviation. And I also 
> don't think it is necessary to mention it in the first place (it the 
> entire package is public domain, yes it makes sense, but if it's just 
> part of it then no).

OK, I'll drop it.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
