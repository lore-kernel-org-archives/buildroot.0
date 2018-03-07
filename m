From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 22:32:23 +0100
Subject: [Buildroot] [PATCH 1/1] jsoncpp: do not always build static
 library
In-Reply-To: <20180307211842.27111-1-fontaine.fabrice@gmail.com>
References: <20180307211842.27111-1-fontaine.fabrice@gmail.com>
Message-ID: <20180307223223.5841e792@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Mar 2018 22:18:42 +0100, Fabrice Fontaine wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF -DBUILD_SHARED_LIBS=ON
> +endif

BUILD_SHARED_LIBS=ON/OFF is already passed by package/pkg-cmake.mk. I
don't think we need to replicate it here.

So, just:

ifeq ($(BR2_SHARED_LIBS),y)
JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
else
JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
endif

is enough, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
