From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 17:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/cppcms: use correct cxxflags
 for icu support
In-Reply-To: <20170605165346.1906-1-bernd.kuhls@t-online.de>
References: <20170605165346.1906-1-bernd.kuhls@t-online.de>
Message-ID: <20170611175619.49963625@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 18:53:46 +0200, Bernd Kuhls wrote:

>  ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
>  CPPCMS_CONF_OPTS += -DDISABLE_ICONV=ON -DDISABLE_ICU_LOCALE=OFF
> +CPPCMS_CONF_OPTS += \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
>  CPPCMS_DEPENDENCIES += icu
>  else
>  CPPCMS_CONF_OPTS += -DDISABLE_ICONV=OFF -DDISABLE_ICU_LOCALE=ON

This patch doesn't apply. Git master doesn't have the
DISABLE_ICU_LOCALE=OFF / DISABLE_ICU_LOCALE=ON.

On which tree is this patch based? Is it based on other patches that
you haven't submitted?

Could you adjust this, and resubmit an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
