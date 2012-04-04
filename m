From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 04 Apr 2012 19:26:43 +0200
Subject: [Buildroot] [PATCH] toolchain/microblaze: fix up
	big-endian	characteristics
In-Reply-To: <1332186504-27410-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332186504-27410-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <4F7C8453.10305@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.03.2012 20:48, schrieb Gustavo Zacarias:
> The big-endian microblaze external toolchain is missing vital
> characteristics being set, such as LARGEFILE support, IPV6 and so on.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Stephan Hoffmann <sho@reLinux.de>
> ---
>  toolchain/toolchain-external/Config.in |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 014bfc5..ee79339 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -447,6 +447,11 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
>  config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
>  	bool "Xilinx Big Endian Microblaze GNU Tools"
>  	depends on BR2_microblazebe
> +	select BR2_LARGEFILE
> +	select BR2_INET_IPV6
> +	select BR2_INET_RPC
> +	select BR2_ENABLE_LOCALE
> +	select BR2_USE_WCHAR
>  	help
>  	  Toolchain for the Microblaze architecture, from
>  	  http://wiki.xilinx.com/mb-gnu-tools


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
