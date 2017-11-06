From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Nov 2017 23:24:54 +0100
Subject: [Buildroot] [git commit] uboot: use local libfdt.h
In-Reply-To: <20171106201938.56CD37FC1A@busybox.osuosl.org>
References: <20171106201938.56CD37FC1A@busybox.osuosl.org>
Message-ID: <ff9910b0-ff51-4d4d-6f68-8fc7732c5273@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-17 21:25, Peter Korsgaard wrote:
> +define UBOOT_FIX_LIBFDT_SYSTEM_PATH
> +	[ ! -e $(@D)/tools/fdtgrep.c ] || \

 Is there any reason to use [ ! ... ] || instead of [ ... ] && ?

 Regards,
 Arnout

> +	$(SED) 's%<../include/libfdt.h>%"../include/libfdt.h"%' $(@D)/tools/fdtgrep.c
> +endef

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
