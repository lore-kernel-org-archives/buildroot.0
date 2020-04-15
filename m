From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Apr 2020 22:30:06 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/python-iptables: add
 explicit dependency on dynamic libs
In-Reply-To: <20200311105447.23808-1-frank.vanbever@essensium.com>
References: <20200228163917.10596-1-frank.vanbever@essensium.com>
 <20200311105447.23808-1-frank.vanbever@essensium.com>
Message-ID: <20200415203006.GI5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2020-03-11 11:54 +0100, Frank Vanbever spake thusly:
> The package uses ctypes.CDLL extensively which only makes sense when dynamic
> libraries are available.
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>

Patches 1, 2, and 4, which are all backports of upstream commits,
applied to master, thanks.

I'm still pondering how to improve patch 3, though, as I concur with
Thomas that it would be nice if we could do better... I'm not gonna
sweat it, though...

Regards,
Yann E. MORIN.

> ---
> v2 -> v3:
>  - None
> v1 -> v2:
>  - Add some additional explanation in commit message.
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
>  package/python-iptables/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/python-iptables/Config.in b/package/python-iptables/Config.in
> index e55359963e..a35577bad3 100644
> --- a/package/python-iptables/Config.in
> +++ b/package/python-iptables/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_PYTHON_IPTABLES
>  	bool "python-iptables"
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_IPTABLES # runtime dependency
>  	help
>  	  Python bindings for iptables.
>  
>  	  https://github.com/ldx/python-iptables
> +
> +comment "python-iptables needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> -- 
> 2.20.1
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
