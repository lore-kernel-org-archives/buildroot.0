From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 19:40:50 +0100
Subject: [Buildroot] [PATCH] iw: switch upstream site
In-Reply-To: <1359980430-11982-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359980430-11982-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <511000B2.5010900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 13:20, Gustavo Zacarias wrote:
> It's moved from wireless.kernel.org to generic kernel.org
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/iw/iw.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/iw/iw.mk b/package/iw/iw.mk
> index 22ea25c..9233833 100644
> --- a/package/iw/iw.mk
> +++ b/package/iw/iw.mk
> @@ -6,7 +6,7 @@
>
>   IW_VERSION = 3.8
>   IW_SOURCE = iw-$(IW_VERSION).tar.bz2
> -IW_SITE = http://wireless.kernel.org/download/iw
> +IW_SITE = http://www.kernel.org/pub/software/network/iw

  Should be using $(BR2_KERNEL_MIRROR) then.

  Regards,
  Arnout

>   IW_LICENSE = iw license
>   IW_LICENSE_FILES = COPYING
>   IW_DEPENDENCIES = host-pkgconf libnl
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
