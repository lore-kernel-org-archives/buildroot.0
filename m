From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Mar 2013 01:02:06 +0100
Subject: [Buildroot] [PATCH 6/6] package/mtools: new host-package
In-Reply-To: <20130310124944.261867c4@skate>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <296699691239a90d5118c5cbe72f1ff57b3761a5.1362693294.git.yann.morin.1998@free.fr>
 <20130310124944.261867c4@skate>
Message-ID: <201303110102.06732.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Luca, All,

On Sunday 10 March 2013 Thomas Petazzoni wrote:
> On Thu,  7 Mar 2013 22:55:31 +0100, Yann E. MORIN wrote:
> 
> > +MTOOLS_VERSION  = 4.0.18
> > +MTOOLS_SOURCE   = mtools-$(MTOOLS_VERSION).tar.bz2
> > +MTOOLS_SITE     = $(BR2_GNU_MIRROR)/mtools/
> 
> MTOOLS_LICENSE = GPLv3+
> MTOOLS_LICENSE_FILES = COPYING

Done.

> However, this makes me realize that we don't distinguish host packages
> from target packages in the manifest.csv file. For example, once I had
> the licensing informations for this mtools file, I have the following
> line in my manifest.csv:
> 
> "mtools","4.0.18","GPLv3+","COPYING","mtools-4.0.18.tar.bz2"
> 
> And then, someone might think "damn, I have some GPLv3 software in my
> system, I now need to comply with the additional special requirements
> of GPLv3", while in fact it's not the case (as far as I know) because
> mtools is not distributed on the embedded device. Maybe we need to
> explicit which packages are on the target, which packages are on the
> host, and which packages are on both, no?

Yes, fully agreed; this would be very puzzling.

I would suggest that we not install licensing information about host
packages, unless they are also used on the target.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
