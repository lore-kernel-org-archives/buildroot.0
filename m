From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:00:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/arptables: bump to version 0.0.5
In-Reply-To: <20191204191144.2591797-1-fontaine.fabrice@gmail.com>
References: <20191204191144.2591797-1-fontaine.fabrice@gmail.com>
Message-ID: <20191205230036.60a49509@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann, Arnout, Peter in Cc.

On Wed,  4 Dec 2019 20:11:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/arptables/Config.in b/package/arptables/Config.in
> index 873e791e81..aeb7250a72 100644
> --- a/package/arptables/Config.in
> +++ b/package/arptables/Config.in
> @@ -1,7 +1,12 @@
>  config BR2_PACKAGE_ARPTABLES
> -	bool "arptables"
> +	bool "arptables-legacy"

We normally want to have the package Config.in option name match the
package name, which would no longer be the case here.

>  	depends on BR2_USE_MMU # needs fork()
>  	help
> -	  Tool to set up, maintain, and inspect the tables of ARP rules.
> +	  Legacy tool to set up, maintain, and inspect the tables of ARP
> +	  rules.
>  
> -	  http://ebtables.sourceforge.net
> +	  A more uptodate client of the arptables tool is provided in
> +	  the iptables package. The new tool was formerly known as
> +	  arptables-compat.

Arnout, Peter, Yann, considering the change to the package, does it
make sense to rename it entirely to arptables-legacy ? Or should we
take Fabrice's approach, i.e keep the package name as-is, and just as
an exception change the option prompt ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
