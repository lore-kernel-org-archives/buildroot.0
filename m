From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:41:23 +0200
Subject: [Buildroot] [PATCH v4 06/15] arch: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_9
In-Reply-To: <20190620100725.105587-7-giulio.benetti@micronovasrl.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-7-giulio.benetti@micronovasrl.com>
Message-ID: <20190622214123.01ff23dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 12:07:16 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> This new symbol will be used by architectures introduced with gcc 9 and
> by external toolchains based on gcc 9.
> 
> [1] https://gcc.gnu.org/gcc-9/changes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> v3: rebase patch on top of master branch sha1:
>     04efb17c863606cdbc2405d01c3d48d6868c5245 (Giulio)
> ---
>  arch/Config.in             | 4 ++++
>  package/gcc/Config.in.host | 1 +
>  2 files changed, 5 insertions(+)

Applied to master, thanks. Shouldn't we be using this a bit more ?

I believe C-SKY could select BR2_ARCH_NEEDS_GCC_AT_LEAST_9, and ARC
could select BR2_ARCH_NEEDS_GCC_AT_LEAST_8, this would allow to remove
a few "depends !" from package/gcc/Config.in.host.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
