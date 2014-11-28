From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Nov 2014 15:15:17 -0300
Subject: [Buildroot] [PATCH branch/next] libgpg-error: bump version to
 1.17
In-Reply-To: <1417190105-22992-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417190105-22992-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5478BBB5.7090604@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/28/2014 12:55 PM, Vicente Olivert Riera wrote:

> - Bump version to 1.17
> - Add a hash file
> - Add a hook to fix cross-compilation
> - Fix license and license files
> - Remove unnecessary <pkg>_CONFIG_SCRIPTS option
> - Add a positive 'depends on' for supported architectures
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libgpg-error/Config.in         |    5 ++
>  package/libgpg-error/libgpg-error.hash |    2 +
>  package/libgpg-error/libgpg-error.mk   |   73 ++++++++++++++++++++++++++++++--
>  3 files changed, 76 insertions(+), 4 deletions(-)
>  create mode 100644 package/libgpg-error/libgpg-error.hash
> 
> diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
> index 8287f98..2b46ffd 100644
> --- a/package/libgpg-error/Config.in
> +++ b/package/libgpg-error/Config.in
> @@ -1,5 +1,10 @@
>  config BR2_PACKAGE_LIBGPG_ERROR
>  	bool "libgpg-error"
> +	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
> +		BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> +		BR2_mk68 || BR2_powerpc || BR2_powerpc64 || \
> +		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || BR2_sh4a || \
> +		BR2_sh4aeb || BR2_sparc || BR2_x86_64

Aaand you're not propagating the new depends to all of the packages that
use libgpg-error... which may not be too wise unless the bump is really
necessary IMHO.
Also ... BR2_mk68, who's that? ;)
Regards.
