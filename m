From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jul 2013 14:41:04 +0200
Subject: [Buildroot] [PATCH] package/libedit: switch to alternate URL
	for proper packaging
In-Reply-To: <CAAXf6LVP6zfazXkZx-=CcVsbmR0h7OZd+e0_jimB0tyWQ-XpxQ@mail.gmail.com>
References: <1375051794-19671-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LVP6zfazXkZx-=CcVsbmR0h7OZd+e0_jimB0tyWQ-XpxQ@mail.gmail.com>
Message-ID: <201307291441.04346.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 29 July 2013 14:30:53 Thomas De Schampheleire wrote:
> On Mon, Jul 29, 2013 at 12:49 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > diff --git a/package/libedit/Config.in b/package/libedit/Config.in
> > index 7a515db..7345cc9 100644
> > --- a/package/libedit/Config.in
> > +++ b/package/libedit/Config.in
> > @@ -1,15 +1,19 @@
> >  config BR2_PACKAGE_LIBEDIT
> >         bool "libedit"
> >         depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )  # libbsd
> This architecture dependency is only needed if you have libbsd.
> You can build libedit for powerpc without problems, so I think the
> current dependency is not correct.

Doh! Right.

> > -       depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
> You removed this, but not in the Config.in comment below. Is this correct?
> Also here, I think it only matters when you are using libbsd, right?

Right-o-right, too.

Thanks for spotting those. I'll fix and resubmit tonight.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
