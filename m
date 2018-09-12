From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 17:23:00 +0200
Subject: [Buildroot] [PATCH v2 2/6] package/linux-headers: add support
 for custom headers
In-Reply-To: <20180912102256.3164-3-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-3-mark.corbin@embecosm.com>
Message-ID: <20180912172300.06858ae2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:52 +0100, Mark Corbin wrote:

>  define LINUX_HEADERS_APPLY_LOCAL_PATCHES
> -	for p in $(filter-out ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES)) ; do \
> -		if test -d $$p ; then \
> -			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
> -		else \
> -			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
> -		fi \
> -	done
> +        for p in $(filter-out ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES)) ; do \
> +                if test -d $$p ; then \
> +                        $(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
> +                else \
> +                        $(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
> +                fi \
> +        done

This change is spurious: you just replaced the tab-based indentation by
space-based indentation, which is not good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
