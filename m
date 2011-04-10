From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 10 Apr 2011 15:34:06 -0700
Subject: [Buildroot] external-toolchain with CodeSourcery works well
In-Reply-To: <201104102324.27407.yann.morin.1998@anciens.enib.fr>
References: <BANLkTi=hgwAAjD8QhBWoDcOnVy8vwFLCyg@mail.gmail.com>
	<201104102324.27407.yann.morin.1998@anciens.enib.fr>
Message-ID: <BANLkTi=_rmHY=ef-+3YWhDbaCYxdpG64cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the hints, Yann, and I do have a couple of puzzles concerning
directories as it is not quite clear. For instance, I have compiled the
crosstools-ng and have a myriad of directories it created. Things like
<buildDir> /bin /lib /share and under bin a bin/.build.

I gave crosstools-ng  the <buildDir> which obviously buildroot knows nothing
about.

I can see in buildroot's xconfig a string that looks like
"toolchain/toolchain-crosstool-ng/crosstool-ng.config" and as a consequence
the linkage between crosstool-ng and buildroot seems a bit ambiguous to me.

I wonder if you could expound a bit on how that linkage works so I can get
it tested and do a thumbs up for crosstools-ng, please.

Charles

On Sun, Apr 10, 2011 at 2:24 PM, Yann E. MORIN <
yann.morin.1998@anciens.enib.fr> wrote:

> Charles, All,
>
> On Sunday 10 April 2011 21:10:30 Charles Krinke wrote:
> > Now, I am going to attempt to understand a bit about crosstools-ng. Here,
> I
> > am guessing a bit on configuration settings, that is, things like
> prefixes
> > and paths. Any suggestions would be gratefully appreciated.
>
> It all depends on what you are trying to do. Regarding toolchains, here is
> what buildroot can do:
>  1- build its own toolchain using the internal backend
>  2- use a pre-built toolchain already installed on your machine
>  3- use a pre-built CodeSourcery toolchain that it downloads for you
>   (what you did)
>  4- build its own toolchain using the crosstool-NG backend
>
> If you want to build your own toolchain, that you later feed to buildroot
> using 2, then you'd get better chance to post your questions on the
> crosstool-NG mailing list, as it has nothing to do with buildroot.
>
> If you want to use 4, then buildroot handles all the paths and prefixes
> stuff for you, and they are even hidden in the crosstool-NG config
> menu:
>  cd buildroot
>  make menuconfig
>    Toolchain  --->
>      Toolchain type (Crosstool-NG toolchain)
>      [other options at your discretion]
>      [then exit]
>  make ctng-menuconfig
>  [wait till it handles dependencies]
>  [configure crosstool-NG as you need]
>
> Then if you have issues while configuring/building crosstool-NG, please
> direct your questions to the crosstool-NG mailing list. You may keep the
> buildroot mailing list copied, but only on the initial question, and
> then on the final answer, keeping the crosstool-NG discussions on the
> crosstool-NG mailing list.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>     |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110410/e1ae20da/attachment-0001.html>
