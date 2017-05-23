From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:37:11 +0200
Subject: [Buildroot] [PATCH] toolchain: disable PIE for static build
 with musl
In-Reply-To: <e5ceac77a5ace9cfb989319cb33261d32885bd04.1495490829.git.baruch@tkos.co.il>
References: <e5ceac77a5ace9cfb989319cb33261d32885bd04.1495490829.git.baruch@tkos.co.il>
Message-ID: <20170523153711.470cb291@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 May 2017 01:07:09 +0300, Baruch Siach wrote:
> As mentioned in commit 3c93901bcd2 (toolchain: add hidden symbol for PIE
> support), support for static PIE using musl requires a gcc patch[1]. Buildroot
> doesn't carry this patch. Don't enable BR2_TOOLCHAIN_SUPPORTS_PIE in static
> build with musl.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d19/d19bcfcfb33cc5f5b082b97bbd5852d479823b97/
> http://autobuild.buildroot.net/results/91f/91f7c6954c337b03f5ac141050d9b1bee1623376/
> http://autobuild.buildroot.net/results/996/996116da9241686110b9525eed08cc5acfd379a6/
> 
> [1] https://github.com/richfelker/musl-cross-make/blob/b854a42fc1ea19b8c4ec7104848f9d1a6d7995f0/patches/gcc-6.3.0/0010-static-pie-support.diff
> 
> Acked-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  toolchain/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
