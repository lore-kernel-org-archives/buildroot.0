From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 00:09:44 +0200
Subject: [Buildroot] [PATCH v2] package/pdbg: new package
In-Reply-To: <1469429593-28546-1-git-send-email-joel@jms.id.au>
References: <1469427392-25228-1-git-send-email-joel@jms.id.au>
 <1469429593-28546-1-git-send-email-joel@jms.id.au>
Message-ID: <20160726000944.3fd80fc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 16:23:12 +0930, Joel Stanley wrote:

> diff --git a/package/pdbg/Config.in b/package/pdbg/Config.in
> new file mode 100644
> index 000000000000..cf37eb8aca41
> --- /dev/null
> +++ b/package/pdbg/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PDBG
> +	bool "pdbg"
> +	depends on BR2_arm

Anything that makes it ARM-specific?

> +	help
> +	  PowerPC FSI Debugger, for low level debugging of a PowerPC CPU
> +	  over FSI.

It would have been good to explain somewhere than pdbg runs on the BMC,
which is generally an ARM-powered system monitoring/controlling a
number of PowerPC CPUs. Otherwise, it feels odd to have a
PowerPC-related package available only on the ARM architecture.


> +PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
> +PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
> +PDBG_LICENSE = Apache 2.0
> +PDBG_LICENSE_FILES = COPYING
> +PDBG_AUTORECONF = YES

Side note (unrelated to Buildroot packaging): had a look at the code,
and this mapping of /dev/mem to then bing-bang some protocol on GPIOs
from userspace is really, really nasty :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
