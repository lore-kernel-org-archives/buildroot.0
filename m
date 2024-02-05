Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6B9C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B706640168;
	Mon,  5 Feb 2024 11:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B706640168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnlfZYdYb-5F; Mon,  5 Feb 2024 11:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46EE5402A7;
	Mon,  5 Feb 2024 11:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46EE5402A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5185F1BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A1EB418B9
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1EB418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsu0p8Wv_zEH for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:18:34 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBC71418B6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBC71418B6
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5F30413FA3D;
 Mon,  5 Feb 2024 12:18:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 12:18:26 +0100
Date: Mon, 5 Feb 2024 12:18:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZcDEAo0DW-xQt6WO@landeda>
References: <20240204093148.11282-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204093148.11282-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707131910;
 bh=V2O1SZZZi272MaNTZBF7Tf35o7/07tBhCcLO0ThrZzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l9CsIuJuu16Ddc1lKbLtzwE36BZ8QhCh0Wnah3WkkpsoOF8D+G3VMW1POuQ/yKaWl
 qlNgKCaRJC66VyDHse/GMzHWoA7T17k64oqRMrt5YBXMoVLGzlCjYoVox6EgPHVrcr
 macXAGQiDRD23B6m9XDbkjTfkyiix/PY2HN3VszK7zFK4T8Q+82UJzTBRC+XBzB0TZ
 0YtuRhPfVJ+kHsiv6kuHLEm9StJsqastqBQWGn13MMr4Z2mha98RJerLuNLf6OGOqu
 oCmY4J+5vX0+8uLULJ5lxadUTsEnGkWbwlj344sfV7xf6k/Eyv3y9RTwwoMEpDXNq8
 yRiRf7Ud9FRug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l9CsIuJu
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: micropython: add
 micropython-lib test
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

On 2024-02-04 10:31 +0100, Julien Olivain spake thusly:
> Commit 8f403f0 "package/micropython-lib: merge with, and install
> as part of micropython" brought micropython library within the
> package.
> 
> This commit improves the micropython runtime test by enabling the
> micropython-lib and by also adding a runtime test using one of its
> module.

I added a little blurb explaining why we can't use the gzip module
itself to generate the compressed file.

> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_micropython.py | 13 ++++++++++++-
>  .../test_micropython/rootfs-overlay/root/zcat.py  | 15 +++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100755 support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py
> 
> diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
> index 0ecd4790bd..371deb2978 100644
> --- a/support/testing/tests/package/test_micropython.py
> +++ b/support/testing/tests/package/test_micropython.py
> @@ -7,6 +7,7 @@ class TestMicroPython(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          f"""
>          BR2_PACKAGE_MICROPYTHON=y
> +        BR2_PACKAGE_MICROPYTHON_LIB=y
>          BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_micropython/rootfs-overlay")}"
>          BR2_TARGET_ROOTFS_CPIO=y
>          # BR2_TARGET_ROOTFS_TAR is not set
> @@ -64,5 +65,15 @@ class TestMicroPython(infra.basetest.BRTest):
>          output = self.run_upy_code(py_code)
>          self.assertEqual(output[0], expected_output)
>  
> -        # Finally, Check a small script can execute.
> +        # Check a small script can execute.
>          self.assertRunOk("/root/mandel.py", timeout=10)
> +
> +        # Check we can use a micropython-lib module.
> +        msg = "Hello Buildroot!"
> +        filename = "file.txt"
> +        gz_filename = f"{filename}.gz"
> +        self.assertRunOk(f"echo '{msg}' > {filename}")
> +        self.assertRunOk(f"gzip {filename}")
> +        out, ret = self.emulator.run(f"/root/zcat.py {gz_filename}")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], msg)
> diff --git a/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py b/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py
> new file mode 100755
> index 0000000000..3b8c60bdd1
> --- /dev/null
> +++ b/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py
> @@ -0,0 +1,15 @@
> +#! /usr/bin/env micropython
> +
> +import gzip
> +import sys
> +
> +
> +def main(fname):
> +    with open(fname, "rb") as f:
> +        with gzip.GzipFile(fileobj=f) as g:
> +            s = g.read()
> +            print(s.decode("UTF-8"), end="")
> +
> +
> +if __name__ == "__main__":
> +    main(sys.argv[1])
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
