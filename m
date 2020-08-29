From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 23:14:25 +0200
Subject: [Buildroot] [PATCH] package/uclibc: use HOSTCC_NOCCACHE as
 kconfig HOSTCC
In-Reply-To: <20200829230349.133ba05a@windsurf.home>
References: <20200829203720.28230-1-yann.morin.1998@free.fr>
 <20200829230349.133ba05a@windsurf.home>
Message-ID: <20200829211425.GK14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-29 23:03 +0200, Thomas Petazzoni spake thusly:
> On Sat, 29 Aug 2020 22:37:20 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > uclibc is part of the toolchain, and as such does not have a dependency
> > on it. As a consequence, it does not have a dependency on host-ccache,
> > when this is needed.
> > 
> > Usually, host-ccache is built before uclibc, as part of the dependency
> > of gcc-initial, hiot-binutils, and a few other host packages that are
> hiot-binutils -> host-binutils

Applied to master with this typo now fixed. thanks!

> > built before uclibc.
> > 
> > However, during top-level parallel builds, this ordering is only ever
> > guaranteed at the beginning of the configure step, and not before.
> > 
> > But for kconfig-packages, the moment we apply the configuration to
> > prepare the .config file is a pseudo step that happens somewhere in
> > limbo between the patch step and the configure step. As such, the
> 
> I like the "happens somewhere in limbo", that's a good description of
> how the kconfig stuff works :-)

Hehe! ;-)

> > Reported-by: Raphael Jacob <r.jacob2002@gmail.com>
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Thanks for the great investigation!

It took more time to write the commit log than to find the issue. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
