From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu, 21 Mar 2019 16:36:22 +0000
Subject: [Buildroot] [PATCH v5 2/4] boot/opensbi: new package
In-Reply-To: <20190320221236.1ea9c11b@windsurf>
References: <20190320003706.1126-1-alistair.francis@wdc.com>
 <20190320003706.1126-2-alistair.francis@wdc.com>
 <20190320221236.1ea9c11b@windsurf>
Message-ID: <c96ecd37-86d7-bcc4-f9f4-e2f39b6f4a8d@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 20/03/2019 21:12, Thomas Petazzoni wrote:
> Hello Francis,
>
> You are respining the patches too fast, without answering some of the
> questions, and therefore there's still an issue, see below.

Just a heads-up that things have got a bit out of sync for RISC-V
architecture on the master branch...

a) commit 'allow BR2_LINUX_KERNEL_IMAGE on RISC-V'
(a3a4d4d4d307fd21f19ae43e77ac21b85adad7f2) is causing riscv builds to
fail for the existing qemu defconfigs because OpenSBI hasn't been added
yet and riscv-pk expects a 'vmlinux' file.

b) commit 'configs/qemu_riscv32_virt: upgrade to 4.20 kernel'
(e92d5624236e47e1abe44f2ace24fceb1882c0a5) results in a kernel that
won't boot with QEMU due to lack of OpenSBI and/or required kernel
configuration updates.

Might be worth backing these out if the other updates are going to take
a while?

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
