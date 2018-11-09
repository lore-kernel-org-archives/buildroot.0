From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:14:54 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: add support for
 pcitest tool
In-Reply-To: <676a63fc4e656a81398dc1fca048f3e2bdea327e.1541701306.git.gustavo.pimentel@synopsys.com>
References: <676a63fc4e656a81398dc1fca048f3e2bdea327e.1541701306.git.gustavo.pimentel@synopsys.com>
Message-ID: <20181109221454.1329d46e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

Thanks for this contribution, however, I have a question below.

On Thu,  8 Nov 2018 19:22:30 +0100, Gustavo Pimentel wrote:

> +define PCI_BUILD_CMDS
> +	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
> +		echo "At least kernel 4.7 must be used." ; \

I tried building with 4.18, but still ran into this error. Indeed, it's
only in 4.19 that your patch
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/tools/pci?id=1ce78ce09430a5ffb987015ab2e24d145690b9a3
was added, which adds the Makefile.

So, either you fallback to building pcitest.c manually if there is no
Makefile, or the error message should be updated to say "At least
kernel 4.19 must be used".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
