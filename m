From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 23:09:03 +0100
Subject: [Buildroot] [PATCH] quota: select
	BR2_PACKAGE_UTIL_LINUX_BINARIES
In-Reply-To: <1362907622-27511-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 10 Mar 2013 06:27:02 -0300")
References: <1362907622-27511-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqtevreo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Missed this one package that needs a util-linux binary, fixes:
 Gustavo> http://autobuild.buildroot.net/results/bc3c75e7c60fe6db54ea56dd7c398ba7878bff83/

Ehh, that log rather looks like BR2_PACKAGE_UTIL_LINUX_MOUNT needing to
select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT?


 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/quota/Config.in | 1 +
 Gustavo>  1 file changed, 1 insertion(+)

 Gustavo> diff --git a/package/quota/Config.in b/package/quota/Config.in
 Gustavo> index f6341d3..9f1704b 100644
 Gustavo> --- a/package/quota/Config.in
 Gustavo> +++ b/package/quota/Config.in
 Gustavo> @@ -4,6 +4,7 @@ config BR2_PACKAGE_QUOTA
 Gustavo>  	depends on BR2_USE_WCHAR
 Gustavo>  	depends on BR2_USE_MMU # fork()
 Gustavo>  	select BR2_PACKAGE_UTIL_LINUX
 Gustavo> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 Gustavo>  	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 Gustavo>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 Gustavo>  	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 Gustavo> -- 
 Gustavo> 1.8.1.5

 Gustavo> _______________________________________________
 Gustavo> buildroot mailing list
 Gustavo> buildroot at busybox.net
 Gustavo> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
