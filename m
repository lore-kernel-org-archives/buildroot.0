From: Michael Rommel <rommel@layer-7.net>
Date: Tue, 17 Sep 2013 20:06:15 +0200
Subject: [Buildroot] [PATCH] aiccu: needs threads
In-Reply-To: <1379438353-17173-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379438353-17173-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <6A0B1AC3-6016-409A-971B-899624FDE9FA@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

yes, I was just working on that, too. I have seen it yesterday and just started to work on it.

  Michael.

-- 
Michael Rommel, Erlangen, Germany

On Sep 17, 2013, at 19:19 , Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/f6e/f6e1da89b3a0418a50cbfa39fc9373dad3fc968c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> package/aiccu/Config.in | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
> index 1c6f554..15959b1 100644
> --- a/package/aiccu/Config.in
> +++ b/package/aiccu/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_AICCU
> 	bool "aiccu"
> 	depends on BR2_INET_IPV6
> 	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> 	select BR2_PACKAGE_GNUTLS
> 	help
> 	  SixXS Automatic IPv6 Connectivity Client Utility
> @@ -17,5 +18,5 @@ config BR2_PACKAGE_AICCU
> 
> 	  http://www.sixxs.net/tools/aiccu/
> 
> -comment "aiccu requires a toolchain with IPv6 and WCHAR support"
> -	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR)
> +comment "aiccu requires a toolchain with IPv6, WCHAR and thread support"
> +	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
> -- 
> 1.8.1.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130917/869c79fb/attachment-0001.html>
