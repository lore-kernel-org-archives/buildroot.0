From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 15:24:25 +0200
Subject: [Buildroot] [PATCH 04/36] package/vde2: new package
In-Reply-To: <1344815664-28138-4-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-4-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120814152425.725d87e6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 13 Aug 2012 01:53:52 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> +# For now, we install only the libraries
> +# Installing the complete VDE suite can come in a later patch
> +#?In that case, do not forget to update the license!
> +define VDE2_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libvde*.so*    \
> +	                      $(TARGET_DIR)/usr/lib
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/vde2/vde_l3
> +	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/vde2/vde_l3/*.so   \
> +	                      $(TARGET_DIR)/usr/lib/vde2/vde_l3
> +endef

Again, "make install" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
