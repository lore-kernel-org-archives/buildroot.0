From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 19 Mar 2012 21:58:38 -0500
Subject: [Buildroot] [PATCH] toolchain/microblaze: fix up big-endian
	characteristics
In-Reply-To: <1332186504-27410-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332186504-27410-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAEBucnDj1ZWBSJphDZyEcW8sfKe8OP7bC5QSrduGs5aaOxiyJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need this patch as well.

Thanks,
Spenser

On Mon, Mar 19, 2012 at 2:48 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> The big-endian microblaze external toolchain is missing vital
> characteristics being set, such as LARGEFILE support, IPV6 and so on.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> ?toolchain/toolchain-external/Config.in | ? ?5 +++++
> ?1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 014bfc5..ee79339 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -447,6 +447,11 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
> ?config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
> ? ? ? ?bool "Xilinx Big Endian Microblaze GNU Tools"
> ? ? ? ?depends on BR2_microblazebe
> + ? ? ? select BR2_LARGEFILE
> + ? ? ? select BR2_INET_IPV6
> + ? ? ? select BR2_INET_RPC
> + ? ? ? select BR2_ENABLE_LOCALE
> + ? ? ? select BR2_USE_WCHAR
> ? ? ? ?help
> ? ? ? ? ?Toolchain for the Microblaze architecture, from
> ? ? ? ? ?http://wiki.xilinx.com/mb-gnu-tools
> --
> 1.7.3.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
