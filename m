Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A608EE94115
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 20:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C8E6FABB;
	Fri,  6 Oct 2023 20:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C8E6FABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qYzK5sOV584; Fri,  6 Oct 2023 20:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194696FABC;
	Fri,  6 Oct 2023 20:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194696FABC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07D221BF2B5
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D539640114
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D539640114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opY_p-6fSefw for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 20:15:54 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A732400AF
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 20:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A732400AF
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A373EB0057C;
 Fri,  6 Oct 2023 22:15:51 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41492])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Oct 2023 22:15:51 +0200
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 22:15:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <f57167b1488b3c5ad76362dd8bca1b12d281aa19.1696522656.git.yann.morin.1998@free.fr>
References: <cover.1696522656.git.yann.morin.1998@free.fr>
 <f57167b1488b3c5ad76362dd8bca1b12d281aa19.1696522656.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.3
Message-ID: <4b6283fd3a4f2c41d17a0be305e5b055@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696623352;
 bh=/KF+DARxBfRrWvtlLLIsiKVwmvM0yR/22BdllP9px84=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cRh7U9CZTRrrWMTXQy7PkzCaVDzqaNT5N0s4+5tjioi5kdB5LBefr/7m+1CRitRli
 05VoJWk8JYM4sKbztfIQH3n+MrnycN7o1fJiqTdVzBWGYR2Lli4z2VTg8fFpet+yXc
 mE1byX8G//I5FTx/YXLSCqwleDXw1yPcoEqNnzH3nE1St0hta7Dc5imczUcGnpMzPC
 ABrj/O5peXdC9/g65bWe/6cBMZwONcrDqnBJ7LpFsfJjRIkeVXd0shbgnTmXbJLBuB
 N5Mglr/fl8ToGhXSV4TCyvbhkaajQrlPGDq+Ng61XkPEAtSpiNvNQif/6Dlyr5OjEl
 1YZ/pr5wY3pyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cRh7U9CZ
Subject: Re: [Buildroot] [PATCH 1/2 v2] support/runtime-test: add helper to
 test graphics rendering
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Thanks for this patch!

On 05/10/2023 18:17, Yann E. MORIN wrote:
> In 4edb0e3456ef (support/testing/tests/package/test_weston.py: new
> runtime test), the weston test was introduced, and thus was the first
> that needed to test that rendering was happening.
> 
> Now we also have a test for a flutter application, and we'll want to
> have it test the rendering too.
> 
> Move the corresponding code to a helper that can be reused by other
> tests, rather than duplicate (or reinvent) it.
> 
> Switch weston to using that new helper.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/graphics_base.py       | 39 +++++++++++++
>  support/testing/tests/package/test_weston.py | 61 ++++----------------
>  2 files changed, 49 insertions(+), 51 deletions(-)
>  create mode 100644 support/testing/tests/graphics_base.py
> 
> diff --git a/support/testing/tests/graphics_base.py 
> b/support/testing/tests/graphics_base.py
> new file mode 100644
> index 0000000000..15a4c00bb2
> --- /dev/null
> +++ b/support/testing/tests/graphics_base.py
> @@ -0,0 +1,39 @@
> +class GraphicsBase:

For those graphics tests (llvmpipe/swrast Mesa3D, VKMS) to work
properly, there is some common mandatory configurations which
will always be needed. I am mainly thinking about:

     BR2_PACKAGE_LIBDRM=y
     BR2_PACKAGE_MESA3D=y
     BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
     BR2_PACKAGE_MESA3D_LLVM=y
     BR2_PACKAGE_MESA3D_OPENGL_EGL=y
     BR2_PACKAGE_MESA3D_OPENGL_ES=y

The Kernel will also always need at least:

     CONFIG_DEBUG_FS=y
     CONFIG_DRM_VKMS=y

In term of cpu architecture and emulated machine, there is no
mandatory requirements, but to achieve decent test execution speed, a
fast "machines" that also allow SMP and higher amount of memory are
recommended. armv5-7 machines can be limited in maximum amount of
memory and slow to execute Mesa3D. So x86_64 pc, Aarch64 or RISC-V 64bit
virt will generally be architectures/machines of choice.

Do you think it would be relevant to provide some base reference
Buildroot+Kernel configs or templates, and the emulator startup
command line in this base class?

