From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 23:26:44 +0100
Subject: [Buildroot] [PATCH 3/3] arc: add support of ARC HS38 core
In-Reply-To: <20141101214723.GK10189@free.fr>
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
 <1414677449-15937-4-git-send-email-abrodkin@synopsys.com>
 <20141101214723.GK10189@free.fr>
Message-ID: <20141101222644.GM10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2014-11-01 22:47 +0100, Yann E. MORIN spake thusly:
> On 2014-10-30 16:57 +0300, Alexey Brodkin spake thusly:
> > Synopsys has recently announced its new ARC HS38 core that is capable of
> > running Linux -
> > http://www.synopsys.com/dw/ipdir.php?ds=arc-hs38-processor
> > 
> > ARC HS38 is based on ARCv2 ISA and requires special settings of gcc and
> > libc.
> > 
> > Also in case of HS38 atomic extensions (LLOCK/SCOND instructions) are
> > built-in by default, so enabling atomic extensions in Buildroot as well.
> 
> Ditto as for the first patch: are atomics configurable? Ditto the
> proposal if not.

Ditto: I just read your previous explanations, so just forget about that
part. Still the comment below stands...

[--SNIP--]
> > diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> > index c68558f..40a268b 100644
> > --- a/package/uclibc/Config.in
> > +++ b/package/uclibc/Config.in
> > @@ -199,6 +199,7 @@ config BR2_UCLIBC_ARC_TYPE
> >  	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
> >  	default ARC_CPU_700	if BR2_arc750d
> >  	default ARC_CPU_700	if BR2_arc770d
> > +	default ARC_CPU_HS	if BR2_archs38
> 
> Ditto: this is a string, so values must be enclosed between double
> quotes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
