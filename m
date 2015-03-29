From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 22:49:15 +0200
Subject: [Buildroot] [PATCH 03/35] pkg-generic: take into account
 <pkg>_EXTRA_DOWNLOADS to display "Downloading" message
In-Reply-To: <1427650429-9293-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329204915.GD4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
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
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b44d476..003fd69 100644
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
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
