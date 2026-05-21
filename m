Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605AACD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C3C423EF;
	Thu, 21 May 2026 20:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VEEFvg3Rsh7; Thu, 21 May 2026 20:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E2F423F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779396310;
	bh=UxazxbS08xBuurMgtukxeBrLoB6b3g4A9C7QCNxmG1g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BnRb9aLf9KAvtMx/6BOTnnSAHNeRvRCWg5M8IYpqxRt3G/tGAK+5rGD6PYTAVT/bl
	 0Dp9356BjzqO6XO62E4jr51/TV3qePEOdr0hRR+4rLHHhYREYCYlsWbJhMdfZ6w+Ch
	 GXSJNP72VV4URy0HwfRH6jZAOhp6RQbaKhE9YfZ5Le36ExbgSmlPRr3og1h9V/AcN0
	 wTR91gIalGVLk7lw13+4RfLFMgfhTBh7Z5Lc1QVE8pzfC13cD/s53QFSUQqI4i5bPs
	 svv32CSBR2ShBMV5BasruCbOLV2PlrYGGqcOQ+ethwY6KKK4U9gzqwp33xgEu1ol5r
	 VG6M8cLCHkpXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E2F423F3;
	Thu, 21 May 2026 20:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BED3282
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F28A584C5C
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GT195kXVZi5 for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:45:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00D8884C5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00D8884C5B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00D8884C5B
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:45:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D67BDB97C54F; Thu, 21 May 2026 22:45:04 +0200 (CEST)
Message-ID: <53fc8164-bce9-4383-ba06-1a99f7b995d9@rnout.be>
Date: Thu, 21 May 2026 22:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-8-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-8-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779396305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=6JahgYAVwjJ0Mu8u5s0jaaxCjmXhHh53715rF5ynmJQ=;
 b=RWDNii1FzKBoK/LdVrA45sh/Z5K3t6HHrd2YUukn3PpTyvpBqxxOh5xZl1+oby33gj4mPN
 1QMMJs6QT89erS15plnInuFb7hnufULHweU60QJUybXzseANb3e5OPeGZB1rnXoKzaPh7F
 wCKfS2vvMGLSY6CKFcsBx6LOZlymHRzcrlWZXgYaAu/mt7/spQIIOSykgMFbncIgGENljm
 RPOt/LFq7gFf5eWeNy6FHBkkL4z8MSWceMAOUJFqQV5NGWFV3fSFC0dW2YGBoGWIWUdiEq
 Lgiz2oue17/Pz5TzfOHJfTKPj8Z2FobHVH44M9/vG2AaKe8DzM7sAxMCQ/7xKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RWDNii1F
Subject: Re: [Buildroot] [PATCH v7 8/8] support/testing: add virglrenderer
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2026 04:03, Joseph Kogut wrote:
> Add basic smoke test for glmark2 running in a nested qemu guest with
> virtio-gpu-gl-pci.
> 
> The outer machine uses the Mesa softpipe driver for GLES support with
> minimal dependencies. Just test virgl for now, as lavapipe
> (software Vulkan driver) requires LLVM, and this validates
> virglrenderer.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   DEVELOPERS                                         |   1 +
>   .../testing/tests/package/test_virglrenderer.py    | 117 +++++++++++++++++++++
>   .../test_virglrenderer/linux-virgl.fragment        |   6 ++
>   .../test_virglrenderer/remove-qemu-blobs.sh        |  12 +++
>   .../rootfs-overlay/etc/profile.d/stty-raw.sh       |   3 +
>   5 files changed, 139 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 774eb0b746..0c0779e8b3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1766,6 +1766,7 @@ F:	package/sentry-cli/
>   F:	package/sentry-native/
>   F:	package/unclutter-xfixes/
>   F:	package/virglrenderer/
> +F:	support/testing/tests/package/test_virglrenderer.py
>   
>   N:	Joshua Henderson <joshua.henderson@microchip.com>
>   F:	package/qt5/qt5wayland/EGL_NOT_INITIALIZED
> diff --git a/support/testing/tests/package/test_virglrenderer.py b/support/testing/tests/package/test_virglrenderer.py
> new file mode 100644
> index 0000000000..521a4b67cd
> --- /dev/null
> +++ b/support/testing/tests/package/test_virglrenderer.py
> @@ -0,0 +1,117 @@
> +import os
> +
> +import infra
> +import infra.basetest
> +
> +
> +class TestVirglrendererNestedQemu(infra.basetest.BRTest):
> +    # We reuse the same initramfs-enabled kernel for the outer target and

  I think it's better to separate them, that makes it more clear what should be 
