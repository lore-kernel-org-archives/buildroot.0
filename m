From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 16:25:56 +0200
Subject: [Buildroot] [PATCH 1/3] package/gcc/9.2.0: backport or1k
 upstream patch
In-Reply-To: <20191019223107.1301848-1-romain.naour@gmail.com>
References: <20191019223107.1301848-1-romain.naour@gmail.com>
Message-ID: <20191020162556.3c466a1d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 00:31:05 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Without this patch, the system build using qemu_or1k_defconfig
> (gcc 9.2, binutils 2.33.1 and uClibc 1.0.32) doesn't boot.
> 
> https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001895.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...-issue-with-set_got-clobbering-LR-r9.patch | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 package/gcc/9.2.0/0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch

Series applied. Note that your PATCH 3/3 doesn't apply, because it was
probably based on a local patch of yours that removes binutils 2.30
(and its Config.in option), and this removal is not in master yet. I
fixed the conflict when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
