Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5149C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 18:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D25440003;
	Sat, 12 Aug 2023 18:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D25440003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbmmBx-YtuxX; Sat, 12 Aug 2023 18:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 634EE40227;
	Sat, 12 Aug 2023 18:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 634EE40227
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 755421BF41F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A6A0409A6
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 18:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6A0409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ew8x6DCLV8ig for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 18:38:35 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A848B40988
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 18:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A848B40988
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F1BA9780333;
 Sat, 12 Aug 2023 20:38:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 20:38:31 +0200
Date: Sat, 12 Aug 2023 20:38:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230812183831.GQ421096@scaer>
References: <20230810205917.359505-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810205917.359505-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691865514;
 bh=zx+rtg54kYZeSnY683ELPEf24T3fumtyWv2g2MHoy5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DFQCupq5ZzQWpJsDwYCoC5J2RuUj8cn/YCp2rESz4S7c6Quj97xxYBMwGoQuciNbH
 4b5hgIScTNKN/Xk2qFoWrwhFR/eRun88mBi6eHzWXgjRgII8uHQ/sjDOK31ND9xdLi
 Ut2YSthDNUOF7ttD7Q1UiErDLkETuCGs7q1bxyQmsfg6D+brJGVXWaH9+PWYiPe9Pl
 ZIeWriWFWDryCT8uOEJiXkMs5/QeStI/sgjBEr6c1tR22p46lk6OS4/1PyVuTOKW7J
 Xfx32uZdiOW1ezqs9P36Y5MX1pWyEj65JcE5YFrHg/tYclPURlBpksFrk9udzZWLkM
 KVP+gfQL6H4Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DFQCupq5
Subject: Re: [Buildroot] [PATCH next 1/1]
 support/testing/tests/package/test_weston.py: new runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-08-10 22:59 +0200, Julien Olivain spake thusly:
> This test is a followup of the discussion at:
> https://lists.buildroot.org/pipermail/buildroot/2023-July/671639.html
> 
> It provides an example of a runtime tests using standard Linux graphic
> components (Kernel, DRM, Mesa3D, weston).
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

I've applied to next, after doing a few quick fixups:

  - use an overlay rather than create config file at runtime
  - sleep in python not in target
  - increase delay to capture DRI CRCs

I had to increase the runtime of the test from 2s (120 CRCs) up to 5s
(300 CRCs), because from time to time, my machine was not fast enough to
get 4 different CRCs out of the 120 captured ones. Not sure why...

