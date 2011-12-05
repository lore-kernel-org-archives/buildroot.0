From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 Dec 2011 15:00:57 +0200
Subject: [Buildroot] [PATCH] Add package connman
In-Reply-To: <1323089638-609-1-git-send-email-zonque@gmail.com>
References: <1323089638-609-1-git-send-email-zonque@gmail.com>
Message-ID: <20111205130056.GB30001@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

On Mon, Dec 05, 2011 at 01:53:58PM +0100, Daniel Mack wrote:

[snip]

> +ifeq ($(BR2_PACKAGE_CONNMAN_THREAD),y)
> +CONNMAN_CONF_OPT += --enable-threads
> +else
> +CONNMAN_CONF_OPT += --disable-threads
> +endif

A less verbose way to do this is:

CONNMAN_CONF_OPT =                                              \
    $(if $(BR2_PACKAGE_CONNMAN_FOO),--enable-foo,--disable-foo) \
    $(if $(BR2_PACKAGE_CONNMAN_BAR),--enable-bar,--disable-bar) \
    ...

baruch

> +
> +ifeq ($(BR2_PACKAGE_CONNMAN_DEBUG),y)
> +CONNMAN_CONF_OPT += --enable-debug
> +else
> +CONNMAN_CONF_OPT += --disable-debug
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CONNMAN_ETHERNET),y)
> +CONNMAN_CONF_OPT += --enable-ethernet
> +else
> +CONNMAN_CONF_OPT += --disable-ethernet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CONNMAN_WIFI),y)
> +CONNMAN_CONF_OPT += --enable-wifi
> +CONNMAN_DEPENDENCIES += wpa_supplicant
> +else
> +CONNMAN_CONF_OPT += --disable-wifi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CONNMAN_BLUETOOTH),y)
> +CONNMAN_CONF_OPT += --enable-bluetooth
> +else
> +CONNMAN_CONF_OPT += --disable-bluetooth
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CONNMAN_LOOPBACK),y)
> +CONNMAN_CONF_OPT += --enable-loopback
> +else
> +CONNMAN_CONF_OPT += --disable-loopback
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CONNMAN_NTPD),y)
> +CONNMAN_CONF_OPT += --enable-ntpd
> +else
> +CONNMAN_CONF_OPT += --disable-ntpd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
> +CONNMAN_CONF_OPT += --enable-client
> +else
> +CONNMAN_CONF_OPT += --disable-client
> +endif
> +
> +$(eval $(call AUTOTARGETS))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
