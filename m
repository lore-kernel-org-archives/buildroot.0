From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Dec 2012 13:26:48 +0100
Subject: [Buildroot] [PATCHv3] linux: Support multiple device tree build
In-Reply-To: <50D45441.4050704@mind.be> (Arnout Vandecappelle's message of
 "Fri, 21 Dec 2012 13:21:21 +0100")
References: <1355993289-31804-1-git-send-email-maxime.ripard@free-electrons.com>
 <87txrgyf5y.fsf@dell.be.48ers.dk> <50D45441.4050704@mind.be>
Message-ID: <87txrf8ubb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Not directly related to your patch, but this is broken by the recent
 >> (post-3.7) change to put .dtb files in arch/arm/boot/dts. I wonder how
 >> the best way of handling this is?

 Arnout>  How about adding this to LINUX_POST_PATCH_HOOKS

 Arnout> if [ ! -e $(KERNEL_ARCH_PATH)/boot/dts ]; then \
 Arnout> 	ln -s . $(KERNEL_ARCH_PATH)/boot/dts; \
 Arnout> fi

 Arnout>  and adding dts to the path everywhere we use it?

That won't work as boot/dts exists (that's where the .dts files
are). The only thing that changed was where the generated .dtb files are
put (in arch/$ARCH/boot vs arch/$ARCH/boot/dts).

I solved it by adding a bit of extra logic to the LINUX_INSTALL_DTB rule
instead.

-- 
Bye, Peter Korsgaard