Anyway, running for 5s is not what takes time in this runtime test. :-]

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Note:
> This runtime test uses BR2_PACKAGE_WESTON_SIMPLE_CLIENTS=y which was
> proposed in a separate series:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=367218
> 
> ---
>  DEVELOPERS                                    |   2 +
>  support/testing/tests/package/test_weston.py  | 191 ++++++++++++++++++
>  .../package/test_weston/linux-vkms.fragment   |   2 +
>  3 files changed, 195 insertions(+)
>  create mode 100644 support/testing/tests/package/test_weston.py
>  create mode 100644 support/testing/tests/package/test_weston/linux-vkms.fragment
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0bed35fd8e..b7c8aed502 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1814,6 +1814,8 @@ F:	support/testing/tests/package/test_python_spake2.py
>  F:	support/testing/tests/package/test_rdma_core.py
>  F:	support/testing/tests/package/test_rdma_core/
>  F:	support/testing/tests/package/test_stress_ng.py
> +F:	support/testing/tests/package/test_weston.py
> +F:	support/testing/tests/package/test_weston/
>  F:	support/testing/tests/package/test_xz.py
>  F:	support/testing/tests/package/test_z3.py
>  F:	support/testing/tests/package/test_z3/
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> new file mode 100644
> index 0000000000..616a23bb56
> --- /dev/null
> +++ b/support/testing/tests/package/test_weston.py
> @@ -0,0 +1,191 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestWeston(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> +        BR2_PACKAGE_LIBDRM=y
> +        BR2_PACKAGE_MESA3D=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_LLVM=y
> +        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> +        BR2_PACKAGE_MESA3D_OPENGL_ES=y
> +        BR2_PACKAGE_WAYLAND_UTILS=y
> +        BR2_PACKAGE_WESTON=y
> +        BR2_PACKAGE_WESTON_SIMPLE_CLIENTS=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """.format(
> +            infra.filepath("tests/package/test_weston/linux-vkms.fragment"))
> +
> +    weston_ini_path = "/tmp/weston.ini"
> +
> +    def gen_read_disp_crcs_cmd(self, count=1):
> +        # DRM CRCs are exposed through a sysfs pseudo file, one mesure
> +        # per line. The first column is the frame number, the second
> +        # column is the CRC measure. We use "head" to get the needed
> +        # CRC count.
> +        disp_crc_path = "/sys/kernel/debug/dri/0/crtc-0/crc/data"
> +        cmd = f"head -{count} {disp_crc_path}"
> +
> +        # The DRM CRC sysfs pseudo file lines are terminated by '\n'
> +        # and '\0'. We remove the '\0' to have a text-only output.
> +        cmd += " | tr -d '\\000'"
> +
> +        # Finally, we drop the frame counter, and keep only the second
> +        # column (CRC values)
> +        cmd += " | cut -f 2 -d ' '"
> +
> +        return cmd
> +
> +    def gen_count_unique_disp_crcs_cmd(self, count=10):
> +        # We get the command generating one CRC per line...
> +        cmd = self.gen_read_disp_crcs_cmd(count)
> +        # ...then count the number of unique values
> +        cmd += " | uniq | wc -l"
> +        return cmd
> +
> +    def create_weston_ini(self):
> +        # The shell "clock-format" is set to "none", in order to have
> +        # stable display output, independant from the time. The
> +        # display output can then be reliably checked with VKMS CRC.
> +        # "startup-animation" and "close-animation" are set to "none"
> +        # for faster transitions (fade animations with a software GLES
> +        # implementation tend to be slow). Finally, we force the
> +        # smallest standard display output mode resolution, again for
> +        # faster test execution.
> +        weston_ini = "[shell]\n"
> +        weston_ini += "clock-format=none\n"
> +        weston_ini += "startup-animation=none\n"
> +        weston_ini += "close-animation=none\n"
> +        weston_ini += "[output]\n"
> +        weston_ini += "name=Virtual-1\n"
> +        weston_ini += "mode=640x480"
> +
> +        self.assertRunOk(f"cat >{self.weston_ini_path} <<EOF\n{weston_ini}\nEOF")
> +
> +    def start_weston(self):
> +        self.assertRunOk("export XDG_RUNTIME_DIR=/tmp")
> +
> +        cmd = "weston"
> +        cmd += f" --config={self.weston_ini_path}"
> +        cmd += " --continue-without-input"
> +        cmd += " --log=/tmp/weston.log"
> +        cmd += " &> /dev/null &"
> +        self.assertRunOk(cmd)
> +
> +        self.assertRunOk("export WAYLAND_DISPLAY=wayland-1")
> +
> +    def wait_for_weston(self):
> +        # We wait for the wayland socket to appear...
> +        wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
> +        cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; done"
> +        self.assertRunOk(cmd, timeout=10)
> +
> +    def stop_weston(self):
> +        cmd = "killall weston && sleep 3"
> +        self.assertRunOk(cmd)
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt",
> +                                    "-cpu", "cortex-a57",
> +                                    "-smp", "4",
> +                                    "-m", "256M",
> +                                    "-initrd", img])
> +        self.emulator.login()
> +
> +        # Check the weston binary can execute
> +        self.assertRunOk("weston --version")
> +
> +        self.create_weston_ini()
> +        self.start_weston()
> +        self.wait_for_weston()
> +
> +        # Check a simple info client can communicate with the compositor
> +        self.assertRunOk("wayland-info", timeout=10)
> +
> +        # This test will use the Kernel VKMS DRM Display CRC support,
> +        # which is exposed in debugfs. See:
> +        # https://docs.kernel.org/gpu/drm-uapi.html#display-crc-support
> +        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
> +
> +        # We get 10 consecutive DRM frame CRCs and count how many
> +        # unique CRCs we have. Since weston is supposed to run idle,
> +        # we should have 10 times the same display CRC.
> +        cmd = self.gen_count_unique_disp_crcs_cmd()
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(int(output[0]), 1)
> +
> +        # We save the CRC value of an empty weston desktop for
> +        # later...
> +        cmd = self.gen_read_disp_crcs_cmd()
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        weston_desktop_crc = int(output[0], 16)
> +
> +        # We start the weston-simple-egl in background...  Every
> +        # rendered frame is supposed to be different (as the triangle
> +        # animation is derived from the system time). Since all the
> +        # rendering (client application and compositor) is in
> +        # software, we sleep a bit to let those program to settle.
> +        cmd = "weston-simple-egl >/dev/null 2>&1 & sleep 4"
> +        self.assertRunOk(cmd, timeout=8)
> +
> +        # Since the weston-simple-egl client is supposed to run and
> +        # display something, we are now supposed to measure a
> +        # different display CRC than the one we measured when the
> +        # desktop was empty.
> +        cmd = self.gen_read_disp_crcs_cmd()
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertNotEqual(int(output[0], 16), weston_desktop_crc)
> +
> +        # While weston-simple-egl is running, we check the VKMS DRM
> +        # CRCs are now changing. We get many CRCs, one per display
> +        # driver refresh (at ~60Hz). Since all the rendering is in
> +        # software, we can expect a slow frame rate. In 120 captured
> +        # CRCs, we expect at least 4 different values (i.e. 2 fps).
> +        # This guarantees the rendering pipeline is working, while we
> +        # remain very permissive to slow emulation situations.
> +        cmd = self.gen_count_unique_disp_crcs_cmd(120)
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertGreaterEqual(int(output[0]), 4)
> +
> +        # We stop weston-simple-egl, and sleep a bit to let Weston do
> +        # its cleanup and desktop repaint refresh...
> +        self.assertRunOk("killall weston-simple-egl && sleep 4", timeout=8)
> +
> +        # After we stopped the application, we should have the initial
> +        # weston desktop background. The CRC we measure now should be
> +        # the same as the one we saved earlier.
> +        cmd = self.gen_read_disp_crcs_cmd()
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(int(output[0], 16), weston_desktop_crc)
> +
> +        self.stop_weston()
> +
> +        # Now weston is supposed to be stopped,
> +        # a simple client is expected to fail.
> +        _, exit_code = self.emulator.run("wayland-info")
> +        self.assertNotEqual(exit_code, 0)
> diff --git a/support/testing/tests/package/test_weston/linux-vkms.fragment b/support/testing/tests/package/test_weston/linux-vkms.fragment
> new file mode 100644
> index 0000000000..3fc7a5dded
> --- /dev/null
> +++ b/support/testing/tests/package/test_weston/linux-vkms.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_DEBUG_FS=y
> +CONFIG_DRM_VKMS=y
> -- 
> 2.41.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
