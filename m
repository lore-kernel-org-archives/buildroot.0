From: Kamal <kamal.chandarana09@gmail.com>
Date: Tue, 19 Mar 2013 08:56:11 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?=5Bgit_commit=5D_jamvm=3A_classpath_needs_i?=
	=?utf-8?q?pv6=2C=09so_jamvm_as_well?=
References: <20121205000121.2C1B1999AB@busybox.osuosl.org>
Message-ID: <loom.20130319T095346-140@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@...> writes:

> 
> commit: http://git.buildroot.net/buildroot/commit/?
id=5a5eeae999150ec4dcb60d5847440fbb8fbdc341
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@...>
> ---
>  package/jamvm/Config.in |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
> index 852c6e8..0287f80 100644
> --- a/package/jamvm/Config.in
> +++ b/package/jamvm/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_JAMVM
>  	bool "jamvm"
> +	depends on BR2_INET_IPV6
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_CLASSPATH
>  	help
> @@ -7,3 +8,6 @@ config BR2_PACKAGE_JAMVM
>  	  JVM specification version 2 (blue book).
> 
>  	  http://jamvm.sf.net
> +
> +comment "jamvm requires a toolchain with IPV6 support"
> +	depends on !BR2_INET_IPV6
> 

Hi,
Did you get any Workaroud ???I am not able to use socket api for ipv6 
communication using jamvm and classpath. Help me if you find any solution or any 
kind of help posible from you.

Thanks  & Regards,
Kamal
