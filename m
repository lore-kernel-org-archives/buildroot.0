From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 17:13:57 +0100
Subject: [Buildroot] [PATCH] toolchain: improve SSP logic
In-Reply-To: <1457453323-11947-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1457453323-11947-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160308171357.309278e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

On Tue, 8 Mar 2016 16:08:43 +0000, Vicente Olivert Riera wrote:
> Don't enable SSP support on toolchains just because they use glibc or
> musl. Instead of that, make the toolchains to declare if they support
> SSP or not. And also add a check to detect SSP support when using custom
> external toolchains.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/Config.in                                |  2 --
>  toolchain/helpers.mk                               | 17 ++++++++++++++++
>  toolchain/toolchain-external/Config.in             | 23 ++++++++++++++++++++--
>  toolchain/toolchain-external/toolchain-external.mk |  1 +
>  4 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index fc30c6e..e0044c1 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -15,7 +15,6 @@ config BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
> -	select BR2_TOOLCHAIN_HAS_SSP
>  
>  config BR2_TOOLCHAIN_USES_UCLIBC
>  	bool
> @@ -27,7 +26,6 @@ config BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	select BR2_TOOLCHAIN_HAS_SSP
>  
>  choice
>  	prompt "Toolchain type"

I think this patch is incomplete because you are now saying that all
glibc and musl toolchains no longer have SSP support, and only
re-enable SSP support for external toolchains on a per-toolchain basis.
Sounds good for external toolchains.

But what about internal glibc and musl toolchains ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
