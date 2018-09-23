From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 21:21:56 +0200
Subject: [Buildroot] [PATCH v2 1/6] linux: add hash file
In-Reply-To: <20180912102256.3164-2-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-2-mark.corbin@embecosm.com>
Message-ID: <20180923212156.73af8814@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

Fabio, Bernd: please see below.

On Wed, 12 Sep 2018 11:22:51 +0100, Mark Corbin wrote:
> Added a hash file for the Linux kernel. Hashes have been copied
> from the appropriate sha256sums.asc files on kernel.org.
> The Linux hash file is also shared with the linux-headers package
> via a symbolic link.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
> Changes v1 -> v2:
>   - update hashes for latest kernel versions
> ---
>  linux/linux.hash                         | 9 +++++++++
>  package/linux-headers/linux-headers.hash | 1 +
>  2 files changed, 10 insertions(+)
>  create mode 100644 linux/linux.hash
>  create mode 120000 package/linux-headers/linux-headers.hash

Applied to master, thanks. I have adjusted the .hash file with the
recent changes of the linux-headers package.

Bernd, Fabio: this commit means that there is some additional work to
do know when you bump the kernel headers / kernel version: you need to
adjust linux/linux.hash.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
