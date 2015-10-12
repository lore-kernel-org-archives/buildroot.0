From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 19:39:42 +0200
Subject: [Buildroot] [PATCH 1/1] [arm64 uboot] Resolved compilation
 issue for arm64 uboot
In-Reply-To: <1444664954-64180-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1444664954-64180-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20151012193942.75ee6483@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 12 Oct 2015 10:49:14 -0500, Matt Weber wrote:

> This patch has been added to resolve the compilation issue
> of arm64 uboot.
> 
> For aarch64 architecture, kernel uses arm64 terminology and thus from
> top-level Makefile KERNEL_ARCH is modified to arm64 for aarch64 which
> then passed to uboot compilation. But, it causes compilation issue
> while including architecture specific Makefile under
> arch/$(ARCH)/Makefile as uboot uses top-level system architecture as
> arm only.

I'm not a native english speaker, but the wording of this sentence
doesn't seem quite right.

The title of the commit should be:

	uboot: <something>

> +# For aarch64 architecture, kernel uses arm64 terminology and thus from
> +# # top-level Makefile KERNEL_ARCH is modified to arm64 for aarch64 which
> +# # then passed to uboot compilation. But, it causes compilation issue
> +# # while including architecture specific Makefile under arch/$(ARCH)/Makefile
> +# # as uboot uses top-level system architecture as arm only.

Double hashes a the beginning of each line -> not good.

Care to fix that up (especially rewording the commit log and comment) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