> +    def get_n_fb_crc(self, *, count=10, uniq=False, timeout=-1):
> +        """
> +        Return count DRM CRC from the framebuffer. If uniq is True,
> +        only unique CRCs are returned (which may be less than the
> +        requested cont).
> +        Returns a possibly empty list of integers.
> +        Set timeout to -1 for no timeout, or to a positive number for
> +        a timeout of that many seconds.
> +        """
> +        # DRM CRCs are exposed through a sysfs pseudo file
> +        try:
> +            self.debugfs_mounted
> +        except AttributeError:
> +            # Note: some init system (e.g. systemd) may have this 
> already
> +            # mounted, so check beforehand
> +            self.assertRunOk("mountpoint /sys/kernel/debug/ || mount 
> -t debugfs none /sys/kernel/debug/")
> +            self.debugfs_mounted = True
> +
> +        # The first column is the frame number, the second column is 
> the
> +        # CRC measure. We use "head" to get the needed CRC count.
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
> +        if uniq:
> +            cmd += " | sort -u"
> +
> +        output, exit_code = self.emulator.run(cmd, timeout=timeout)
> +        self.assertTrue(exit_code == 0, f"'{cmd}' failed with exit 
> code {exit_code}")
> +
> +        return [int(crc, 16) for crc in output]
> diff --git a/support/testing/tests/package/test_weston.py 
> b/support/testing/tests/package/test_weston.py
> index df1b7a4135..f37a73565f 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -2,9 +2,10 @@ import os
>  import time
> 
>  import infra.basetest
> +from ..graphics_base import GraphicsBase
> 
> 
> -class TestWeston(infra.basetest.BRTest):
> +class TestWeston(infra.basetest.BRTest, GraphicsBase):
>      config = \
>          """
>          BR2_aarch64=y
> @@ -36,31 +37,6 @@ class TestWeston(infra.basetest.BRTest):
>                  
> infra.filepath("tests/package/test_weston/linux-vkms.fragment")
>               )
> 
> -    def gen_read_disp_crcs_cmd(self, count=1):
> -        # DRM CRCs are exposed through a sysfs pseudo file, one 
> measure
> -        # per line. The first column is the frame number, the second
> -        # column is the CRC measure. We use "head" to get the needed
> -        # CRC count.
> -        disp_crc_path = "/sys/kernel/debug/dri/0/crtc-0/crc/data"
> -        cmd = f"head -{count} {disp_crc_path}"
> -
> -        # The DRM CRC sysfs pseudo file lines are terminated by '\n'
> -        # and '\0'. We remove the '\0' to have a text-only output.
> -        cmd += " | tr -d '\\000'"
> -
> -        # Finally, we drop the frame counter, and keep only the second
> -        # column (CRC values)
> -        cmd += " | cut -f 2 -d ' '"
> -
> -        return cmd
> -
> -    def gen_count_unique_disp_crcs_cmd(self, count=10):
> -        # We get the command generating one CRC per line...
> -        cmd = self.gen_read_disp_crcs_cmd(count)
> -        # ...then count the number of unique values
> -        cmd += " | uniq | wc -l"
> -        return cmd
> -
>      def start_weston(self):
>          self.assertRunOk("export XDG_RUNTIME_DIR=/tmp")
> 
> @@ -106,25 +82,14 @@ class TestWeston(infra.basetest.BRTest):
>          # Check a simple info client can communicate with the 
> compositor
>          self.assertRunOk("wayland-info", timeout=10)
> 
> -        # This test will use the Kernel VKMS DRM Display CRC support,
> -        # which is exposed in debugfs. See:
> -        # 
> https://docs.kernel.org/gpu/drm-uapi.html#display-crc-support
> -        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
> -
>          # We get 10 consecutive DRM frame CRCs and count how many
>          # unique CRCs we have. Since weston is supposed to run idle,
>          # we should have 10 times the same display CRC.
> -        cmd = self.gen_count_unique_disp_crcs_cmd()
> -        output, exit_code = self.emulator.run(cmd)
> -        self.assertEqual(exit_code, 0)
> -        self.assertEqual(int(output[0]), 1)
> +        self.assertTrue(len(self.get_n_fb_crc(uniq=True)) == 1)
> 
>          # We save the CRC value of an empty weston desktop for
>          # later...
> -        cmd = self.gen_read_disp_crcs_cmd()
> -        output, exit_code = self.emulator.run(cmd)
> -        self.assertEqual(exit_code, 0)
> -        weston_desktop_crc = int(output[0], 16)
> +        weston_desktop_crc = self.get_n_fb_crc(count=1)[0]
> 
>          # We start the weston-simple-egl in background...  Every
>          # rendered frame is supposed to be different (as the triangle
> @@ -138,10 +103,8 @@ class TestWeston(infra.basetest.BRTest):
>          # display something, we are now supposed to measure a
>          # different display CRC than the one we measured when the
>          # desktop was empty.
> -        cmd = self.gen_read_disp_crcs_cmd()
> -        output, exit_code = self.emulator.run(cmd)
> -        self.assertEqual(exit_code, 0)
> -        self.assertNotEqual(int(output[0], 16), weston_desktop_crc)
> +        crc = self.get_n_fb_crc(count=1)[0]
> +        self.assertNotEqual(crc, weston_desktop_crc)
> 
>          # While weston-simple-egl is running, we check the VKMS DRM
>          # CRCs are now changing. We get many CRCs, one per display
> @@ -152,10 +115,8 @@ class TestWeston(infra.basetest.BRTest):
>          # remain very permissive to slow emulation situations.
>          # Increase timeout, as the command is expected to run about 
> 5s,
>          # which is the default timeout.
> -        cmd = self.gen_count_unique_disp_crcs_cmd(300)
> -        output, exit_code = self.emulator.run(cmd, timeout=10)
> -        self.assertEqual(exit_code, 0)
> -        self.assertGreaterEqual(int(output[0]), 5)
> +        crcs = self.get_n_fb_crc(count=300, timeout=10)
> +        self.assertGreaterEqual(len(crcs), 5)
> 
>          # We stop weston-simple-egl, and sleep a bit to let Weston do
>          # its cleanup and desktop repaint refresh...
> @@ -165,10 +126,8 @@ class TestWeston(infra.basetest.BRTest):
>          # After we stopped the application, we should have the initial
>          # weston desktop background. The CRC we measure now should be
>          # the same as the one we saved earlier.
> -        cmd = self.gen_read_disp_crcs_cmd()
> -        output, exit_code = self.emulator.run(cmd)
> -        self.assertEqual(exit_code, 0)
> -        self.assertEqual(int(output[0], 16), weston_desktop_crc)
> +        crc = self.get_n_fb_crc(count=1)[0]
> +        self.assertEqual(crc, weston_desktop_crc)
> 
>          self.stop_weston()
> 
> --
> 2.25.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
