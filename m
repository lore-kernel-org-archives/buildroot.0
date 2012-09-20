From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 22:36:46 +0200
Subject: [Buildroot] [PATCH] intel-microcode: new package
In-Reply-To: <1348153949-30525-1-git-send-email-rbraun@sceen.net>
References: <1348153949-30525-1-git-send-email-rbraun@sceen.net>
Message-ID: <20120920223646.65a34101@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Thu, 20 Sep 2012 17:12:29 +0200, Richard Braun wrote:

> +INTEL_MICROCODE_VERSION = 20120606
> +INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
> +INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/21385/eng
> +INTEL_MICROCODE_LICENSE = PROPRIETARY

Is there a license file somewhere that states that even though it is
proprietary, one has the right to redistribute the binaries?

> +# N.B. Don't strip any path components during extraction.
> +define INTEL_MICROCODE_EXTRACT_CMDS
> +	gzip -d -c $(DL_DIR)/$(INTEL_MICROCODE_SOURCE) | tar --strip-components=0 -C $(INTEL_MICROCODE_DIR) -xf -

You can use $(@D) instead of $(INTEL_MICROCODE_DIR) here.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
