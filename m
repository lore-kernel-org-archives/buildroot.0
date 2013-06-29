From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jun 2013 10:42:51 +0200
Subject: [Buildroot] [PATCH] dhcpcd: unavailable for bfin and fix
 another bug
In-Reply-To: <1372463785-29537-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372463785-29537-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130629104251.4697be00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 28 Jun 2013 20:56:25 -0300, Gustavo Zacarias wrote:

> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
> index a06a973..a032694 100644
> --- a/package/dhcpcd/Config.in
> +++ b/package/dhcpcd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DHCPCD
>  	depends on BR2_INET_IPV6
> +	depends on !BR2_bfin

I would prefer to see an explicit "depends on !" on the specific
Blackfin external toolchains that are causing problems. If one day we
get the internal backend to properly build a toolchain for Blackfin,
then doing a "depends on !BR2_bfin" wouldn't make sense.

The Blackin external toolchain versions aren't changing that often, so
it shouldn't cause too much hassle to update dhpcd dependencies when
that happens.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
