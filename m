From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:23:22 +0100
Subject: [Buildroot] [PATCH v2 4/5] configs: qemu_riscv*: Build the
 kernel Image file
In-Reply-To: <20190318210106.6347-4-alistair.francis@wdc.com>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
 <20190318210106.6347-4-alistair.francis@wdc.com>
Message-ID: <20190318222322.4cb64d19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair,

On Mon, 18 Mar 2019 21:02:04 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

This commit should have a non-empty commit log, and should actually be
split into to:

 - One allowing to enable BR2_LINUX_KERNEL_IMAGE on RISC-V

 - One moving the defconfig to using OpenSBI, which requires using the
   Image target if I understood correctly. As it is, the change to the
   defconfigs in this commit is pretty useless: the new Image is not
   generated. Worse: it probably breaks the defconfig because the Linux
   kernel build no longer installs $(BINARIES_DIR)/vmlinux, which is
   needed by riscv-pk. So your patch series is not bisectable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
