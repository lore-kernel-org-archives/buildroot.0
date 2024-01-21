Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4F9C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 13:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87B20400CE;
	Sun, 21 Jan 2024 13:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B20400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHYwcIAqlaoI; Sun, 21 Jan 2024 13:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E1774037E;
	Sun, 21 Jan 2024 13:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1774037E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4B31BF20F
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 13:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E83D417A2
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 13:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E83D417A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8FDxKC0M9Ck for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 13:59:23 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 262A141749
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 13:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262A141749
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 39AF313F8C0;
 Sun, 21 Jan 2024 14:59:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 14:59:18 +0100
Date: Sun, 21 Jan 2024 14:59:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Za0jNoEFYccULASy@landeda>
References: <20240116210556.589407-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240116210556.589407-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705845560;
 bh=kEIg5DKJgJ6bUGELeZsKtJMRMII52gbShiiVtq73ELM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AbioU1e35zQOlipUsuX1QP8Uk7ybNBE9JoEFG0ehmm+4/s7eBPwcKuqM3A6kKoFWn
 2TY9r4wW1XfkR2PJw3bkpeNMab4ihIdUm4QLXfcdf/UjPOuvILPHfGbqQXurtkXcqS
 XVyaj0ggJ/NexJCDvAUwhCTsDNoVJZA+/Pf77RcpjAQjN++KEwhbJCpy1uXW/SBlzz
 4Nx4TNBD6wx+ksmUTfEm21+njXgDGpnOBLwI7jnI8Ny23cs+D4FpyYBTZdVwkcurl2
 J2TkkQ+VJ9Ns+Eb1UOV1ssiL0+Hd3Ut9r8RQlPu5mQuxbdluIamF2etTAEFuF9h4az
 h6L02cVnprY8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AbioU1e3
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add micropython
 runtime test
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

On 2024-01-16 22:05 +0100, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

I did a few cosmetic changes, mostly: run commands on the target, but
run the verification in the infra. For example, I changed constructs
like:
    run("micropython -c 'foo = something(); assert foo == 0'")
into:
    out = run("micropython -c 'print(something())'")
    self.assertEqual(int(out[0]), 0, "error message")

Indeed, we don't want to be using the tested program to validate that
the tested program works as expected...

Applied to master with those few changes, thanks!

> ---
> Test is working on tag 2023.11, but fails on tag 2023.11.1 and branch
> master at commit e07402a (micropython fail to compile, maybe due to
> the bump to version 1.22.0?).
[--SNIP--]
>     /buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.2.1/../../../../aarch64-none-linux-gnu/bin/ld: build-standard/modffi.o: in function 'char2ffi_type':
>     /buildroot/output/build/micropython-1.22.0/ports/unix/modffi.c:119:(.text.char2ffi_type+0x28): undefined reference to 'ffi_type_sint8'
>     [...and many others...]

The culprit was commit 9024e1866523 (package/micropython: drop GIT_DIR=.
workaround), for which I pushed a fixup, as 6c9be611a8b7.

Regards,
Yann E. MORIN.

> The test is also working when patch [1] is applied, because libffi is
> no longer compiled.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240116183629.365115-1-fontaine.fabrice@gmail.com/
> ---
>  DEVELOPERS                                    |  2 +
>  .../testing/tests/package/test_micropython.py | 66 +++++++++++++++++++
>  .../rootfs-overlay/root/mandel.py             | 25 +++++++
>  3 files changed, 93 insertions(+)
>  create mode 100644 support/testing/tests/package/test_micropython.py
>  create mode 100755 support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f5b04937b6..0f961ea486 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1789,6 +1789,8 @@ F:	support/testing/tests/package/test_lzip.py
>  F:	support/testing/tests/package/test_lsof.py
>  F:	support/testing/tests/package/test_lz4.py
>  F:	support/testing/tests/package/test_lzop.py
> +F:	support/testing/tests/package/test_micropython.py
> +F:	support/testing/tests/package/test_micropython/
>  F:	support/testing/tests/package/test_mtools.py
>  F:	support/testing/tests/package/test_ncdu.py
>  F:	support/testing/tests/package/test_nftables.py
> diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
> new file mode 100644
> index 0000000000..6d213c7ea5
> --- /dev/null
> +++ b/support/testing/tests/package/test_micropython.py
> @@ -0,0 +1,66 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestMicroPython(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        f"""
> +        BR2_PACKAGE_MICROPYTHON=y
> +        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_micropython/rootfs-overlay")}"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def run_upy_code(self, python_code):
> +        cmd = f'micropython -c "{python_code}"'
> +        self.assertRunOk(cmd)
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # The micropython binary can execute.
> +        self.assertRunOk("micropython -h")
> +
> +        # Check implementation is 'micropython'.
> +        py_code = "import sys ; assert sys.implementation.name == 'micropython'"
> +        self.run_upy_code(py_code)
> +
> +        # Query interpreter version and implementation.
> +        py_code = "import sys ; "
> +        py_code += "print('Version:', sys.version) ; "
> +        py_code += "print('Implementation:', sys.implementation)"
> +        self.run_upy_code(py_code)
> +
> +        # Check micropython optimization are correctly reported.
> +        for opt_level in range(4):
> +            py_code = "import micropython ; "
> +            py_code += "opt = micropython.opt_level() ; "
> +            py_code += "print(opt) ; "
> +            py_code += f"assert opt == {opt_level}"
> +            cmd = f"micropython -O{opt_level} -c '{py_code}'"
> +            self.assertRunOk(cmd)
> +
> +        # Check micropython can return a non-zero exit code.
> +        expected_code = 123
> +        py_code = "import sys ; "
> +        py_code += f"sys.exit({expected_code})"
> +        cmd = f'micropython -c "{py_code}"'
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, expected_code)
> +
> +        # We check micropython computes correctly.
> +        input_value = 1234
> +        expected_output = str(sum(range(input_value)))
> +        py_code = f"print(sum(range(({input_value}))))"
> +        cmd = f'micropython -c "{py_code}"'
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], expected_output)
> +
> +        # Finally, we check check a small script can execute.
> +        self.assertRunOk("/root/mandel.py", timeout=10)
> diff --git a/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py b/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py
> new file mode 100755
> index 0000000000..0552f6894c
> --- /dev/null
> +++ b/support/testing/tests/package/test_micropython/rootfs-overlay/root/mandel.py
> @@ -0,0 +1,25 @@
> +#! /usr/bin/env micropython
> +
> +from micropython import mem_info
> +
> +POINTS = list(",.:-;!/>)|&IH%*Z")
> +
> +
> +def mandel():
> +    for y in range(-15, 16):
> +        for x in range(1, 85):
> +            i = 0
> +            r = 0
> +            for k in range(112):
> +                j = (r*r) - (i*i) - 2 + (x/25)
> +                i = 2 * r * i + (y/10)
> +                if j*j + i*i >= 11:
> +                    break
> +                r = j
> +            print(POINTS[k & 0xF], end='')
> +        print()
> +
> +
> +if __name__ == '__main__':
> +    mandel()
> +    mem_info()
> -- 
> 2.43.0
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
