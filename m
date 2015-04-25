From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 19:37:31 +0200
Subject: [Buildroot] [PATCHv3 12/18] pkg-download: fix indentation for
 SOURCE_CHECK_* macros
In-Reply-To: <1429972982-25495-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425173730.GM4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
> Some of the SOURCE_CHECK_* macros are using a non-standard two-spaces
> indentation. This commit switches them to use a single tab based
> indentation, like in the rest of Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [with git show -w]
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Superfluous SoB line. ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index a145011..a38062e 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -90,7 +90,7 @@ endef
>  # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
>  # repository
>  define SOURCE_CHECK_GIT
> -  $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
> +	$(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
>  endef
>  
>  define DOWNLOAD_BZR
> @@ -134,7 +134,7 @@ define DOWNLOAD_SVN
>  endef
>  
>  define SOURCE_CHECK_SVN
> -  $(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
> +	$(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
>  endef
>  
>  # SCP URIs should be of the form scp://[user@]host:filepath
> @@ -166,7 +166,7 @@ endef
>  # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
>  # repository
>  define SOURCE_CHECK_HG
> -  $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
> +	$(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
>  endef
>  
>  define DOWNLOAD_WGET
> @@ -179,7 +179,7 @@ define DOWNLOAD_WGET
>  endef
>  
>  define SOURCE_CHECK_WGET
> -  $(WGET) --spider '$(call qstrip,$(1))'
> +	$(WGET) --spider '$(call qstrip,$(1))'
>  endef
>  
>  define DOWNLOAD_LOCALFILES
> @@ -192,7 +192,7 @@ define DOWNLOAD_LOCALFILES
>  endef
>  
>  define SOURCE_CHECK_LOCALFILES
> -  test -e $(call stripurischeme,$(call qstrip,$(1)))
> +	test -e $(call stripurischeme,$(call qstrip,$(1)))
>  endef
>  
>  ################################################################################
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
