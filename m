From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 12:59:21 +0200
Subject: [Buildroot] Redundant kernel patches in the snapshot
	from	20070718
In-Reply-To: <1185459798.1044.43.camel@localhost.localdomain>
References: <1185459798.1044.43.camel@localhost.localdomain>
Message-ID: <20070727105921.GE22789@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 26, 2007 at 04:23:18PM +0200, Hans-Christian Egtvedt wrote:
>Hello,
>
>I am a bit confused to where I should put the kernel patch, there seems
>to be two places expecting the same file.
>
>toolchain/kernel-headers/kernel-headers-new.makefile expects them to be
>in toolchain/kernel-headers.
>
>target/linux/Makefile.in expects them to be in
>$(BR2_BOARD_PATH)/kernel-patches.
>
>AFAICT this is redundant, what is the need to put the same patches in a
>board specific folder? Should the target/linux/Makefile.in first do the
>patches in toolchain/kernel-headers and then
>$(BR2_BOARD_PATH)/kernel-patches if it exists?

yes.
as a general rant, such board-specific patches tend do break other
configurations more often than not (in my experience).

I added it for cases like a special device-driver which is not worth
downloading when building for a different arch.

HTH,
