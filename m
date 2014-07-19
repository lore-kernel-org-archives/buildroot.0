From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:07:01 +0200
Subject: [Buildroot] [PATCH] openssl: drop libdl from pc file
In-Reply-To: <1405782971-8345-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405782971-8345-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140719180701.19045f56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 19 Jul 2014 12:16:11 -0300, Gustavo Zacarias wrote:

> +# libdl has no business in a static build
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +define OPENSSL_FIXUP_STATIC_PKGCONFIG
> +	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
> +endef
> +endif
> +OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG

This should have been inside the ifeq condition.

Committed with that fixed, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
