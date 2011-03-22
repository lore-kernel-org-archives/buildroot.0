From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 22 Mar 2011 17:10:32 +0100
Subject: [Buildroot] problems compiling crosstools-ng
In-Reply-To: <cd12ab38cf1fa34fa4c10dfaf6eec135@basementcode.com>
References: <cd12ab38cf1fa34fa4c10dfaf6eec135@basementcode.com>
Message-ID: <201103221710.32592.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cris, All,

On Tuesday 22 March 2011 15:24:39 chris at basementcode.com wrote:
>  I'm not sure if this belongs in the crosstools mailing list, or the 
>  buildroot mailing list, so sorry if this in the wrong place.

Basically, I'd say:
- if crosstool-NG works OK standalone, but fails in buildroot with the
  same options, then the issue is to be reported here, on the BR ML,
- but if crosstool-NG does not work standalone with the same config
  options, then please report to the crossgcc ML.

>  buildroot-2010.11:
>  m4 gives and error and says "--gnu" is not a valid option.
>  I have m4-1.4.15 installed, and the man page says that --gnu is valid.
>  Does buildroot have another copy of m4?

Do you mean the m4 built by buildroot as a package, or the m4 built by
crosstool-NG as part of the companion tools (which you should not use,
except under very exceptional conditions) ?

>  buildroot-2011.02:
>  during the configure stage of binutils the configure script spawns the 
>  following process over and over until swap is filled and the system 
>  crashes:
>  makeinfo --force --force --force --force --force --force --force 
>  --force --force --force --force  ......

Yes, I know about this issue. You're not the first one to report it, but I
was not able to reproduce it, not to understand how it can happen (although
I have a small idea, but I'm not sure)

I'm doing some changes right now, that should fix the issue if all goes well.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
