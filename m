From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:20:26 +1300
Subject: [Buildroot] [PATCH 1/1] rng-tools: Fix disabling package on
 non-x86 architectures.
In-Reply-To: <20170111161950.28199-1-nicolas.cavallari@green-communications.fr>
References: <20170111161950.28199-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20170124232026.539d5020@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Jan 2017 17:19:50 +0100, Nicolas Cavallari wrote:
> Commit 2f89476 ("package/libgpg-error: bump to version 1.23") introduced
> a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS which was added as a dependency
> to all libgpg-error reverse dependencies.
> 
> However, rng-tools only select libgpg-error if BR2_i386 || BR2_x86_64
> (for RDRAND) but the rng-tools dependency was added as
> BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && (BR2_i386 || BR2_x86_64),
> Therefore limiting rng-tools to the x86 architecture.
> 
> This patch changes it as ..._ARCH_SUPPORT || !(BR2_i386 || BR2_x86_64).
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/rng-tools/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
