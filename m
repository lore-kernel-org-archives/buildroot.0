From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Nov 2015 22:40:20 +0100
Subject: [Buildroot] [PATCH 1/6] gstreamer: add legal info
In-Reply-To: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564CF044.4010002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-11-15 13:39, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Even though COPYING is LGPLv2+ some code files state v2.1+

 Correct.

> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/gstreamer/gstreamer/gstreamer.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
> index 1dbd66f..156afab 100644
> --- a/package/gstreamer/gstreamer/gstreamer.mk
> +++ b/package/gstreamer/gstreamer/gstreamer.mk
> @@ -8,6 +8,8 @@ GSTREAMER_VERSION = 0.10.36
>  GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
>  GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
>  GSTREAMER_INSTALL_STAGING = YES
> +GSTREAMER_LICENSE = LGPLv2+ LGPLv2.1+

 We separate these things by commas. Otherwise looks good so
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I was thinking, why not simply claim it is LGPLv2.1+, given that it's + anyway?
The binaries will anyway need to be LGPLv2.1+ because there's always some 2.1
code in there. So I would actually propose

# Some files are LGPLv2+, but the whole will be 2.1+
GSTREAMER_LICENSE = LGPLv2.1+
# COPYING file is actually for v2
GSTREAMER_LICENSE_FILES = COPYING

 Regards,
 Arnout

> +GSTREAMER_LICENSE_FILES = COPYING
>  
>  # Checking if unaligned memory access works correctly cannot be done when cross
>  # compiling. For the following architectures there is no information available
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
