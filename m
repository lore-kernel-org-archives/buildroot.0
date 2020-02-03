From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 3 Feb 2020 11:10:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host configure
 option
In-Reply-To: <20191111040518.7996-1-xiaolin.he@nxp.com>
References: <20191111040518.7996-1-xiaolin.he@nxp.com>
Message-ID: <0cc416d6-453d-c61c-1d54-e526987f5508@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xiaolin,

On 11.11.19 05:05, Xiaolin He wrote:
> Host-sysrepoctl should install yang modules to target
> directory.
>
> Signed-off-by: Xiaolin He <xiaolin.he@nxp.com>
> ---
>   DEVELOPERS                 | 3 +++
>   package/sysrepo/sysrepo.mk | 2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c0863aabc6..41a3935407 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2430,6 +2430,9 @@ F:	package/python-pyusb/
>   N:	Wojciech Nizi?ski <niziak@spox.org>
>   F:	package/fwup/
>   
> +N:	Xiaolin He <xiaolin.he@nxp.com>
> +F:	package/sysrepo/
> +
>   N:	Yann E. MORIN <yann.morin.1998@free.fr>
>   F:	board/friendlyarm/nanopi-neo/
>   F:	configs/nanopi_neo_defconfig
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index 8676158a19..932c8fd5c0 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -58,7 +58,7 @@ HOST_SYSREPO_CONF_OPTS = \
>   	-DCALL_TARGET_BINS_DIRECTLY=OFF \
>   	-DBUILD_EXAMPLES=OFF \
>   	-DBUILD_CPP_EXAMPLES=OFF \
> -	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
> +	-DREPOSITORY_LOC=$(TARGET_DIR)/etc/sysrepo \
>   	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-subscriptions
>   
>   $(eval $(cmake-package))

I think this patch is no longer valid/required for the new version of 
the sysrepo package.


But nevertheless having you as maintainer for the sysrepo package would 
be great. So could you send a new patch only adding you as maintainer?


--

Heiko
