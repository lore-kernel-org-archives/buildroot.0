Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C0BC77B7E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jun 2023 10:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76A2E82287;
	Thu,  1 Jun 2023 10:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A2E82287
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znclagdM4HgG; Thu,  1 Jun 2023 10:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D2F82273;
	Thu,  1 Jun 2023 10:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D2F82273
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2DC1BF5F8
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 10:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6C3C82273
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 10:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6C3C82273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGuXJ4VbRU5a for <buildroot@lists.busybox.net>;
 Thu,  1 Jun 2023 10:29:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 705708226A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 705708226A
 for <buildroot@buildroot.org>; Thu,  1 Jun 2023 10:29:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6506213F89A;
 Thu,  1 Jun 2023 12:29:43 +0200 (CEST)
Received: from 37-169-43-59.coucou-networks.fr ([37.169.43.59:3621])
 via 37-169-43-59.coucou-networks.fr ([37.169.43.59])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Jun 2023 12:29:43 +0200
MIME-Version: 1.0
Date: Thu, 01 Jun 2023 12:29:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20230527134326.1855997-1-romain.naour@gmail.com>
References: <20230527134326.1855997-1-romain.naour@gmail.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <f5412946a57514d83e819aa83c430b4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1685615384;
 bh=IyP1yRiiEnaAB5ZsesVvjEfgGt8O4QRRweYSDjUP/ls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lghr9dOIolTHnOHiayr25XPd3ZDb0IpnJh4PEmRBc2y+hyFNCGuG7TK/d1CO4p47o
 ouHbUKZmIogZqQjdvCZ3zp4uvwxq4dW0bfH4QEH0koSxs/yZL5qE/kCDlxHFre6HOu
 7d9IZ5UWdfClS6ytZ1xSkYxPMd270JkmNyYqRAaDW0gas3KGyENieoXlKxbdiTlGm8
 RqPtAvYuo5Z2ZghttC3CLFWQpYi0JOblck5No+91K2hXdOCR4zTwpSyZikk+V9nLvG
 xDhTOVv8tdmx52MoF0Cl3dppUrJfD7cBN3lXnQB3hUn11DLuL1wYOJ8tH2QmrTkGHF
 2VG1TyIVSymiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lghr9dOI
Subject: Re: [Buildroot] [PATCH]
 support/testing/tests/package/test_kexec.py: fix kexec test for qemu 5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

I successfully tested this patch on branch master at commit c765ac9
with the following commands:

Using the local host qemu v7.2.1:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_kexec
     ...
     OK

Using the Buildroot docker image:

     utils/docker-run support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_kexec
     ...
     OK

Thank you for the fix!

On 27/05/2023 15:43, Romain Naour wrote:
> The commit f69c972ae61 (support/testing/tests/package/test_kexec.py:
> new runtime test) was tested locally with a qemu version (>= 7.x) more
> recent than the one available in our buidroot/base Docker image (5.2).
> As a consequence, that test fails to run in gitlab-ci as reported by 
> [1].
> 
> Remove "dtb-kaslr-seed=off" from the Qemu command line and pass
> a custom devicetree to qemu virt machine. This devicetree is
> based on qemu aarch64 5.2 dts with kaslr-seed set 0.
> 
> The qemu aarch64 devicetree has been exported [2] and updated with the
> following method:
> 
>   qemu-system-aarch64 -machine virt -machine 
> dumpdtb=qemu-aarch64-virt-5.2-machine.dtb
>   dtc -I dtb qemu-aarch64-virt-5.2-machine.dtb > 
> qemu-aarch64-virt-5.2-machine.dts
>   edit the dts and replace kaslr-seed parameter by "kaslr-seed = <0 
> 0>;"
> 
> As soon as our buidroot/base Docker image is updated and a newer qemu 
> version
> is available, we can safely revert this change and use the initial 
> method.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819092
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2023-May/668091.html
> [2] 
> https://u-boot.readthedocs.io/en/latest/develop/devicetree/dt_qemu.html#obtaining-the-qemu-devicetree
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Signed-off-by: Julien Olivain <ju.o@free.fr>

Tested-by: Julien Olivain <ju.o@free.fr>

