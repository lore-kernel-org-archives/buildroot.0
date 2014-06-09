From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 9 Jun 2014 19:41:22 +0200
Subject: [Buildroot] [PATCH V4 1/2] google-breakpad: new package
In-Reply-To: <1401881573-12921-2-git-send-email-pascal.huerst@gmail.com>
References: <1401881573-12921-1-git-send-email-pascal.huerst@gmail.com>
 <1401881573-12921-2-git-send-email-pascal.huerst@gmail.com>
Message-ID: <CAHXCMMLL9Rh6J+RB92us_fAfiP0ujdOWgrkwnLZKKt-VSVz1AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, all,

On Wed, Jun 4, 2014 at 1:32 PM, Pascal Huerst <pascal.huerst@gmail.com> wrote:
[...]
> +################################################################################
> +#
> +# google-breakpad
> +#
> +################################################################################
> +
> +GOOGLE_BREAKPAD_VERSION = 1320
> +GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
> +GOOGLE_BREAKPAD_SITE_METHOD = svn
> +GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
> +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
> +GOOGLE_BREAKPAD_INSTALL_STAGING = YES
> +GOOGLE_BREAKPAD_LICENSE = BSD-3c
> +GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
> +
> +$(eval $(host-autotools-package))

Unfortunately, among the built host-tools, minidump-2-core is not a
cross-tool :-( (see [1]), so it might be worthwhile to not installed
it.

[1] https://code.google.com/p/google-breakpad/source/browse/trunk/src/tools/linux/md2core/minidump-2-core.cc#425

> +$(eval $(autotools-package))
> --
> 1.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
