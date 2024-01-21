Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D04C47DB7
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 09:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 329A240167;
	Sun, 21 Jan 2024 09:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329A240167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfTcHuwu-kpD; Sun, 21 Jan 2024 09:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEAAB4017B;
	Sun, 21 Jan 2024 09:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEAAB4017B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ED6B1BF865
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 09:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06FF0828DD
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 09:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FF0828DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1UAH6dd5oPx for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 09:38:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D462182200
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 09:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D462182200
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1B50E13F8A9;
 Sun, 21 Jan 2024 10:38:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 10:38:07 +0100
Date: Sun, 21 Jan 2024 10:38:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zazl_wVaiiEwpI9N@landeda>
References: <20240112204952.229925-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112204952.229925-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705829890;
 bh=c47umE2H0PTqZv9Cs1b+/BNrPAMXWq3LSGTTB5bR+qU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dXuvqwb5V4jKz7WnbOZYiupn43gSLtz1u7bmhbceluii9WUJW64y1ZXi7QyFn5r/Q
 lRBn93QAJDWDSQf2/nyZDeWbF9YOt4jS1hXszCteS7Qw8ipLFNEG2UAeM3HONPDbP8
 i7EJrKFrJOCn1M1Z+3aPzLrvCtKnVkQ8RShchvpuY8Mb2PLiia8f4EUyYZW+seFn7E
 H8jiTSgIxk4wgh0Xiqnq5TppmJpvf/gAl67c5LpVcyoRrTClCpgJVMpCopWsfkgwai
 to3iTRLrwxCwRXmbEAIQXm/EROExiDtlA7lLdGylFAO4Jo6yaaqQuZjpcc9gLXWj61
 NuNA+sg7o82Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dXuvqwb5
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add a "file" package
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

On 2024-01-12 21:49 +0100, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/support/testing/tests/package/test_file.py b/support/testing/tests/package/test_file.py
> new file mode 100644
> index 0000000000..686fa52d72
> --- /dev/null
> +++ b/support/testing/tests/package/test_file.py
> @@ -0,0 +1,81 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestFile(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_FILE=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def generate_test_data(self):
> +        cmd = "echo 'Hello Buildroot!' > file.txt"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "gzip -k file.txt"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "ln -s file.txt link.txt"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "echo 'void main(void) { printf(\"hello\\nBuildroot!\"); }' > file.c"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "echo -e '#!/bin/sh\necho Hello Buildroot' > file.sh"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "echo -e '"
> +        cmd += "#!/usr/bin/env python3\nprint(\"Hello Buildroot!\")'"
> +        cmd += " > file.py"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "dd if=/dev/urandom of=file.bin bs=1k count=4"
> +        self.assertRunOk(cmd)

The test data corpus should be in an overlay, committed to the git tree
(yes, even the gzip data).

> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        self.assertRunOk("file --version")
> +
> +        self.generate_test_data()
> +
> +        tests = [
> +            ["file.txt", "ASCII text"],
> +            ["file.txt.gz", "gzip compressed data"],
> +            ["file.c", "C source"],
> +            ["file.sh", "POSIX shell script"],
> +            ["file.py", "Python script"],
> +            ["file.bin", "data"],
> +            ["/usr/share/misc/magic.mgc", "magic binary file for file"],
> +            ["/usr/bin/file", "ELF"],
> +            ["/dev/zero", "character special"],
> +            ["/", "directory"]
> +        ]
> +        for test_file, expected_type in tests:
> +            cmd = f"file '{test_file}' | grep -F '{expected_type}'"
> +            self.assertRunOk(cmd)
> +
> +        tests = [
> +            ["file.txt", "text/plain"],
> +            ["file.txt.gz", "application/gzip"],
> +            ["file.bin", "application/octet-stream"],
> +        ]
> +        for test_file, expected_type in tests:
> +            cmd = f"file -i '{test_file}' | grep -F '{expected_type}'"
> +            self.assertRunOk(cmd)
> +
> +        cmd = "file -h link.txt | grep -F 'symbolic link'"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "file -L link.txt | grep -F 'ASCII text'"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "file -z file.txt.gz | grep -F 'ASCII text'"
> +        self.assertRunOk(cmd)

Ah, I like the array option with a loop, and it can all be made a
single loop; also I prefer the pattern test to be done in python:

    tests = [
        ("", "file.txt", "ASCII text"),
        ("-i", "file.txt", "text/plain"),
        ("", "file.txt.gz", "gzip compressed data"),
        ("-i", "file.txt.gz", ""pplication/gzip),
        ("-h", "link.txt", "symbolic link"),
        ("-h", "link.txt", "symbolic link"),
        ...
    ]
    for opt_str, path, pattern in tests:
        cmd = f"file {opt_str} '{path}'"
        out, ret = self.emulator.run(cmd)
        self.assertEqual(ret, 0, f"Failed to run '{cmd}'")
        self.assertIn(pattern, out)

Regards,
Yann E. MORIN.

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
