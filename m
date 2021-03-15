From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Mar 2021 20:59:00 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: enable
 B.A.T.M.A.N. V protocol by default
In-Reply-To: <20210314223207.13460-2-ps.report@gmx.net>
References: <20210314223207.13460-1-ps.report@gmx.net>
 <20210314223207.13460-2-ps.report@gmx.net>
Message-ID: <20210315195900.GS2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-14 23:32 +0100, Peter Seiderer spake thusly:
> As upstream enables CONFIG_BATMAN_ADV_BATMAN_V option since
> 2018.2 by defaullt ([1]) honor this in buildroot and do
> the same (and remove the leagcy experimental comment accordingly).
> 
> [1] https://git.open-mesh.org/batman-adv.git/blob/HEAD:/CHANGELOG.rst#l174
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/batman-adv/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
> index 9d3d7967b9..f3ac974296 100644
> --- a/package/batman-adv/Config.in
> +++ b/package/batman-adv/Config.in
> @@ -25,11 +25,10 @@ config BR2_PACKAGE_BATMAN_ADV_NC
>  	  https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding
>  
>  config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
> -	bool "enable B.A.T.M.A.N. V protocol (experimental)"
> +	bool "enable B.A.T.M.A.N. V protocol"

Upstream seems to still consider this to be experimental [0].

> +	default y

What we talked about earlier [1], was to always enable it, not to change
the default.

Now, people that have a defconfig file with BATMAN-V disabled (i.e.
there would be nothing in the defconfig as 'is not set' is the default),
will have it enabled now.

So, if upstream recommends to not disable it (do you have a ref?), then
we should just drop our option, and to always enable it.

Thoughts?

[0] https://git.open-mesh.org/batman-adv.git/blob/HEAD:/Makefile#l7
[1] http://lists.busybox.net/pipermail/buildroot/2021-March/305811.html

Regards,
Yann E. MORIN.

>  	help
>  	  Enables B.A.T.M.A.N. V network protocol.
> -	  This is the next-gen protocol and is experimental at this
> -	  time.
>  
>  	  https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V
>  
> -- 
> 2.30.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
