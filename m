From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 4 Jul 2011 23:54:15 +0200
Subject: [Buildroot] [PATCH 02/28] Fix quoting in default extract command
In-Reply-To: <6e04ff359da24a337ab4fa9232d324fb65e2aeaa.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <6e04ff359da24a337ab4fa9232d324fb65e2aeaa.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201107042354.15816.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 04 July 2011 23:33:19 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
>  package/Makefile.package.in |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 9949b58..0a4c220 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -425,7 +425,8 @@ $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
>  $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
>  
>  # default extract command
> -$(2)_EXTRACT_CMDS ?= $(if $($(2)_SOURCE),$(INFLATE$(suffix $($(2)_SOURCE))) $(DL_DIR)/$($(2)_SOURCE) | \
> +$(2)_EXTRACT_CMDS ?= \
> +	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
>  	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
>  
>  # post-steps hooks
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
