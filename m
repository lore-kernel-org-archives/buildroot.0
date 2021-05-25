From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 22:54:57 +0200
Subject: [Buildroot] [PATCHv3 05/15] package/sysrepo: use default
 CMAKE_BUILD_TYPE for host package
In-Reply-To: <20210525122750.5022-6-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-6-patrickdepinguin@gmail.com>
Message-ID: <6f19e68f-2058-8a92-a0a7-408ef61d3abd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Use the default build type for host-sysrepo.
> In the current version of sysrepo, this happens to be 'Debug'.
> As 'Debug' also enables tests, explicitly disable them.
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/sysrepo/sysrepo.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index dbc7b16b63..f5be29d2c9 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -26,8 +26,9 @@ define SYSREPO_INSTALL_INIT_SYSV
>  endef
>  
>  HOST_SYSREPO_CONF_OPTS = \
> -	-DCMAKE_BUILD_TYPE=Release \
>  	-DBUILD_EXAMPLES=OFF \
> +	-DENABLE_TESTS=OFF \
> +	-DENABLE_VALGRIND_TESTS=OFF \
>  	-DREPO_PATH=$(TARGET_DIR)/etc/sysrepo
>  
>  $(eval $(cmake-package))
> 