enabled in the host and what should be enabled in the guest. For the kernel it's 
OK to reuse them, but I think the rootfs's should be separated.

  Therefore also I think it's better to use a cpio than an initramfs.

> +    # nested guest. This fragment adds initramfs and 9p support so the outer
> +    # target can mount the runner's images directory and launch the same kernel
> +    # under target-side QEMU. We also enable DRM_VGEM to create the necessary

  I guess that's the only reason why one of the prebuilt kernels can't be used...

> +    # DRI device node, a requirement of qemu when using virgl.
> +    kern_frag = \
> +        infra.filepath("tests/package/test_virglrenderer/linux-virgl.fragment")
> +    post_build = \
> +        infra.filepath("tests/package/test_virglrenderer/remove-qemu-blobs.sh")
> +    rootfs_overlay = \
> +        infra.filepath("tests/package/test_virglrenderer/rootfs-overlay")
> +
> +    # Softpipe has no hardware dependencies and does not pull LLVM into the
> +    # build, unlike llvmpipe/lavapipe.

  Since there are no hardware dependencies, we can actually run it on aarch64 
(or arm) instead off x86_64, no? That is preferable, because that we detect 
cross-compilation issues and everything is emulated so there's definitely no 
dependency on the build environment.

> +    config = \
> +        f"""
> +        BR2_x86_64=y
> +        BR2_x86_nehalem=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
> +        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y

  Why do we need eudev?

> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{post_build}"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +        # BR2_PACKAGE_EUDEV_ENABLE_HWDB is not set
> +        BR2_PACKAGE_GLMARK2=y
> +        BR2_PACKAGE_LIBGLVND=y
> +        BR2_PACKAGE_MESA3D=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y

  This again confuses me - why do you need both softpipe and virgl? Or is it 
just because we are reusing the same binary in the host and guest?

> +        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> +        BR2_PACKAGE_MESA3D_OPENGL_ES=y
> +        BR2_PACKAGE_QEMU=y
> +        BR2_PACKAGE_QEMU_SYSTEM=y
> +        # BR2_PACKAGE_QEMU_SYSTEM_KVM is not set
> +        BR2_PACKAGE_QEMU_SYSTEM_TCG=y
> +        BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
> +        BR2_PACKAGE_QEMU_TARGET_X86_64=y
> +        BR2_PACKAGE_QEMU_VIRGLRENDERER=y
> +        BR2_TARGET_ROOTFS_INITRAMFS=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def boot_outer(self):
> +        kern = os.path.join(self.builddir, "images", "bzImage")
> +        img_dir = os.path.join(self.builddir, "images")
> +        virtfs_tag = "br-imgs"
> +        virtfs_opts = [
> +            f"local,path={img_dir}",
> +            f"mount_tag={virtfs_tag}",
> +            "security_model=mapped-xattr",
> +            "readonly=on"
> +        ]
> +        self.emulator.boot(arch="x86_64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyS0"],
> +                           options=["-cpu", "Nehalem",
> +                                    "-m", "1536M",
> +                                    "-smp", "4",

  Any reason to use more than one CPU?

> +                                    "-vga", "none",
> +                                    "-virtfs", ",".join(virtfs_opts)])
> +        self.emulator.login()
> +        self.assertRunOk(f"mount -t 9p {virtfs_tag} /mnt/")
> +
> +    def boot_nested(self):
> +        qemu_cmd = "env LIBGL_ALWAYS_SOFTWARE=1 GALLIUM_DRIVER=softpipe"
> +        qemu_cmd += " qemu-system-x86_64"
> +        qemu_cmd += " -M q35,accel=tcg"
> +        qemu_cmd += " -cpu Nehalem"
> +        qemu_cmd += " -m 512M"
> +        qemu_cmd += " -smp 4"
> +        qemu_cmd += " -nodefaults"
> +        qemu_cmd += " -display egl-headless,gl=on"
> +        qemu_cmd += " -device virtio-gpu-gl-pci"
> +        qemu_cmd += " -serial stdio"
> +        qemu_cmd += " -kernel /mnt/bzImage"
> +        qemu_cmd += " -append 'console=ttyS0 br-nested-virgl'"
> +
> +        # qemu runs in the foreground on the current serial console. Once it
> +        # starts, the next login prompt belongs to the nested guest.
> +        self.emulator.qemu.sendline(qemu_cmd)
> +        self.emulator.login(timeout=180)
> +
> +    def test_run(self):
> +        self.boot_outer()
> +        self.assertRunOk("while [ ! -e /dev/dri/renderD128 ]; do sleep 1; done",
> +                         timeout=30)
> +
> +        self.boot_nested()
> +
> +        out, ret = self.emulator.run("cat /proc/cmdline")
> +        self.assertEqual(ret, 0)
> +        self.assertIn("br-nested-virgl", out[0])
> +
> +        cmd = "env MESA_LOADER_DRIVER_OVERRIDE=virtio_gpu"
> +        cmd += " glmark2-es2-drm --validate --off-screen"
> +        cmd += " --benchmark build:use-vbo=false"
> +        out, ret = self.emulator.run(cmd, timeout=60)
> +        self.assertEqual(ret, 0)

  So, this would fail if qemu wasn't built with virglrenderer?
> +
> +        renderer = "\n".join([line for line in out if "GL_RENDERER:" in line])
> +        self.assertRegex(renderer, r"(?i)virgl")

  Or just this one?

> +        self.assertRegex(renderer, r"(?i)softpipe")
> diff --git a/support/testing/tests/package/test_virglrenderer/linux-virgl.fragment b/support/testing/tests/package/test_virglrenderer/linux-virgl.fragment
> new file mode 100644
> index 0000000000..1023aedc6f
> --- /dev/null
> +++ b/support/testing/tests/package/test_virglrenderer/linux-virgl.fragment
> @@ -0,0 +1,6 @@
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_DRM_VGEM=y
> +CONFIG_NET_9P=y
> +CONFIG_NET_9P_VIRTIO=y
> +CONFIG_9P_FS=y
> +CONFIG_9P_FS_POSIX_ACL=y
> diff --git a/support/testing/tests/package/test_virglrenderer/remove-qemu-blobs.sh b/support/testing/tests/package/test_virglrenderer/remove-qemu-blobs.sh
> new file mode 100755
> index 0000000000..ff040aa96b
> --- /dev/null
> +++ b/support/testing/tests/package/test_virglrenderer/remove-qemu-blobs.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +set -eu
> +
> +qemu_dir="${TARGET_DIR}/usr/share/qemu"
> +
> +find "${qemu_dir}" -type f \
> +	! -name 'bios-256k.bin' \
> +	! -name 'kvmvapic.bin' \
> +	! -name 'linuxboot.bin' \
> +	! -name 'linuxboot_dma.bin' \
> +	-delete

  Why do you need to remove those? Is it just because otherwise the cpio becomes 
too big to be used for an initramfs?

  Regards,
  Arnout

> diff --git a/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
> new file mode 100644
> index 0000000000..bc1857a910
> --- /dev/null
> +++ b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
> @@ -0,0 +1,3 @@
> +# Avoid double-cooking the nested serial console, otherwise the test
> +# infrastructure cannot reliably retrieve return codes.
> +grep -Fq br-nested-virgl /proc/cmdline && stty raw
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
