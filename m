From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 16:22:24 +0200
Subject: [Buildroot] [PATCH 2/2] ccid: new package
In-Reply-To: <1347970772-25135-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <1347970772-25135-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <20120918162224.338721a9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Rymarkiewicz,

On Tue, 18 Sep 2012 14:19:32 +0200, Waldemar Rymarkiewicz wrote:
> --- /dev/null
> +++ b/package/ccid/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_CCID
> +	bool "ccid"
> +	select BR2_PACKAGE_PCSC_LITE

	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb

> +	help
> +	  PC/SC driver for USB CCID smart card readers
> +
> +	  http://pcsclite.alioth.debian.org/ccid.html

comment "ccid needs a toolchain with thread support"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

> +CCID_DEPENDENCIES = pcsc-lite libusb

Does ccid directly uses libusb, or does it only use it through
pcsc-lite? If the latter, then it would be better not to have libusb
amongst the dependencies here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
