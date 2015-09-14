From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Sep 2015 13:37:31 +0100
Subject: [Buildroot] [PATCH v3 3/3] util-linux: put package options in a
 sub-menu
In-Reply-To: <1436842628-29469-3-git-send-email-danomimanchego123@gmail.com>
References: <1436842628-29469-1-git-send-email-danomimanchego123@gmail.com>
 <1436842628-29469-3-git-send-email-danomimanchego123@gmail.com>
Message-ID: <55F6BF8B.4000905@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On 07/14/2015 03:57 AM, Danomi Manchego wrote:
> Hide all the util-linux options in a menuconfig, as the option
> list is quite long.

I also think the list is quite long and util-linux deserves its own submenu.

> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I checked that util-linux option is actually converted into a submenu:

[*] util-linux  --->

Regards,

Vincent.

> ---
>  package/util-linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 042cae0..c8d16d2 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_UTIL_LINUX
> +menuconfig BR2_PACKAGE_UTIL_LINUX
>  	bool "util-linux"
>  	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> 
