From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 22:43:29 +0100
Subject: [Buildroot] [PATCH v2 1/1] [autobuild] configs: update PowerPC
 Kconfig symbols
In-Reply-To: <1451165710-30849-1-git-send-email-romain.naour@gmail.com>
References: <1451165710-30849-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20151230224329.58497fa9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 26 Dec 2015 22:35:10 +0100, Romain Naour wrote:
> The Kconfig symbole BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103

symbol

> has been renamed to BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC in commit
> [1].
> 
> And with [2], the CS PowerPC 2012.03 toolchain became the default toolchain
> when the PPC 8548 is selected. This toolchain doesn't requiere the "-te500v2"

require

> since there is only one sysroot.
> 
> [1] https://git.busybox.net/buildroot/commit/?id=fa4214e21b50b791ec365c64897ac2676b45448a
> [2] http://patchwork.ozlabs.org/patch/561118/

Note that your commit also changes the behavior:
sourcery-powerpc-e500v2 used to be there to test the e500v2 sysroot of
the old CodeSourcery toolchain, as a mean of testing that the external
toolchain logic was working OK for this toolchain.

That being said, I do believe it makes sense to test the new toolchain
as well, so I've applied your change (after fixing the two minor
typos).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
