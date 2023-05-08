Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A64C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 21:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3600C61543;
	Mon,  8 May 2023 21:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3600C61543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmeCPdxzb7Dk; Mon,  8 May 2023 21:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA306152C;
	Mon,  8 May 2023 21:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EA306152C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 819ED1BF34C
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6846960BA2
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6846960BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eExTlJEbumQz for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 21:53:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A9561457
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38A9561457
 for <buildroot@buildroot.org>; Mon,  8 May 2023 21:53:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6A97E780368
 for <buildroot@buildroot.org>; Mon,  8 May 2023 23:53:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 23:53:43 +0200
Date: Mon, 8 May 2023 23:53:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230508215343.GX252090@scaer>
References: <20230424215106.1202752-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424215106.1202752-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683582824;
 bh=vWy4qR9CAhy7hRsCsoCdyvXNOe8OMGWgjkSCC8ISFHQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=fdFHoEEh1ZCF8hdYPW6V9B7o/TXYJSLZpGT1vfwgwfpdsSLWkdf2njNY34KYwKMTP
 JoPfRf1nvq3XfgqCpLUAp1EAZlOFw1nQt9LSJUrJWJGUIxHhjYc0BjxoyaLgsXV+eo
 SkJZAZe3g4G+xm/vQ0oGyiDpzFhu+yUUlcL9w+XqA5m4dMceUE9p7+e1uThhrrVkKc
 F3w5XaFZXs+XnwXbnurA0+FnKtxVKcuHlU4XMRstw9qHvPahpqa1H2QdxsUrADfhf2
 TRYr4N6yE5TBjsVvYjfBoHGGnj9/cbcBE6dMnCnSxhCbZlTpzloMogXG1PqLDGRqY5
 fJbk/eGcEUHkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fdFHoEEh
Subject: Re: [Buildroot] [PATCH] support/testing: new runtime test for bash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-04-24 23:51 +0200, Yann E. MORIN spake thusly:
> Commit 2dff6e93ca2a (package/readline: add upstream patch to fix crash
> with invalid locale specification) fixed a regression in readline 8.2
> [0], that could have been caught with a runtime test. readline is a
> library, so we need an executable that exercises readline.
> 
> Since readline and bash are developped in tandem [1], it is only logical
> to use bash to test readline.
> 
> Add a new runtime test for bash, that checks that we can indeed run an
> interactive shell, and that an non-existing locale does not cause the
> dreaded segfault. We do not use the default configuration, because it
> uses a uclibc toolchain, and we want to reproduce against a glibc one.
> 
> [0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1021109
> [1] https://tiswww.case.edu/php/chet/readline/rltop.html#Bugs
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_bash.py | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 support/testing/tests/package/test_bash.py
> 
> diff --git a/support/testing/tests/package/test_bash.py b/support/testing/tests/package/test_bash.py
> new file mode 100644
> index 0000000000..f0ee8cadc1
> --- /dev/null
> +++ b/support/testing/tests/package/test_bash.py
> @@ -0,0 +1,47 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestBash(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_ENABLE_LOCALE_WHITELIST=""
> +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +        BR2_PACKAGE_BASH=y
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
> +        # Check that we are indeed not (yet) running bash
> +        out, _ = self.emulator.run('echo "${BASH}"')
> +        self.assertEqual(out[0], "", "Already running bash instead of busybox' sh")
> +
> +        self.assertRunOk("bash -il")
> +        # Twist! The above command is still runing, it's just that
> +        # bash did display the prompt we expect. Check we are indeed
> +        # actually bash
> +        out, _ = self.emulator.run('echo "${BASH}"')
> +        self.assertEqual(out[0], "/bin/bash", "Not running bash")
> +        # Exit bash, back to busybox' shell
> +        self.emulator.run("exit 0")
> +
> +        # Check that we are indeed no longer running bash
> +        out, _ = self.emulator.run('echo "${BASH}"')
> +        self.assertEqual(out[0], "", "Still running bash instead of busybox' sh")
> +
> +        # Try to run with a non-available locale
> +        self.assertRunOk("LC_ALL=en_US bash -il")
> +        out, _ = self.emulator.run('echo "${BASH}"')
> +        self.assertEqual(out[0], "/bin/bash", "Not running bash")
> +        self.emulator.run("exit 0")
> -- 
> 2.25.1
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
