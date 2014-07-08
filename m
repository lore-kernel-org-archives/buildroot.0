From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue, 08 Jul 2014 18:02:05 +0200
Subject: [Buildroot] [RFC 9/9] midori: bump to version 0.5.8
In-Reply-To: <1404827832-1101-10-git-send-email-hadrien.boutteville@gmail.com>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
 <1404827832-1101-10-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <53BC15FD.4000209@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Tue,  8 Jul 2014 15:57:12 +0200, Hadrien Boutteville wrote:
[...]
> +ifeq ($(BR2_PACKAGE_GTK3),y)

Argh! I made a mistake in a last minute untested modification... It's of
course BR2_PACKAGE_LIBGTK3.

> +# The actual WebKit logic in Buildroot enable webkit2 when WebKit uses GTK+3
> +MIDORI_CONF_OPT += \
> +	-DUSE_GTK3=ON \
> +	-DHALF_BRO_INCOM_WEBKIT2=ON
> +MIDORI_DEPENDENCIES += libgtk3
> +else
> +MIDORI_DEPENDENCIES += libgtk2
> +endif
>  
> -define MIDORI_INSTALL_TARGET_CMDS
> -       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install)
> +define MIDORI_EXTRACT_CMDS
> +	$(call suitable-extractor,$(MIDORI_SOURCE)) $(DL_DIR)/$(MIDORI_SOURCE) \
> +		| $(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D) $(TAR_OPTIONS) -
>  endef
>  
> -$(eval $(generic-package))
> +$(eval $(cmake-package))
> 

Regards,

Hadrien
