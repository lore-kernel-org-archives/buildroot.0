From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Dec 2013 14:24:53 +0100
Subject: [Buildroot] [PATCH 1/1] ktap: new package
In-Reply-To: <1384172666-25736-1-git-send-email-anders@chargestorm.se>
References: <1384172666-25736-1-git-send-email-anders@chargestorm.se>
Message-ID: <20131208142453.36743ee2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Darander,

On Mon, 11 Nov 2013 13:24:26 +0100, Anders Darander wrote:

> diff --git a/package/ktap/Config.in b/package/ktap/Config.in
> new file mode 100644
> index 0000000..97bcd9c
> --- /dev/null
> +++ b/package/ktap/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_KTAP
> +	bool "ktap"
> +	depends on BR2_LINUX_KERNEL

Are you sure it doesn't need any specific C library functionality?

For example, the Makefile seems to link the program against the pthread
library, so ktap should probably "depends on BR2_TOOLCHAIN_HAS_THREADS".

See
http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options
for details about this topic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
