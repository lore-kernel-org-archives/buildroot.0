From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Thu, 4 Aug 2016 15:39:01 +0530
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: hls: allow user to
 select crypto backend
In-Reply-To: <87mvkth9qg.fsf@dell.be.48ers.dk>
References: <1470226767-21018-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160803142925.3af9c6b7@free-electrons.com> <57A1F5DA.9020507@imgtec.com>
 <87mvkth9qg.fsf@dell.be.48ers.dk>
Message-ID: <57A3143D.4080404@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

On Thursday 04 August 2016 02:05 AM, Peter Korsgaard wrote:
>
> Yes, but we can do something like (untested):
>
> config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
>          bool "hls"
>          select BR2_PACKAGE_NETTLE if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_OPENSSL)
>          help
>            Fragmented streaming plugins
>
> and then in the .mk:
>
> ifeq ($(BR2_PACKAGE_NETTLE),y)
> GST1_PLUGINS_BAD_DEPENDENCIES += nettle
> GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=nettle
> else ifeq ($(BR2_PACKAGE_GNUTLS),y)
> GST1_PLUGINS_BAD_DEPENDENCIES += libgcrypt
> GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=libgcrypt \
> 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
> else
> GST1_PLUGINS_BAD_DEPENDENCIES += openssl
> GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=openssl
> endif
>

Thanks for suggestion. I've sent new patch.

Regards,

Rahul
