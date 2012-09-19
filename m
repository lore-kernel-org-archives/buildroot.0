From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Sep 2012 16:47:06 +0200
Subject: [Buildroot] [PATCH v2 1/2] pcsc-lite: new package
In-Reply-To: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <20120919164706.0e38b54d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Rymarkiewicz,

On Wed, 19 Sep 2012 14:52:29 +0200, Waldemar Rymarkiewicz wrote:
> +# libudev has a priority over libusb
> +ifneq ($(BR2_PACKAGE_UDEV),y)
> +PCSC_LITE_CONF_OPT += --disable-libudev
> +
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +PCSC_LITE_CONF_OPT += --enable-libusb
> +PCSC_LITE_DEPENDENCIES += libusb
> +else
> +PCSC_LITE_CONF_OPT += --disable-libusb
> +endif
> +
> +endif

Can you detail this? I haven't looked at pcsc-lite itself, but this
looks strange. So if it is correct, it anyway needs a more detailed
comment.

Why when udev is available you don't do need libusb? Also, if udev is
available, you need to add it to the list of dependencies.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
