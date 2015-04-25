From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 19:35:10 +0200
Subject: [Buildroot] [PATCHv3 11/18] pkg-download: get rid of DL_MODE
In-Reply-To: <1429972982-25495-12-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425173510.GL4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
> The DL_MODE variable is now no longer used with any other value than
> "DOWNLOAD", so it no longer makes sense to have this variable at
> all. Therefore, this commit gets rid of it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 76afced..a145011 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -20,10 +20,6 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>  
>  DL_WRAPPER = support/download/dl-wrapper
>  
> -# Default spider mode is 'DOWNLOAD'. Other possible value is
> -# 'SOURCE_CHECK' used by the _source-check target.
> -DL_MODE = DOWNLOAD
> -
>  # DL_DIR may have been set already from the environment
>  ifeq ($(origin DL_DIR),undefined)
>  DL_DIR ?= $(call qstrip,$(BR2_DL_DIR))
> @@ -212,7 +208,7 @@ endef
>  ################################################################################
>  
>  define DOWNLOAD
> -	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),$(DL_MODE))
> +	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
>  endef
>  
>  define SOURCE_CHECK
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
