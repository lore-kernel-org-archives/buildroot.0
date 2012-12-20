From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Dec 2012 15:24:57 +0100
Subject: [Buildroot] [PATCHv3] linux: Support multiple device tree build
In-Reply-To: <1355993289-31804-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Thu, 20 Dec 2012 09:48:09 +0100")
References: <1355993289-31804-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87txrgyf5y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Committed, thanks.

 Maxime>  define LINUX_INSTALL_DTB
 Maxime> -	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
 Maxime> +	cp $(addprefix $(KERNEL_ARCH_PATH)/boot/, \
 Maxime> +		$(addsuffix .dtb, $(call qstrip, $(KERNEL_DTS_NAME)))) \
 Maxime> +		$(BINARIES_DIR)/

Not directly related to your patch, but this is broken by the recent
(post-3.7) change to put .dtb files in arch/arm/boot/dts. I wonder how
the best way of handling this is?

-- 
Bye, Peter Korsgaard