> ---
>  support/testing/tests/package/test_kexec.py   |  15 +-
>  .../qemu-aarch64-virt-5.2-machine.dts         | 373 ++++++++++++++++++
>  2 files changed, 384 insertions(+), 4 deletions(-)
>  create mode 100644 
> support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
> 
> diff --git a/support/testing/tests/package/test_kexec.py 
> b/support/testing/tests/package/test_kexec.py
> index 77e383373e..51d43b0572 100644
> --- a/support/testing/tests/package/test_kexec.py
> +++ b/support/testing/tests/package/test_kexec.py
> @@ -24,6 +24,8 @@ class TestKexec(infra.basetest.BRTest):
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>          BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> +        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +        BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="{}"
>          BR2_LINUX_KERNEL_INSTALL_TARGET=y
>          BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>          BR2_PACKAGE_KEXEC=y
> @@ -31,20 +33,25 @@ class TestKexec(infra.basetest.BRTest):
>          BR2_TARGET_ROOTFS_EXT2_4=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """.format(
> -            
> infra.filepath("tests/package/test_kexec/linux-kexec.fragment")
> +            
> infra.filepath("tests/package/test_kexec/linux-kexec.fragment"),
> +            
> infra.filepath("tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts")
>          )
> 
>      def test_run(self):
>          hda = os.path.join(self.builddir, "images", "rootfs.ext4")
>          kern = os.path.join(self.builddir, "images", "Image")
> +        dtb = os.path.join(self.builddir, "images", 
> "qemu-aarch64-virt-5.2-machine.dtb")
>          # Notes:
>          # Sufficient memory is needed to load the kernel: having at
>          # least 512MB works. kexec could silently fail if not enough
>          # memory is present. KASLR needs to be disabled for the test:
> -        # we pass "nokaslr" to kernel bootargs, and also pass
> -        # "dtb-kaslr-seed=off" to qemu virt machine.
> +        # we pass "nokaslr" to kernel bootargs, and also pass a custom
> +        # devicetree to qemu virt machine. This devicetree is based on
> +        # qemu aarch64 5.2 dts with kaslr-seed set 0.
> +        # With newer qemu >= 7.0 we can disable KASLR from the qemu
> +        # command line using "dtb-kaslr-seed=off".
>          bootargs = ["root=/dev/vda console=ttyAMA0 nokaslr"]
> -        qemu_opts = ["-M", "virt,dtb-kaslr-seed=off", "-cpu", 
> "cortex-a57", "-m", "512M",
> +        qemu_opts = ["-M", "virt", "-dtb", dtb, "-cpu", "cortex-a57", 
> "-m", "512M",
>                       "-drive", f"file={hda},if=virtio,format=raw"]
>          self.emulator.boot(arch="aarch64",
>                             kernel=kern,
> diff --git 
> a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts 
> b/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
> new file mode 100644
> index 0000000000..ad96a51c40
> --- /dev/null
> +++ 
> b/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
> @@ -0,0 +1,373 @@
> +/dts-v1/;
> +
> +/ {
> +	interrupt-parent = <0x8001>;
> +	#size-cells = <0x02>;
> +	#address-cells = <0x02>;
> +	compatible = "linux,dummy-virt";
> +
> +	psci {
> +		migrate = <0x84000005>;
> +		cpu_on = <0x84000003>;
> +		cpu_off = <0x84000002>;
> +		cpu_suspend = <0x84000001>;
> +		method = "hvc";
> +		compatible = "arm,psci-0.2\0arm,psci";
> +	};
> +
> +	memory@40000000 {
> +		reg = <0x00 0x40000000 0x00 0x8000000>;
> +		device_type = "memory";
> +	};
> +
> +	platform@c000000 {
> +		interrupt-parent = <0x8001>;
> +		ranges = <0x00 0x00 0xc000000 0x2000000>;
> +		#address-cells = <0x01>;
> +		#size-cells = <0x01>;
> +		compatible = "qemu,platform\0simple-bus";
> +	};
> +
> +	fw-cfg@9020000 {
> +		dma-coherent;
> +		reg = <0x00 0x9020000 0x00 0x18>;
> +		compatible = "qemu,fw-cfg-mmio";
> +	};
> +
> +	virtio_mmio@a000000 {
> +		dma-coherent;
> +		interrupts = <0x00 0x10 0x01>;
> +		reg = <0x00 0xa000000 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a000200 {
> +		dma-coherent;
> +		interrupts = <0x00 0x11 0x01>;
> +		reg = <0x00 0xa000200 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a000400 {
> +		dma-coherent;
> +		interrupts = <0x00 0x12 0x01>;
> +		reg = <0x00 0xa000400 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a000600 {
> +		dma-coherent;
> +		interrupts = <0x00 0x13 0x01>;
> +		reg = <0x00 0xa000600 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a000800 {
> +		dma-coherent;
> +		interrupts = <0x00 0x14 0x01>;
> +		reg = <0x00 0xa000800 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a000a00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x15 0x01>;
> +		reg = <0x00 0xa000a00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a000c00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x16 0x01>;
> +		reg = <0x00 0xa000c00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a000e00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x17 0x01>;
> +		reg = <0x00 0xa000e00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001000 {
> +		dma-coherent;
> +		interrupts = <0x00 0x18 0x01>;
> +		reg = <0x00 0xa001000 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001200 {
> +		dma-coherent;
> +		interrupts = <0x00 0x19 0x01>;
> +		reg = <0x00 0xa001200 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001400 {
> +		dma-coherent;
> +		interrupts = <0x00 0x1a 0x01>;
> +		reg = <0x00 0xa001400 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001600 {
> +		dma-coherent;
> +		interrupts = <0x00 0x1b 0x01>;
> +		reg = <0x00 0xa001600 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001800 {
> +		dma-coherent;
> +		interrupts = <0x00 0x1c 0x01>;
> +		reg = <0x00 0xa001800 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001a00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x1d 0x01>;
> +		reg = <0x00 0xa001a00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001c00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x1e 0x01>;
> +		reg = <0x00 0xa001c00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a001e00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x1f 0x01>;
> +		reg = <0x00 0xa001e00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002000 {
> +		dma-coherent;
> +		interrupts = <0x00 0x20 0x01>;
> +		reg = <0x00 0xa002000 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002200 {
> +		dma-coherent;
> +		interrupts = <0x00 0x21 0x01>;
> +		reg = <0x00 0xa002200 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002400 {
> +		dma-coherent;
> +		interrupts = <0x00 0x22 0x01>;
> +		reg = <0x00 0xa002400 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002600 {
> +		dma-coherent;
> +		interrupts = <0x00 0x23 0x01>;
> +		reg = <0x00 0xa002600 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002800 {
> +		dma-coherent;
> +		interrupts = <0x00 0x24 0x01>;
> +		reg = <0x00 0xa002800 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002a00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x25 0x01>;
> +		reg = <0x00 0xa002a00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002c00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x26 0x01>;
> +		reg = <0x00 0xa002c00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a002e00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x27 0x01>;
> +		reg = <0x00 0xa002e00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003000 {
> +		dma-coherent;
> +		interrupts = <0x00 0x28 0x01>;
> +		reg = <0x00 0xa003000 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003200 {
> +		dma-coherent;
> +		interrupts = <0x00 0x29 0x01>;
> +		reg = <0x00 0xa003200 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003400 {
> +		dma-coherent;
> +		interrupts = <0x00 0x2a 0x01>;
> +		reg = <0x00 0xa003400 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003600 {
> +		dma-coherent;
> +		interrupts = <0x00 0x2b 0x01>;
> +		reg = <0x00 0xa003600 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003800 {
> +		dma-coherent;
> +		interrupts = <0x00 0x2c 0x01>;
> +		reg = <0x00 0xa003800 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003a00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x2d 0x01>;
> +		reg = <0x00 0xa003a00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003c00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x2e 0x01>;
> +		reg = <0x00 0xa003c00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	virtio_mmio@a003e00 {
> +		dma-coherent;
> +		interrupts = <0x00 0x2f 0x01>;
> +		reg = <0x00 0xa003e00 0x00 0x200>;
> +		compatible = "virtio,mmio";
> +	};
> +
> +	gpio-keys {
> +		#address-cells = <0x01>;
> +		#size-cells = <0x00>;
> +		compatible = "gpio-keys";
> +
> +		poweroff {
> +			gpios = <0x8003 0x03 0x00>;
> +			linux,code = <0x74>;
> +			label = "GPIO Key Poweroff";
> +		};
> +	};
> +
> +	pl061@9030000 {
> +		phandle = <0x8003>;
> +		clock-names = "apb_pclk";
> +		clocks = <0x8000>;
> +		interrupts = <0x00 0x07 0x04>;
> +		gpio-controller;
> +		#gpio-cells = <0x02>;
> +		compatible = "arm,pl061\0arm,primecell";
> +		reg = <0x00 0x9030000 0x00 0x1000>;
> +	};
> +
> +	pcie@10000000 {
> +		interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> +		interrupt-map = <0x00 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x03 0x04 
> 0x00 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x04 0x04 0x00 0x00 0x00 0x03 
> 0x8001 0x00 0x00 0x00 0x05 0x04 0x00 0x00 0x00 0x04 0x8001 0x00 0x00 
> 0x00 0x06 0x04 0x800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x04 0x04 
> 0x800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x05 0x04 0x800 0x00 0x00 
> 0x03 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x04 0x8001 0x00 
> 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x05 
> 0x04 0x1000 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x06 0x04 0x1000 0x00 
> 0x00 0x03 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x04 0x8001 
> 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 
> 0x06 0x04 0x1800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x03 0x04 0x1800 
> 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x04 
> 0x8001 0x00 0x00 0x00 0x05 0x04>;
> +		#interrupt-cells = <0x01>;
> +		ranges = <0x1000000 0x00 0x00 0x00 0x3eff0000 0x00 0x10000 0x2000000 
> 0x00 0x10000000 0x00 0x10000000 0x00 0x2eff0000 0x3000000 0x80 0x00 
> 0x80 0x00 0x80 0x00>;
> +		reg = <0x40 0x10000000 0x00 0x10000000>;
> +		msi-parent = <0x8002>;
> +		dma-coherent;
> +		bus-range = <0x00 0xff>;
> +		linux,pci-domain = <0x00>;
> +		#size-cells = <0x02>;
> +		#address-cells = <0x03>;
> +		device_type = "pci";
> +		compatible = "pci-host-ecam-generic";
> +	};
> +
> +	pl031@9010000 {
> +		clock-names = "apb_pclk";
> +		clocks = <0x8000>;
> +		interrupts = <0x00 0x02 0x04>;
> +		reg = <0x00 0x9010000 0x00 0x1000>;
> +		compatible = "arm,pl031\0arm,primecell";
> +	};
> +
> +	pl011@9000000 {
> +		clock-names = "uartclk\0apb_pclk";
> +		clocks = <0x8000 0x8000>;
> +		interrupts = <0x00 0x01 0x04>;
> +		reg = <0x00 0x9000000 0x00 0x1000>;
> +		compatible = "arm,pl011\0arm,primecell";
> +	};
> +
> +	pmu {
> +	};
> +
> +	intc@8000000 {
> +		phandle = <0x8001>;
> +		reg = <0x00 0x8000000 0x00 0x10000 0x00 0x8010000 0x00 0x10000>;
> +		compatible = "arm,cortex-a15-gic";
> +		ranges;
> +		#size-cells = <0x02>;
> +		#address-cells = <0x02>;
> +		interrupt-controller;
> +		#interrupt-cells = <0x03>;
> +
> +		v2m@8020000 {
> +			phandle = <0x8002>;
> +			reg = <0x00 0x8020000 0x00 0x1000>;
> +			msi-controller;
> +			compatible = "arm,gic-v2m-frame";
> +		};
> +	};
> +
> +	flash@0 {
> +		bank-width = <0x04>;
> +		reg = <0x00 0x00 0x00 0x4000000 0x00 0x4000000 0x00 0x4000000>;
> +		compatible = "cfi-flash";
> +	};
> +
> +	cpus {
> +		#size-cells = <0x00>;
> +		#address-cells = <0x01>;
> +
> +		cpu@0 {
> +			reg = <0x00>;
> +			compatible = "arm,cortex-a15";
> +			device_type = "cpu";
> +		};
> +	};
> +
> +	timer {
> +		interrupts = <0x01 0x0d 0x104 0x01 0x0e 0x104 0x01 0x0b 0x104 0x01 
> 0x0a 0x104>;
> +		always-on;
> +		compatible = "arm,armv7-timer";
> +	};
> +
> +	apb-pclk {
> +		phandle = <0x8000>;
> +		clock-output-names = "clk24mhz";
> +		clock-frequency = <0x16e3600>;
> +		#clock-cells = <0x00>;
> +		compatible = "fixed-clock";
> +	};
> +
> +	chosen {
> +		stdout-path = "/pl011@9000000";
> +		/* Buildroot specific: KASLR needs to be disabled for the Kexec 
> test. */
> +		kaslr-seed = <0 0>;
> +	};
> +};

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
