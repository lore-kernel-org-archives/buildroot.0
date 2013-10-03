From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Oct 2013 22:41:23 +0200
Subject: [Buildroot] [PATCH v3 01/11] udev: explicitly include pthreads
In-Reply-To: <1380237714-2470-2-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 26 Sep 2013 18:21:44 -0500")
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
 <1380237714-2470-2-git-send-email-spenser@gillilanding.com>
Message-ID: <87li2am6j0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> This fixes builds with Linaro hard float toolchains.

Sorry, what toolchain exactly? I just did a test build with our default
(Linaro 2013.08) ext toolchain, and didn't have any linker issues.


 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/udev/udev.mk |    2 +-
 Spenser>  1 files changed, 1 insertions(+), 1 deletions(-)

 Spenser> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
 Spenser> index db86850..b512ec5 100644
 Spenser> --- a/package/udev/udev.mk
 Spenser> +++ b/package/udev/udev.mk
 Spenser> @@ -12,7 +12,7 @@ UDEV_LICENSE_FILES = COPYING
 Spenser>  UDEV_INSTALL_STAGING = YES
 
 Spenser>  # mq_getattr is in librt
 Spenser> -UDEV_CONF_ENV += LIBS=-lrt
 Spenser> +UDEV_CONF_ENV += LIBS="-lrt -lpthread"
 
 Spenser>  UDEV_CONF_OPT =			\
 Spenser>  	--sbindir=/sbin		\
 Spenser> -- 
 Spenser> 1.7.1

 Spenser> _______________________________________________
 Spenser> buildroot mailing list
 Spenser> buildroot at busybox.net
 Spenser> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
