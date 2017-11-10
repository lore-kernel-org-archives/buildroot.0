From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Nov 2017 16:40:03 +0100
Subject: [Buildroot] [PATCH] binutils: Allow upstream 2.29 to be chosen
 for ARC
In-Reply-To: <20171109215901.17381-1-abrodkin@synopsys.com>
References: <20171109215901.17381-1-abrodkin@synopsys.com>
Message-ID: <e30aedee-15f1-a8eb-c959-4c9269ce1929@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 Small nit...

On 09-11-17 22:59, Alexey Brodkin wrote:
[snip]
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index d2bf5b9..8654239 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -15,7 +15,7 @@ BINUTILS_VERSION = 2.28.1
>  endif
>  endif # BINUTILS_VERSION
>  
> -ifeq ($(BR2_arc),y)
> +ifneq ($(BR2_BINUTILS_VERSION_ARC),)

 Use positive logic:

ifeq ($(BR2_BINUTILS_VERSION_ARC),y)

 Regards,
 Arnout

>  BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
>  BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
>  BINUTILS_FROM_GIT = y

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
