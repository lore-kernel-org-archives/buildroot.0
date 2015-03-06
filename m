From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 00:15:58 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <54F7898A.6090601@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com>
 <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK>
 <54F7898A.6090601@free.fr>
Message-ID: <20150306231558.GE4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, Laurent, All,

On 2015-03-04 23:39 +0100, Laurent Colloud spake thusly:
> On 23/02/15 12:41, Nicolas Serafini wrote:
[--SNIP--]
> >>>And currently, we have X.org server 1.17.1, which implementation the
> >>>video driver ABI version 19. How can this work with the Tegra
> >>>drivers if they only support up to ABI version 14 ?
> >
> >You right, I have only tested with an old version (1.14.7) of X.org so
> >this driver won't work with the 1.17.1 version. I don't know if Nvidia
> >will provide new driver with support of latest ABI version.
> >Currently I have no more hardware with display to test the graphics
> >part.
> 
> I confirm that video playback works on Tegra 3 using X.org v1.14.7.
> As far as I know, Nvidia won't release any new version of those drivers for
> Tegra 2 and Tegra 3 so we'll have to keep using an old version of X.org.

OK, we have the current situation:

  - Buildroot uses Xorg 1.17.1, which implements ABI 19;

  - nvidia-tegra23 only has support for ABI up to 14;

  - NVidia won't update those drivers.

Question: is Xorg ABI backward compatible? I.e. are drivers written for
a specific ABI able to work on a newer ABI?

If yes, then we can package those nvidia-t4egra23 drivers. If no, then
there's no point in packaging them... :-/

Also, as far as I understand, the two users of those drivers, Nicolas
and Laurent, either no longer have the hardware (and thus do not use the
drivers anymore), or are using an old version of Xorg (and presumably,
not using Buildroot).

So, in the end, I wonder if it makes sense to package nvidia-tegra23 in
Buildroot...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
