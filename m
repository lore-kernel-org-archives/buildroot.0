From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 16 Jul 2015 12:17:36 +0200
Subject: [Buildroot] [PATCH v2 4/4] Makefile: staging symlink uses a
	relative path
In-Reply-To: <1436775527-2484-5-git-send-email-s.martin49@gmail.com>
References: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
 <1436775527-2484-5-git-send-email-s.martin49@gmail.com>
Message-ID: <6195872.eqbV4amuVy@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,

On Monday 13 July 2015 10:18:47 Samuel Martin wrote:
> A step forward toward a relocatable SDK.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index daf692e..30a2d0e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -447,7 +447,7 @@ $(STAGING_DIR):
>  	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
>  	@mkdir -p $(STAGING_DIR)/usr/include
>  	@mkdir -p $(STAGING_DIR)/usr/bin
> -	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> +	@ln -snf $(subst $(BASE_DIR)/,,$(STAGING_DIR)) $(BASE_DIR)/staging
Does it work if user customize BR2_HOST_DIR?

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
