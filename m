From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Nov 2017 13:06:46 +0200
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171113102757.ir7so5o7h7zopcvq@dell5510>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
Message-ID: <20171113110646.k7a3i3y2u7l42bjx@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

On Mon, Nov 13, 2017 at 11:27:58AM +0100, Petr Vorel wrote:
> I'm trying to fix failing feh on mips64el [1] (btw an easy fix, just to add 
> -std=c99 or
> -std=c11 to TARGET_CFLAGS either globally or just for this toolchain/architecture).
> 
> But I cannot rebuild it as it fails to pass configure:
> 
> $ make distclean
> $ wget -c http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/config -O .config.old

If you do '-O .config' here, does that work better?

> $ make olddefconfig
> $ make
> make: *** No rule to make target 'toolchain-external-custom', needed by '/home/foo/install/src/buildroot.git/output/build/toolchain-external/.stamp_configured'.  Stop.
> 
> What can be wrong? I've done it this way in the past (with other autobuild items, which
> had different toolchains).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
