From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 10:42:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng : fix build with
 toolchain header.
In-Reply-To: <20200827083027.13959-1-jugurtha.belkalem@smile.fr>
References: <20200827083027.13959-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200827104212.120dd0e5@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title is not correct, it's not "fixing build with toolchain
header", it's "add dependency on Linux headers >= 3.14".

On Thu, 27 Aug 2020 10:30:27 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> Iptraf-ng is compatible with Linux 3.14 as the last
> introduced various packet types like : PACKET_KERNEL and PACKET_USERSPACE[1].
> 
> [1] https://elixir.bootlin.com/linux/v3.14-rc1/source/include/uapi/linux/if_packet.h
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  package/iptraf-ng/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
> index f240daf93d..ffe80292c9 100644
> --- a/package/iptraf-ng/Config.in
> +++ b/package/iptraf-ng/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_IPTRAF_NG
>  	bool "iptraf-ng"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	  IPTraf-ng is a console-based network monitoring program for

You need to update the Config.in comment as well. See how other
packages do this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
