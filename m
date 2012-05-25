From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 May 2012 22:08:35 +0200
Subject: [Buildroot] [PATCH resend] owl-linux: new package
In-Reply-To: <1337950319-19104-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 25 May 2012 13:51:59 +0100")
References: <1337950319-19104-1-git-send-email-spdawson@gmail.com>
Message-ID: <87likg81mk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

Hi,

 spdawson> diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
 spdawson> new file mode 100644
 spdawson> index 0000000..6ee0f95
 spdawson> --- /dev/null
 spdawson> +++ b/package/owl-linux/Config.in
 spdawson> @@ -0,0 +1,10 @@
 spdawson> +config BR2_PACKAGE_OWL_LINUX
 spdawson> +	bool "H&D Wireless SPB104 SD-card WiFi SIP"
 spdawson> +	depends on BR2_LINUX_KERNEL
 spdawson> +	help
 spdawson> +	  Linux kernel driver for the H&D Wireless SPB104 SD-card WiFi SIP.
 spdawson> +
 spdawson> +	  http://linux.hd-wireless.se/bin/view/Linux/GettingStarted

I don't know anything about this non-mainline driver, but a quick look
from that page shows me:

The driver is split into a binary part and a source part. The binary
part is a kernel-version and kernel-configuration independent
kernel-space library which also holds the device firmware. The source
part is basically the implementation of the adaptation layers
interfacing the SDIO stack, the TCP/IP stack and the wireless
extensions. This code is dependent on kernel version and configuration,
so it must be compiled for a particular kernel.

Currently, the included library has been compiled for ARM architectures
only. In version 1.0.6 and later, the library has been compiled with the
CodeSourcery GNU EABI toolchain 2011.03-42


So it seems like this should depend on atleast ARM, maybe some processor
variants and perhaps even the codesourcery 2011.03 toolchain?

-- 
Bye, Peter Korsgaard
