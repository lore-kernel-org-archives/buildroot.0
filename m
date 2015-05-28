From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 May 2015 19:03:48 +0200
Subject: [Buildroot] [PATCH] support/download: relocate the git clone
	comment
In-Reply-To: <3984ae0102b12ee65d6cf41e2f20bde2d6cea3ae.1432812928.git.baruch@tkos.co.il>
References: <3984ae0102b12ee65d6cf41e2f20bde2d6cea3ae.1432812928.git.baruch@tkos.co.il>
Message-ID: <20150528170348.GA23670@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-05-28 14:35 +0300, Baruch Siach spake thusly:
> Following commit 95a572282e87 (pkg-infra: move the git download helper to a
> script, 2014-07-02), move the comment describing the shallow clone trickery as
> well. Merge this comment with the existing helper comment that was added in
> 7e40a1103a91 (support/download: convert git to use the wrapper, 2014-08-03).
> 
> Rename $($(PKG)_DL_VERSION) to ${cset} to match the helper code context.
> 
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 6 ------
>  support/download/git    | 9 +++++++--
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index f6ed8be56781..c86b9abcff75 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -73,12 +73,6 @@ export BR_NO_CHECK_HASH_FOR =
>  # to get all the sources needed for one's build configuration.
>  ################################################################################
>  
> -# Try a shallow clone - but that only works if the version is a ref (tag or
> -# branch). Before trying to do a shallow clone we check if $($(PKG)_DL_VERSION)
> -# is in the list provided by git ls-remote. If not we fall back on a full clone.
> -#
> -# Messages for the type of clone used are provided to ease debugging in case of
> -# problems
>  define DOWNLOAD_GIT
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
> diff --git a/support/download/git b/support/download/git
> index 73cbc0f7d173..fd5f5392ddec 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -25,8 +25,13 @@ repo="${2}"
>  cset="${3}"
>  basename="${4}"
>  
> -# Try to see if we can do a shallow clone, since it is faster
> -# than a full clone.
> +# Try a shallow clone, since it is faster than a full clone - but that only
> +# works if the version is a ref (tag or branch). Before trying to do a shallow
> +# clone we check if ${cset} is in the list provided by git ls-remote. If not
> +# we fall back on a full clone.
> +#
> +# Messages for the type of clone used are provided to ease debugging in case of
> +# problems
>  git_done=0
>  if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
>      printf "Doing shallow clone\n"
> -- 
> 2.1.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
