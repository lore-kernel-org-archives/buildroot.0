From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 02 Nov 2013 09:03:32 -0300
Subject: [Buildroot] [PATCH] dhcpcd: needs MMU
In-Reply-To: <1383391862-13252-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383391862-13252-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5274EA14.1040903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/2013 08:31 AM, Thomas Petazzoni wrote:

> dhcpcd fails to build on non-MMU platforms:
> 
>   bind.o: In function `_daemonise':
>   bind.c:(.text+0x62): undefined reference to `_fork'
>   collect2: ld returned 1 exit status
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/dhcpcd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
> index dbde548..ddbc6f4 100644
> --- a/package/dhcpcd/Config.in
> +++ b/package/dhcpcd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DHCPCD
>  	depends on BR2_INET_IPV6
> +	depends on BR2_USE_MMU # fork()
>  	bool "dhcpcd"
>  	help
>  	  An RFC2131 compliant DHCP client

Hi.
You could remove the MMU kludge in the mk file too since it's useless.
On related news version 6.1.0 can be built on nommu, however at the
moment the upstream site has been unreachable for the last couple of
days so fetching from some mirror is the only option [the mk file needs
a few tweaks too].
Regards.
