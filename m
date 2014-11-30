From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 12:20:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: disable on nios2
In-Reply-To: <20141130094300.256d43e0@free-electrons.com>
References: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
 <20141130094300.256d43e0@free-electrons.com>
Message-ID: <20141130112049.GA4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 09:43 +0100, Thomas Petazzoni spake thusly:
> On Sat, 29 Nov 2014 19:56:21 +0100, Bernd Kuhls wrote:
> > diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
> > index 5c5306d..c0620d5 100644
> > --- a/package/minidlna/Config.in
> > +++ b/package/minidlna/Config.in
> > @@ -14,6 +14,8 @@ config BR2_PACKAGE_MINIDLNA
> >  	select BR2_PACKAGE_LIBJPEG
> >  	select BR2_PACKAGE_SQLITE
> >  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> > +	# Triggers the _gp link issue
> > +	depends on !BR2_nios2
> 
> Can we instead please blacklist only the specific NIOS II toolchain
> causing the problem?

Well, as Bernd says, both toolchains we support exhibit that bug.

And you already did two similar patches, where you just did what Bernd
submitted for minidlna:
  - f287f0aa crda: disable on NIOS II
  - 50d36731 aiccu: not available on NIOS II

So I think it is a bit too much to ask to just blacklist the affected
toolchains, especially since they all are affected, and we can not build
our own.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
