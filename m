From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Nov 2015 21:58:05 +0100
Subject: [Buildroot] [PATCH] sbc: new package
In-Reply-To: <1447805741-9339-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447805741-9339-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564CE65D.3020502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-11-15 01:15, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
[snip]
> diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
> new file mode 100644
> index 0000000..620c5bb
> --- /dev/null
> +++ b/package/sbc/sbc.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# sbc
> +#
> +################################################################################
> +
> +SBC_VERSION = 1.3
> +SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
> +SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
> +SBC_INSTALL_STAGING = YES
> +SBC_DEPENDENCIES = libsndfile host-pkgconf
> +SBC_LICENSE = GPLv2+ LGPLv2.1+

 Should be

GPLv2+ (programs), LGPLv2.1+ (libraries)


 Regards,
 Arnout

> +SBC_LICENSE_FILES = COPYING COPYING.LIB
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
