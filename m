From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 21:23:55 +0100
Subject: [Buildroot] [PATCH 0/7] gcc5 fixes for defconfigs
In-Reply-To: <20170228174001.23830-1-arnout@mind.be>
References: <20170228174001.23830-1-arnout@mind.be>
Message-ID: <20170228212355.36a91c98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 18:39:54 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
>  Ever since we switched to gcc5 as default, a number of defconfigs have
> been failing. Since we currently don't test the defconfigs this went
> largely unnoticed.
> 
>  This series fixes the remaining defconfigs. Since I don't have access
> to most of the boards, I couldn't test the changes, so I've opted for
> the safe fix: apply the patch that adds gcc5 support to kernel and boot
> loader.
> 
>  To avoid repeating the same exercise when we switch to gcc6 as default,
> I've opted for the patch that removes the version-specific
> compiler-gcc[345].h.
> 
>  Since the same kernel patch is used by a number of defconfigs, I've
> put it in a common directory under board/, and use BR2_GLOBAL_PATCH_DIR
> to refer to it. For U-Boot that wasn't possible because the context is
> always slightly different. Therefore the patches are in board-specific
> directories. The two Altera platforms can still share some of the
> patches.
> 
>  This series has only been build-tested, not runtime tested. However,
> the compiler-gcc.h change should be safe (if it breaks something, it
> would be compilation itself because a definition is missing).
> 
>  Note: the yocto repository used by minnowboard_defconfig seems to be
> either broken or unreliable. AFAIK minnowboard should be fully supported
> by the upstream kernel, so it would be nice if someone who has the board
> could try that.

Thanks for all this work.

However, it has already been noticed a while ago that these defconfigs
were broken, I did a build test of all defconfigs some time ago, and
reported the issue to the developers who contributed the defconfig
originally. Peter also helped in this effort. See e-mails like:

   [Buildroot] Altera socdk defconfig no longer builds
   [Buildroot] Altera sockit defconfig no longer builds
   [Buildroot] via_imx6_vab820_defconfig fails to build
   etc.

For all the boards you are fixing now, Peter or me contacted the
original submitters. If they haven't been fixed by now, then I would
instead suggest to simply drop support for those boards.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
