Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE27C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E25408E3;
	Wed, 27 Jul 2022 16:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E25408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZHjAJMryQtW; Wed, 27 Jul 2022 16:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C55DE40576;
	Wed, 27 Jul 2022 16:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C55DE40576
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD3E1BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F34CC415AA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F34CC415AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mrACJxcsZdG for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:31:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EDE5415A7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EDE5415A7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:31:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B1A68B0056B;
 Wed, 27 Jul 2022 18:31:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 18:31:41 +0200
Date: Wed, 27 Jul 2022 18:31:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220727163141.GF1134587@scaer>
References: <20220727161309.3616285-1-arnout@mind.be>
 <3ec50b5b-6009-18a2-7f79-a539d987ada7@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ec50b5b-6009-18a2-7f79-a539d987ada7@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658939503;
 bh=LuPZ6AaiFk50splwarcl8GDGu7sZNO9+8HIalaqnGEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I65W17W4O58rvZ0aYUKJ2Q+w2N5vqXlrkus5exqdVm/BvieERM89tS7sdzyJ3F/pZ
 6DQJSXdibAHVo7SdAeuSBfiZf8QonOKE0Jyr/xWitxruYgHfGf4FNl1bRumkL7Ofv+
 EWJ8qhI0TobKkBxoFT52YP989+WZIWQS/kuOsy/FqwF8fm5W+jfRnhQUhyKZ0+HQgP
 81fkFa8YF4r2NNc26CQg/8RNEH+lylPXdra4Rcb+YcG2TRhEPxKMqpYPxjRrsxyvAD
 2DgaP/VFvn+SO5dzt3P8vPY/6y9feZJihThmkB9WMG8V9bihshnf++/aDHQ8mXhF3u
 KjwwiZbkB9Vow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I65W17W4
Subject: Re: [Buildroot] [PATCH] support/testing/tests/init/test_systemd.py:
 use downloaded kernel
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

Arnout, All,

On 2022-07-27 18:14 +0200, Arnout Vandecappelle spake thusly:
> On 27/07/2022 18:13, Arnout Vandecappelle (Essensium/Mind) wrote:
> >Since systemd requires a relatively new kernel, we switched to a
> >self-built 4.19.204 kernel. However, since then, the downloaded kernel
> >used by the tests has been updated to 5.10, which is certainly recent
> >enough to support systemd. Switch to this one. This reduces the test
> >time significantly.
> >
> >Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

>  D'oh, I was waiting for the pipeline so I could add this:
> ---
> Runtime tests: https://gitlab.com/buildroot.org/buildroot/-/pipelines/598368431

Nice, thanks! Still applied to master, though! ;-]

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> >---
> >  support/testing/tests/init/test_systemd.py | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> >
> >diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
> >index 80c6776f59..be28209ba0 100644
> >--- a/support/testing/tests/init/test_systemd.py
> >+++ b/support/testing/tests/init/test_systemd.py
> >@@ -11,18 +11,11 @@ class InitSystemSystemdBase(InitSystemBase):
> >          BR2_TOOLCHAIN_EXTERNAL=y
> >          BR2_INIT_SYSTEMD=y
> >          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> >-        BR2_LINUX_KERNEL=y
> >-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> >-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> >-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> >-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> >-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> >          # BR2_TARGET_ROOTFS_TAR is not set
> >-        """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
> >+        """
> >      def check_systemd(self, fs):
> >-        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
> >+        self.start_emulator(fs)
> >          self.check_init("/lib/systemd/systemd")
> >          # Test all units are OK
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
