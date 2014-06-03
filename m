From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jun 2014 11:38:54 +0300
Subject: [Buildroot] [PATCH] Allow setting the password for user default
In-Reply-To: <1401784167-12663-1-git-send-email-sho@relinux.de>
References: <1401784167-12663-1-git-send-email-sho@relinux.de>
Message-ID: <20140603083854.GE4444@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephan,

On Tue, Jun 03, 2014 at 10:29:27AM +0200, Stephan Hoffmann wrote:
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
> Since we can set the password for root while configuring the system
> it seems logical to have the same possibility for user "default".
> ---
>  system/Config.in | 23 ++++++++++++++++++++++-
>  system/system.mk | 11 ++++++++++-
>  2 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 53bca53..d5408e1 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -194,7 +194,7 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
>  	string "Root password"
>  	default ""
>  	help
> -	  Set the initial root password (in clear). It will be md5-encrypted.
> +	  Set the initial root password (in clear). It will be encrypted.

This should be done in a separate patch.

>  
>  	  If set to empty (the default), then no root password will be set,
>  	  and root will need no password to log in.
> @@ -211,6 +211,27 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
>  	  in the build log! Avoid using a valuable password if either the
>  	  .config file or the build log may be distributed!
>  
> +config BR2_TARGET_GENERIC_DEFAULT_PASSWD
> +	string "Password for user default"
> +	default ""
> +	help
> +	  Set the initial password for user default (in clear). It will be encrypted.

But you can still use this wording here.

baruch

> +
> +	  If set to empty (the default), then no password will be set,
> +	  and default will need no password to log in.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
