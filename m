From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 23:41:36 +0200
Subject: [Buildroot] [PATCHv2 17/21] pkg-download: fix indentation for
 SOURCE_CHECK_* macros
In-Reply-To: <1428856685-4403-18-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-18-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D8990.8080100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:38, Thomas Petazzoni wrote:
> Some of the SOURCE_CHECK_* macros are using a non-standard two-spaces
> indentation. This commit switches them to use a single tab based
> indentation, like in the rest of Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
with git show -w

 Regards,
 Arnout

> ---
>  package/pkg-download.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 8cd168a..f35dc04 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -87,7 +87,7 @@ endef
>  # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
>  # repository
>  define SOURCE_CHECK_GIT
> -  $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
> +	$(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
>  endef
>  
>  define DOWNLOAD_BZR
> @@ -131,7 +131,7 @@ define DOWNLOAD_SVN
>  endef
>  
>  define SOURCE_CHECK_SVN
> -  $(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
> +	$(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
>  endef
>  
>  # SCP URIs should be of the form scp://[user@]host:filepath
> @@ -163,7 +163,7 @@ endef
>  # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
>  # repository
>  define SOURCE_CHECK_HG
> -  $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
> +	$(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
>  endef
>  
>  define DOWNLOAD_WGET
> @@ -176,7 +176,7 @@ define DOWNLOAD_WGET
>  endef
>  
>  define SOURCE_CHECK_WGET
> -  $(WGET) --spider '$(call qstrip,$(1))'
> +	$(WGET) --spider '$(call qstrip,$(1))'
>  endef
>  
>  define DOWNLOAD_LOCALFILES
> @@ -189,7 +189,7 @@ define DOWNLOAD_LOCALFILES
>  endef
>  
>  define SOURCE_CHECK_LOCALFILES
> -  test -e $(call stripurischeme,$(call qstrip,$(1)))
> +	test -e $(call stripurischeme,$(call qstrip,$(1)))
>  endef
>  
>  ################################################################################
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
