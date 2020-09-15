From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 16:51:56 +0200
Subject: [Buildroot] [PATH v2 1/1] docs/manual: add qemu defconfigs
 gitlab test
In-Reply-To: <20200915103806.13785-1-jugurtha.belkalem@smile.fr>
References: <20200915103806.13785-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200915165156.179380a9@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 12:38:06 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> +=== Adding qemu defconfig gitlab test
> +
> +Buildroot provides a test script (support/scripts/boot-qemu-image.py)
> +to validate all defconfigs under +board/qemu/. Every supported qemu
> +architecture should append the comment : # qemu_ARCH_defconfig
> +at the end of its command line entry in board/qemu/ARCH/readme.txt (for
> +example aarch64-virt includes : # qemu_aarch64_virt_defconfig).
> +Once a week, every defconfig is tested under gitlab's pipelines :
> +* Launches a qemu instance.
> +* Enters root credentials and checks if login shell is available.
> +* Powers off the instance.
> +The job fails if one of above steps returns unsuccessful status code.
> +to trigger qemu defconfigs test jobs:
> +
> +---------------------
> + $ git push gitlab HEAD:<name>_defconfig
> +---------------------

While I understand the idea of documenting this, I am wondering if the
Buildroot manual is really the right place for this. Indeed, this bit
of documentation is really only useful for the very specific/narrow use
case of qemu defconfigs.

Should this be in board/qemu/readme.txt ? I'm not sure.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
