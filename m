From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 12 May 2007 12:31:55 +0200
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <46449A01.6010701@rcn.com>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at> <46449A01.6010701@rcn.com>
Message-ID: <20070512103155.GF24585@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 11, 2007 at 12:29:53PM -0400, David Claffey wrote:
>The braces expansion issue is different.
>
>kernel-headers-new.makefile and linux26.mk .patched targets overlap.
>
>$(LINUX_HEADERS_UNPACK_DIR)/.patched:
>$(LINUX26_DIR)/.patched:
>
>The kernel-headers target pulls in linux-$(LINUX_HEADERS_VERSION)-* patches,
>while the linux26.mk is explicitly pulling in any patches placed in the
>$(BR2_BOARD_PATH)/kernel-patches directory.
>
>The latter does not occur because the kernel-headers rule satisfies the
>dependency early on.

Thanks for the explanation. I think that we want to apply _any_ patches
even for the kernel-headers, since a later applied patch could render
parts of the headers to be incorrect ?). Can you please try to apply
$(BR2_BOARD_PATH)/kernel-patches/linux-$(LINUX_HEADERS_VERSION)*.patch*
in kernel-headers-new.makefile and after successful verification send
the patch to me? TIA

?) Suppose i have a patch that removes the VT layer. This patch would
lead to inconsistency if applied after the headers are installed.
