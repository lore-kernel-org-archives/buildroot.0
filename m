From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 May 2012 09:09:40 +0200
Subject: [Buildroot] [PATCH] Added package fbterm: a framebuffer-based
 terminal emulator.
In-Reply-To: <1337135766-26862-1-git-send-email-golubovsky@gmail.com>
References: <1337135766-26862-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120516090940.0a59337b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 May 2012 22:36:06 -0400,
Dmitry <golubovsky@gmail.com> a ?crit :

> +	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && \
> +			BR2_TOOLCHAIN_BUILDROOT_CXX && BR2_USE_WCHAR)

You should replace BR2_TOOLCHAIN_BUILDROOT_CXX by BR2_INSTALL_LIBSTDCPP
(yes, I know the name of this config option is crappy), otherwise
users of external toolchains or ct-ng toolchains will not be able to
select this package.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
