From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 27 Sep 2016 23:38:44 +0200
Subject: [Buildroot] [PATCH v2] Fix 'make toolchain-external-reinstall'
In-Reply-To: <1475010332-3674-1-git-send-email-jezz@sysmic.org>
References: <1475010332-3674-1-git-send-email-jezz@sysmic.org>
Message-ID: <1760368.QX7lMSgMHo@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(reviewing myself)

On Tuesday 27 September 2016 23:05:32 J?r?me Pouiller wrote:
[...]
> -# For simplicity, build directly into the install location
> -define TOOLCHAIN_BUILD_WRAPPER
> -	$(Q)mkdir -p $(HOST_DIR)/usr/bin
> +define TOOLCHAIN_WRAPPER_BUILD
>  	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
>  		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
>  		toolchain/toolchain-wrapper.c \
> -		-o $(HOST_DIR)/usr/bin/toolchain-wrapper
> +		-o $(@D)/toolchain-wrapper
> +endef
> +
> +define TOOLCHAIN_WRAPPER_INSTALL
> +	$(INSTALL) -D -m 0755 toolchain/toolchain-wrapper \
> +		$(HOST_DIR)/usr/bin/toolchain-wrapper
>  endef
I have forgotten to call TOOLCHAIN_WRAPPER_INSTALL from gcc-initial/gcc-
final.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
