From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:43:14 +0100
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
In-Reply-To: <1421306499-16540-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1421306499-16540-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20150115094314.59c5175f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

Thanks, I've applied, but there are a few questions that come to mind
when looking at the patch.

On Thu, 15 Jan 2015 08:21:39 +0100, Jerzy Grzegorek wrote:

> +JIMTCL_INSTALL_LIB = \
> +	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
> +	$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB); \
> +	ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so

We should be using a "define ... endef" block here:

define JIMTCL_INSTALL_LIB
	...
	...
	...
endef

This would remove the need for the backslashes, and make it more
similar to what we do in the rest of Buildroot.

> diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
> index 9b2bb81..59b8d8a 100644
> --- a/package/xerces/xerces.mk
> +++ b/package/xerces/xerces.mk
> @@ -11,8 +11,9 @@ XERCES_LICENSE = Apache-2.0
>  XERCES_LICENSE_FILES = LICENSE
>  XERCES_MAKE = $(MAKE1)
>  XERCES_INSTALL_STAGING = YES
> -XERCES_CONF_OPTS = --disable-threads \
> -		  --with-gnu-ld
> +XERCES_CONF_OPTS = \
> +	--disable-threads \

Why are we disabling threads unconditionally here?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
