From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Apr 2013 21:49:23 +0200
Subject: [Buildroot] [PATCH 2/2] quagga: bump to version 0.99.22.1
In-Reply-To: <1366072783-28319-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 15 Apr 2013 21:39:43 -0300")
References: <1366072783-28319-1-git-send-email-gustavo@zacarias.com.ar>
 <1366072783-28319-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nf5j5to.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/quagga/quagga.mk | 7 ++-----
 Gustavo>  1 file changed, 2 insertions(+), 5 deletions(-)

 Gustavo> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
 Gustavo> index fb060ef..42f8506 100644
 Gustavo> --- a/package/quagga/quagga.mk
 Gustavo> +++ b/package/quagga/quagga.mk
 Gustavo> @@ -4,7 +4,7 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -QUAGGA_VERSION = 0.99.21
 Gustavo> +QUAGGA_VERSION = 0.99.22.1
 Gustavo>  QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 Gustavo>  QUAGGA_DEPENDENCIES = host-gawk
 Gustavo>  QUAGGA_LICENSE = GPLv2+
 Gustavo> @@ -25,12 +25,9 @@ QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--di
 Gustavo>  QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),--enable-opaque-lsa,--disable-opaque-lsa)
 
 Gustavo>  ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 Gustavo> +QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
 Gustavo>  QUAGGA_CONF_OPT += --enable-snmp
 Gustavo>  QUAGGA_DEPENDENCIES += netsnmp
 Gustavo> -# SNMP support tries -lcrypto by default, disable it if we ain't got openssl
 Gustavo> -ifneq ($(BR2_PACKAGE_OPENSSL),y)
 Gustavo> -QUAGGA_CONF_OPT +=--without-crypto
 Gustavo> -endif

Why? Doesn't it have crypto support any more? Or if it does, shouldn't
we ensure it gets built after openssl?

 Gustavo>  else
 Gustavo>  QUAGGA_CONF_OPT +=--disable-snmp
 Gustavo>  endif
 Gustavo> -- 
 Gustavo> 1.8.1.5

 Gustavo> _______________________________________________
 Gustavo> buildroot mailing list
 Gustavo> buildroot at busybox.net
 Gustavo> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
