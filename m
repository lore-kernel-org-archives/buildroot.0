From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:48:16 +0200
Subject: [Buildroot] [PATCH v2 1/1] luvi: new package
In-Reply-To: <1444854939-6557-1-git-send-email-joerg.krause@embedded.rocks>
References: <1444763952-29583-1-git-send-email-joerg.krause@embedded.rocks>
 <1444854939-6557-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151014224816.42782f90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 14 Oct 2015 22:35:39 +0200, J?rg Krause wrote:

> +# Bundled lua bindings have to be linked statically into the luvi executable
> +LUVI_CONF_OPTS = \
> +	-DBUILD_SHARED_LIBS=OFF \
> +	-DWithSharedLibluv=ON \
> +	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
> +	-DLUA_PATH=$(HOST_DIR)/usr/share/luajit-2.0.4/?.lua
> +
> +# Add "rex" module (PCRE via bundled lrexlib)
> +ifeq ($(BR2_PACKAGE_PCRE),y)
> +LUVI_DEPENDENCIES += pcre
> +LUVI_CONF_OPTS += -DWithPCRE=ON -DWithSharedPCRE=ON
> +endif

Can we have an else clause here to explicitly disable pcre support?

> +
> +# Add "ssl" module (via bundled lua-openssl)
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LUVI_DEPENDENCIES += openssl
> +LUVI_CONF_OPTS += -DWithOpenSSL=ON -DWithOpenSSLASM=ON -DWithSharedOpenSSL=ON
> +endif

Same here.

> +
> +# Add "zlib" module (via bundled lua-zlib)
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +LUVI_DEPENDENCIES += zlib
> +LUVI_CONF_OPTS += -DWithZLIB=ON -DWithSharedZLIB=ON
> +endif

And here?

Other than that, it looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
