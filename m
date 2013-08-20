From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Aug 2013 10:59:31 +0200
Subject: [Buildroot] [PATCH] package/libbsd: further reduce the set of
 supported archs
In-Reply-To: <1376951733-31803-1-git-send-email-yann.morin.1998@free.fr>
References: <1376951733-31803-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <c7afbe678476690e9c2edb65e755f5a4@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-08-20 00:35, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Support for a,out on ARM will be dropped in Linux 3.11 (and is 
> already
> missing in the -rc).
>
> m68k is marked BROKEN in Buildroot, so it is never ever tested.
>
> The x86 familly is the only one left with support for a.out, now.
Hmm...  It looks like support for a.out may be removed using
-D__NO_A_OUT_SUPPORT. Although, a.out.h is always included, even with
this flag.

We may patch the code instead of disable architectures?

(In add, we may bump to 0.6.0)

> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libbsd/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
> index 1fa9497..bae5700 100644
> --- a/package/libbsd/Config.in
> +++ b/package/libbsd/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBBSD
>  	bool "libbsd"
>  	# libbsd requires a.out.h, which is only available for those
>  	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
You may also update comment.

> -	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || 
> BR2_x86_64 )
> +	depends on ( BR2_i386 || BR2_x86_64 )
[...]


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
