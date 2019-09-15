From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:22:55 +0200
Subject: [Buildroot] [PATCH 15/27] package/smartmontools: bump to
 version 7.0
In-Reply-To: <20190908161159.26692-1-chrismcc@gmail.com>
References: <20190908161159.26692-1-chrismcc@gmail.com>
Message-ID: <20190915162255.740e79a6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Sun,  8 Sep 2019 09:11:59 -0700
Christopher McCrory <chrismcc@gmail.com> wrote:

> +# Work around broken configure check.
> +ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> +SMARTMONTOOLS_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-stack-protector"
> +endif

Could you instead fix the configure.ac, by using AC_LINK_IFELSE()
instead of AC_COMPILE_IFELSE() to check for the availability of
-fstack-protector ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
