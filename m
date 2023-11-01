Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D26C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A508401AD;
	Wed,  1 Nov 2023 21:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A508401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id im1f_onpZZFn; Wed,  1 Nov 2023 21:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 865334313E;
	Wed,  1 Nov 2023 21:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 865334313E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF8291BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A531F4EEB9
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A531F4EEB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ce1W_sFgbvG2 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:24:20 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E46BF4EEAE
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E46BF4EEAE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:1e82:1f0b:be12:a80a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B5455FFB4;
 Wed,  1 Nov 2023 22:24:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 22:24:12 +0100
Date: Wed, 1 Nov 2023 22:24:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231101212412.GG114892@scaer>
References: <20230915221444.1686011-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915221444.1686011-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698873856;
 bh=Y0HvIsn7hYApBbg1uMXwWjNMeXgSW1A7FUIPZr2aOeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GT1VD/aoonYJLgzPZZhWoovqGL//Cdp3mpuyGNTFihAV6CNUkG9VaFge+0/UqoSaD
 nUw1o8Ewd7XQ6m4ofQBivHbHnEXpv74Hs70KVMB83IfG3E8oEYhpCHZHICU0DPCTvY
 GVc7v1qM+C7fCfmbXTi82l0t5Yuy6cICRxwXrDNco50P8YpWZ4KbCl4CWbf1guefxF
 m+WB9Rdcm/JUR6BuHyB71v3Gol0xx82kwE5EAVjNB8cHmzsX/WYH+e3MC/wo4Ac+iQ
 7axVqjCeNQBD3JG+sJJ2hkUvHG8/Spvm35yYL2ilnrM2KD0TGEaGKMjaI2UAoXo4Ac
 RuuDFdqMr923A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GT1VD/ao
Subject: Re: [Buildroot] [PATCH RFC 1/1]
 support/testing/tests/package/test_criu.py: new runtime test
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-09-16 00:14 +0200, Julien Olivain spake thusly:
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> This test was suggested by Thomas in [1] during the criu package
> proposal in [2]. criu is not accepted yet. This is a first version
> of the test for review. Minor rework is expected to align the the
> final criu package patch.

Thanks, these runtime tests you submit are very important!

[--SNIP--]
> diff --git a/support/testing/tests/package/test_criu.py b/support/testing/tests/package/test_criu.py
> new file mode 100644
> index 0000000000..af2def85e1
> --- /dev/null
> +++ b/support/testing/tests/package/test_criu.py
> @@ -0,0 +1,127 @@
[--SNIP--]
> +class TestCriu(infra.basetest.BRTest):
> +    # Criu needs to recompile a Kernel, to enable
> +    # CONFIG_CHECKPOINT_RESTORE=y
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.53"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_CRIU=y
> +        BR2_PACKAGE_HOST_PYTHON3=y

No longer needed, criu selects it now.

[--SNIP--]
> +    def test_run(self):
[--SNIP--]
> diff --git a/support/testing/tests/package/test_criu/rootfs-overlay/root/criu-loop.sh b/support/testing/tests/package/test_criu/rootfs-overlay/root/criu-loop.sh
> new file mode 100755
> index 0000000000..6a1f72b442
> --- /dev/null
> +++ b/support/testing/tests/package/test_criu/rootfs-overlay/root/criu-loop.sh
> @@ -0,0 +1,15 @@
> +#! /bin/sh
> +set -eu
> +echo "Start"
> +for LOOP in $(seq 6) ; do
> +    echo "Loop $LOOP"
> +    if [ "$LOOP" -eq 3 ] ; then
> +        touch /tmp/wait-flag
> +    fi
> +    while [ -e /tmp/wait-flag ] ; do
> +        sleep 1
> +        echo "Waiting..."
> +    done
> +    sleep 1
> +done
> +echo "Done"

This loop looks dubious. I think we can do simpler:

Here's shat the shell script would look like:

    #! /bin/sh
    set -eu

    echo "Start"
    touch /tmp/wait-flag

    while [ -e /tmp/wait-flag ] ; do
        sleep 1
        echo "Waiting..."
    done

    touch /tmp/stop-flag
    echo "Done"


And the python scriopt would basivally do:

    spawn script
    wait for /tmp/wait-flag
    suspend process
    check it no longer exists
    resume process
    check it exists again
    remove the wait-flag
    wait "a bit"
    check the stop-flag exists

By using the stop flag, you know the script is still alive: it went past
the wait-falg and informed us that it is still runing by touching
another file.

Regards,
Yann E. MORIN.

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
