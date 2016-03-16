From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 00:18:21 +0100
Subject: [Buildroot] [PATCH 08/16] toolchain-buildroot: update glibc
 comment for noMMU
In-Reply-To: <1458164602-16983-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9E9BD.2040107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> glibc is not available for noMMU platforms, so it doesn't make sense
> to show the comment about glibc requiring dynamic libraries on noMMU
> platforms.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   toolchain/toolchain-buildroot/Config.in | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index cb4fc18..ea290eb 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -83,6 +83,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>   	  http://www.gnu.org/software/libc/
>
>   comment "(e)glibc only available with shared lib support"
> +	depends on BR2_USE_MMU

  Actually, the rest of the architecture dependencies should also be repeated 
then. It's a huge blob, so maybe introduce GLIBC_ARCH_DEPENDS? Which could, by 
the way, also be used to protect comments for packages that depend on glibc.

  Regards,
  Arnout

>   	depends on BR2_STATIC_LIBS
>
>   config BR2_TOOLCHAIN_BUILDROOT_MUSL
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
