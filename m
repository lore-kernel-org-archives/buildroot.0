From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 11:02:25 +0200
Subject: [Buildroot] [PATCH] package/systemd: importd broken on Sourcery
 CodeBench ARM 2014.05
In-Reply-To: <1468187781-7497-1-git-send-email-yann.morin.1998@free.fr>
References: <1468187781-7497-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160711110225.19dfaa5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jul 2016 23:56:21 +0200, Yann E. MORIN wrote:
> This toolchain uses glibc-2.18, which is tool old to provide O_TMPFILE,
> which was added only in glibc-2.19.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/systemd/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 4a2aa33..48e6c45 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -145,6 +145,8 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
>  	bool "enable import daemon"
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
> +	# This toolchain has glibc-2.18, too old to provide O_TMPFILE
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM

So is the problem a kernel headers problem, or a glibc version problem ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
