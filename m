From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Apr 2016 22:14:23 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc/defconfig: enable XSI math
In-Reply-To: <1461246857-5634-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461246857-5634-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5719349F.9080404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/21/16 15:54, Gustavo Zacarias wrote:
> ARM926 size delta +12 KB.
> It's required for the upcoming mpv package.

  Unfortunately the autobuilder toolchains don't have this enabled yet, so we'll 
get failures...

  The Blackfin toolchain does have this enabled, but the 2015.12 ARC toolchain 
doesn't.

  Anyway, it's probably a good idea to have this enabled by default.

  Regards,
  Arnout

>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/uclibc/uClibc-ng.config | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
> index 66de5a9..2671e06 100644
> --- a/package/uclibc/uClibc-ng.config
> +++ b/package/uclibc/uClibc-ng.config
> @@ -1,4 +1,5 @@
>   DO_C99_MATH=y
> +DO_XSI_MATH=y
>   KERNEL_HEADERS="/usr/src/linux/include"
>   # LDSO_CACHE_SUPPORT is not set
>   # UCLIBC_STATIC_LDCONFIG is not set
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
