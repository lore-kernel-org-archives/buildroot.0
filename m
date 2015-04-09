From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 09 Apr 2015 23:48:22 +0200
Subject: [Buildroot] [PATCH] package/boost: boost-log needs NPTL threads
In-Reply-To: <1428615930-17716-1-git-send-email-romain.naour@openwide.fr>
References: <1428615930-17716-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5526F3A6.5020004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 09/04/2015 23:45, Romain Naour a ?crit :
> Fixes:
> [xtensa]
> http://autobuild.buildroot.net/results/664/6642dc9c569b2820a9d0e273fc2fb1d5a635ba0a
> [arc]
> http://autobuild.buildroot.net/results/ba5/ba5836e9a77e1b48e24ace46ca1611c22524261d
> [bfin]
> http://autobuild.buildroot.net/results/8cd/8cdac9cc67394aaae09ee816a9adddec762e3bd0
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/boost/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 65bf605..2695264 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -89,6 +89,7 @@ comment "boost-locale needs a toolchain w/ wchar"
>  
>  config BR2_PACKAGE_BOOST_LOG
>  	bool "boost-log"
> +	depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL
              ^
Sorry, there is a typo s/depend/depends/

Best regards,
Romain
>  
>  config BR2_PACKAGE_BOOST_MATH
>  	bool "boost-math"
> 
