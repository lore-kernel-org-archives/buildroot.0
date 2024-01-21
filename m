Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD08C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39B75400FE;
	Sun, 21 Jan 2024 10:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39B75400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEzF_CqYWEj6; Sun, 21 Jan 2024 10:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15CFC40515;
	Sun, 21 Jan 2024 10:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15CFC40515
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 021E11BF3F3
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF489418F7
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF489418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOzcpehUKNzG for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:21:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D809E418F5
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D809E418F5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 321D013F846;
 Sun, 21 Jan 2024 11:21:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 11:21:07 +0100
Date: Sun, 21 Jan 2024 11:21:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZazwE7v52UBvaazZ@landeda>
References: <20240113204824.212604-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113204824.212604-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705832470;
 bh=EAfcuTEwRBphIGEoq9keXefI5xvequOprAQ9TjwmtW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVUj5PW/xMXislzK6RnlcHW7q7MmKEQEEflT3213J5DfYweevhV/3Ql1QwIELNyCs
 IBOibr967CHRTfQrG0gdrGOmAd6rAKpTnBD3p6rJJB/WcEnfs01jq/8/nBxm3bF15B
 RmdSYhDbJfcqI59qCzNMl5nhwuLV22DZZtswLetvDJ1idpm26thp4QW+n6PbI7fWYO
 5fPGbvzc31urd3EeDWvnPV25vK1yUV5RnxAwX4Q7+h0cZNMZROWCoNyHZ/ViVZe+eB
 8Qm47h0q9Z/Wu83bPfOsK4HjIVjcnuxkBxF7alYgptm8Htp0ZZcJ5i3JR7XOQf1ZiB
 G7weEJDEjR6Mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MVUj5PW/
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add ngrep runtime test
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

On 2024-01-13 21:48 +0100, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_ngrep.py | 49 +++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 support/testing/tests/package/test_ngrep.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 94a89c63d5..33ad5b3097 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1793,6 +1793,7 @@ F:	support/testing/tests/package/test_mtools.py
>  F:	support/testing/tests/package/test_ncdu.py
>  F:	support/testing/tests/package/test_nftables.py
>  F:	support/testing/tests/package/test_nftables/
> +F:	support/testing/tests/package/test_ngrep.py
>  F:	support/testing/tests/package/test_octave.py
>  F:	support/testing/tests/package/test_ola.py
>  F:	support/testing/tests/package/test_ola/
> diff --git a/support/testing/tests/package/test_ngrep.py b/support/testing/tests/package/test_ngrep.py
> new file mode 100644
> index 0000000000..29aaa55c2c
> --- /dev/null
> +++ b/support/testing/tests/package/test_ngrep.py
> @@ -0,0 +1,49 @@
> +import os
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestNgrep(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +        BR2_PACKAGE_NETCAT=y
> +        BR2_PACKAGE_NGREP=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        port = 12345
> +        msg = 'Hello Buildroot'
> +
> +        # Check the program can execute.
> +        self.assertRunOk("ngrep -V")
> +
> +        # Start a netcat server in background accepting connections
> +        cmd = f"nc -l -p {port} >/dev/null </dev/null &"
> +        self.assertRunOk(cmd)
> +
> +        time.sleep(1)
> +
> +        # Start a netcat client in background, sending one message
> +        # every seconds
> +        cmd = "( while true ; do "
> +        cmd += f"echo '{msg}'; "
> +        cmd += "sleep 1 ; "
> +        cmd += "done) | "
> +        cmd += f"nc 127.0.0.1 {port} &"
> +        self.assertRunOk(cmd)
> +
> +        time.sleep(1)
> +
> +        # Capture 3 packets with the message.
> +        cmd = f"ngrep -n 3 '{msg}'"
> +        self.assertRunOk(cmd)
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
