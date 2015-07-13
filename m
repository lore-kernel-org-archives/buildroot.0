From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:29:01 +0200
Subject: [Buildroot] [PATCHv3 for next 1/2] toolchain-external: improve
 lib subdirectory matching
In-Reply-To: <1424259375-20288-2-git-send-email-patrickdepinguin@gmail.com>
References: <1424259375-20288-1-git-send-email-patrickdepinguin@gmail.com>
 <1424259375-20288-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150713172901.1b405986@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 18 Feb 2015 12:36:14 +0100, Thomas De Schampheleire wrote:
> From: Bai Yingjie <byj.tea@gmail.com>
> 
> The toolchain from the Cavium Networks Octeon SDK provides a sysroot
> with library directories lib32, lib32-fp, lib64 and lib64-fp. The -fp
> variants are used for processors with hardware floating point unit, such
> as the Octeon III variants.
> 
> When specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, the toolchain
> will use lib32-fp, but currently Buildroot does not accept that pattern.
> 
> This patch improves the matching by accepting lib(32|64)?([^/]*)? as lib
> directory name.
> 
> Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
> [ThomasDS: update commit message]
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I've added a comment above the change in the code to illustrate a bit
the various cases we are trying to handle in these complicated sed
expressions. And then I applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
