From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:16:37 +0200
Subject: [Buildroot] [PATCH] setools: Disable on Blackfin and NIOS II
In-Reply-To: <1437577451-47533-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1437577451-47533-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150722171637.3e419b40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 22 Jul 2015 10:04:11 -0500, Clayton Shotwell wrote:
> The setools package is not currently building on either the NIOS II or
> the Blackfin architectures. Disabling for now.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2ee84c0dc027912e059ca4ae518d6f11fd8317a7/
> http://autobuild.buildroot.net/results/401e4c48f4d865b2722f284f1038e25c5d420f43/
> http://autobuild.buildroot.net/results/e67ef47ea9ff4cbb012d374b3b290fb7bddf7ef3/
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/setools/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/setools/Config.in b/package/setools/Config.in
> index 7c85af6..2e69283 100644
> --- a/package/setools/Config.in
> +++ b/package/setools/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_SETOOLS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_nios2 && !BR2_bfin

I've added a comment above this line explaining why we have those
dependencies, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
