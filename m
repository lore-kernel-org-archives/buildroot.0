From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 15 Mar 2015 17:44:41 +0100
Subject: [Buildroot] [PATCH 3/7] pkg-generic: take into account
 <pkg>_EXTRA_DOWNLOADS to display "Downloading" message
In-Reply-To: <1425147313-17380-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5505B6F9.3000402@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 28/02/2015 19:15, Thomas Petazzoni a ?crit :
> The .stamp_downloaded target displays the "Downloading" message even
> if there is really something to download. However, this logic only
> checks for <pkg>_SOURCE and <pkg>_PATCH: it does not check if
> something needs to be downloaded in <pkg>_EXTRA_DOWNLOADS.
> 
> This commit fixes that, which makes sure that the "Downloading"
> message is displayed if one of the items in <pkg>_EXTRA_DOWNLOADS has
> not yet been downloaded.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1482194..0098b29 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -76,7 +76,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
>  		$(call MESSAGE,"Downloading") ; \
>  	else \
> -		for p in $($(PKG)_PATCH) ; do \
> +		for p in $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
>  			if test ! -e $(DL_DIR)/`basename $$p` ; then \
>  				$(call MESSAGE,"Downloading") ; \
>  				break ; \
> 
