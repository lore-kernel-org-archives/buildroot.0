From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 5 Apr 2011 22:06:41 +0200
Subject: [Buildroot] Installing native toolchain to target with
	Crosstool-NG
In-Reply-To: <20110405215606.2dbb6c88@surf>
References: <4D9ACA75.8040203@linux-ink.ru> <20110405215606.2dbb6c88@surf>
Message-ID: <201104052206.41831.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tuesday 05 April 2011 21:56:06 Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 05 Apr 2011 11:53:25 +0400
> "a.dobrov" <a.dobrov@linux-ink.ru> wrote:
> 
> > I need to have the development environment (cross-native toolchain?)
> > on the target with glibc. How to do it in Buildroot with Crosstool-NG 
> > toolchain?
> 
> As of today, as far as I know, nobody as ever worked on native
> toolchain support when the CT-NG backend or the external toolchain
> backend are used.

Also, you can't use crosstool-NG to generate the cross-native toolchain.
It is not currently functional at all. See:
  http://sourceware.org/ml/crossgcc/2011-03/msg00126.html
  http://sourceware.org/ml/crossgcc/2011-03/msg00128.html

( Note: this applies only to building the cross-native toolchain! Of
course you can use crosstool-NG to build the cross toolchain! ;-) )

> Generally speaking, our support for the native toolchain (i.E toolchain
> inside the target) is not really good, as Buildroot is meant to be a
> cross-compiling environment, so compiling on the target shouldn't be
> needed.
> 
> Of course, improvements in this area are welcome.

Ditto for crosstool-NG! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
