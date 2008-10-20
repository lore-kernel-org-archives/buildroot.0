From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 21 Oct 2008 01:31:29 +0200
Subject: [Buildroot] ext2+isofs initrd too big
In-Reply-To: <e4c675870810200532j2d8412dckfb0593b73eb45938@mail.gmail.com>
References: <e4c675870810181157u69e5e3d4j3ed89b53a414c6f3@mail.gmail.com>
	<e4c675870810181256j11da9c1eha5035bedc7a088a4@mail.gmail.com>
	<e4c675870810181655x1bdf8817l114da029a3a9c807@mail.gmail.com>
	<e4c675870810190300h6274b470nefb816ae6798d301@mail.gmail.com>
	<20081019160520.GI11249@mx.loc>
	<e4c675870810200355g55367c71x351b2ed4ff49751f@mail.gmail.com>
	<e4c675870810200532j2d8412dckfb0593b73eb45938@mail.gmail.com>
Message-ID: <e4c675870810201631r2552ef49waa6c5ec760d8c918@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/20 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> 2008/10/20 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>
>  [cut]
>
>>  I would add another question
>>
>> c) what is the smallest X11 fonts set?

 ^^^ useless question: depends on what I want let run on my Xserver.

 However it is impressing how much space the locale, keyboard and
fonts require comparing binary code!!!

6100	usr/lib/X11/fonts
1272	usr/lib/locale
2348	usr/share/X11/locale
2600	usr/share/X11/xkb
===
12320	42.5% (fonts, locale, xkb)

80		usr/X11R6
384		usr/share - X11
5992	usr/lib - locale - X11/fonts
2452	usr/bin - Xservers + Xvesa
====
8908	30.7% (tinyx)

2056	kernel
3940	lib/modules
====
5996	20.7% (kernel)

1768	busybox + rootfs + lib + everything else
====
1768	6.1% (system)

28992 	TOTAL

 Fonts installed are good to run tinyx (in any language/kb of he
world) but not enough to run blackbox, in this case .


 Cheers,
-- 
/roberto
