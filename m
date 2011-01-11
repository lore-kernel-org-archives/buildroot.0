From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jan 2011 15:15:59 +0100
Subject: [Buildroot] [PATCHv2] libao: new package
In-Reply-To: <1294753530-4657-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 11 Jan 2011 10:45:30 -0300")
References: <1294753530-4657-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bp3n34rk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/Config.in       |    1 +
 Gustavo>  package/multimedia/libao/Config.in |    7 +++++++
 Gustavo>  package/multimedia/libao/libao.mk  |   21 +++++++++++++++++++++
 Gustavo>  3 files changed, 29 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/multimedia/libao/Config.in
 Gustavo>  create mode 100644 package/multimedia/libao/libao.mk

 Gustavo> +++ b/package/multimedia/libao/libao.mk
 Gustavo> @@ -0,0 +1,21 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# libao
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +LIBAO_VERSION = 1.0.0
 Gustavo> +LIBAO_SITE = http://downloads.xiph.org/releases/ao
 Gustavo> +LIBAO_DEPENDENCIES = host-pkg-config
 Gustavo> +LIBAO_INSTALL_STAGING = YES
 Gustavo> +LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
 Gustavo> +			--disable-nas --disable-pulse
 Gustavo> +
 Gustavo> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 Gustavo> +LIBAO_DEPENDENCIES += alsa-lib
 Gustavo> +LIBAO_CONF_OPT += --enable-alsa --enable-alsa-mmap
 Gustavo> +else
 Gustavo> +LIBAO_CONF_OPT = --disable-alsa

This should have been a '+=', but I've fixed that. Committed, thanks.

-- 
Bye, Peter Korsgaard
