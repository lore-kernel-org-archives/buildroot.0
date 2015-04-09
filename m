From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:48:19 +0200
Subject: [Buildroot] [PATCH] package/boost: boost-log needs NPTL threads
In-Reply-To: <1428615930-17716-1-git-send-email-romain.naour@openwide.fr>
References: <1428615930-17716-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150409234819.1aced7ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu,  9 Apr 2015 23:45:30 +0200, Romain Naour wrote:
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

Good, but missing comment :-)

And "depends on", not "depend on".

Please test patches!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
