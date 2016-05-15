From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:59:50 +0200
Subject: [Buildroot] [PATCH v1] uclibc: enable debug build option
In-Reply-To: <1463077504-3646-1-git-send-email-ps.report@gmx.net>
References: <1463077504-3646-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160515215950.1e41e583@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 20:25:04 +0200, Peter Seiderer wrote:

>  #
> +# Debug
> +#
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +define UCLIBC_DEBUG_CONFIG
> +	$(call KCONFIG_ENABLE_OPT,DODEBUG=y,$(@D)/.config)

Has this patch really been tested? Inded, I think this line should be:

	$(call KCONFIG_ENABLE_OPT,DODEBUG,$(@D)/.config)

Indeed, setting =y is done by KCONFIG_ENABLE_OPT.

It is worth mentioning that we used to do exactly this (setting
DODEBUG=y when BR2_ENABLE_DEBUG=y), but removed that in commit
70b7079d3797304fe3c9ba2941d3f446af3cea79in December 2013 because
DODEBUG=y was breaking the build. But since then, uClibc has been
replaced by uClibc-ng and I guess Waldemar has fixed DODEBUG=y.

Peter, did you do a test build on ARM, to verify that you're not
falling into the issue mentioned in commit
70b7079d3797304fe3c9ba2941d3f446af3cea79 ?

In any case, please resend an updated version with the =y removed. I
normally do such minor fixups myself when applying, but in this case, I
really want to be sure that you have done a test build.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
