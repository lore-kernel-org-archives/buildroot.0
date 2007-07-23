From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 16:19:06 +0200
Subject: [Buildroot] package/linux/Makefile.in does not include
	'openswan' patches
References: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
	<20070723132936.GB7902@aon.at>
Message-ID: <00f001c7cd3b$e243d7d0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Mon, Jul 23, 2007 at 03:11:26PM +0200, Ulf Samuelsson wrote:
>>The Kernel Headers buildscript applies the openswan patches 
>>on top of the kernel headers, but the target/linux/Makefile.in does not.
> 
> The headers (which used the very same sourcedir, dunno if it still does
> with your toolchain/linux* stuff) have to be patched. To achieve this,
> we patch the source before installing the headers.
>>

I didn't add BSP patch support for Linux, Stephen did,
but already before the BSP patch, the Linux was built
in a separate dir if the the kernel version was not the same
as the kernel-headers.

>>Isn't this a bug?
> 
> I don't understand? You can't apply patches twice, if you mean to
> suggests this (you most likely don't, i assume).
>

The kernel headers are installed in $(STAGING_DIR) and 
with the BSP patch you can have a separate kernel source directory for
each special configuration of the kernel, so the current kernel is 
installed in $(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)

The kernel in $(PROJECT_BUILD_DIR) does not get patched with openswan,
and even when a separate kernel source was built in $(BUILD_DIR), 
it did not get patched unless the kernel version was the same as the kernel header version.

I assume that this means we have to update target/linux/Makefile.in...

I also noted that the openswan patches are rather large.
Maybe we should have them downloadable from some location
instead of part of the buildroot trunk.
Each patchset for a kernel version is close to 2 MB.

Best Regards
Ulf Samuelsson
