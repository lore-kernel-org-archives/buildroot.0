From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 14:12:04 +0200
Subject: [Buildroot] [PATCH v3 3/3] Add an BR2_GCC_ENABLE_GRAPHITE flag
 for the buildroot toolchain
In-Reply-To: <BLU436-SMTP2271716BEAADD735F8B21A8320@phx.gbl>
References: <1400500465-9142-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP2271716BEAADD735F8B21A8320@phx.gbl>
Message-ID: <20140519141204.5421f0ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Mon, 19 May 2014 11:54:25 +0000, Steve Thomas wrote:

> +ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
> +HOST_GCC_COMMON_DEPENDENCIES += \
> +	host-isl \
> +	host-cloog
> +HOST_GCC_COMMON_CONF_OPT += \
> +	--disable-isl-version-check \
> +	--disable-cloog-version-check
> +endif

Do we really need to disable the version checks? Also, for gmp and mpfr
we pass --with-gmp, --with-mpfr. Maybe we should do the same here when
graphite is enabled, and pass --without-{isl,cloog} when graphite is
disabled?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
