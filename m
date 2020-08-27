From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 22:40:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng : add dependency on
 Linux headers >= 3.14
In-Reply-To: <20200827091821.17990-1-jugurtha.belkalem@smile.fr>
References: <20200827091821.17990-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200827224032.442ab9a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2020 11:18:21 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> iptraf-ng uses a number of definitions (like PACKET_KERNEL and
> PACKET_USERSPACE) provided by the Linux kernel headers, which were
> introduced in Linux 3.14[1], so we need to add a dependency on
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14.
> 
> [1] https://elixir.bootlin.com/linux/v3.14-rc1/source/include/uapi/linux/if_packet.h
> 
> """
> Fixes:
> 
>   http://autobuild.buildroot.net/results/480/480b00b4b264cfe1da533c762595d21b72fa8211/build-end.log
> """
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  package/iptraf-ng/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
