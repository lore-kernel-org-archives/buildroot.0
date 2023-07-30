Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781CBEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDB961026;
	Sun, 30 Jul 2023 21:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDB961026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkORKBgl1zMu; Sun, 30 Jul 2023 21:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551436080A;
	Sun, 30 Jul 2023 21:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551436080A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9601BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 521366080A
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 521366080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25XWoWFbvvS0 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:40:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8FE5600B9
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FE5600B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B2F51C0003;
 Sun, 30 Jul 2023 21:40:17 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:40:16 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230730234016.1e71976b@windsurf>
In-Reply-To: <20230330112750.1710771-1-sebastian.weyer@smile.fr>
References: <20230330112750.1710771-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690753219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uitmpL/a7lUj4WiWLSf9GJnDUxk2DO5psBMu2kmU8k=;
 b=NlspGe6MvzawZBm1DOvzjm/wIFjnlPjCuYh0Unk77VCaz5tc09R10i8G5y8IDjIxbiliXM
 StEP+mqH+e+DB+yNXCgFGSxHYNpjUlO3IP5ZkQY4Qr5PGu6AxmhyA90fN/ljJbyjnTqwuU
 HhzPeccUI//BX5F7berkcsXvbHXaj8201vAG2ffavQhgr7Bbfl+wIGyTyVuupnHflMIVxQ
 K7Mi/huLh6YeHkh2ylmbtiEQu4e8JAFXbdcH0xEbpKW/tl0HeD5BIozL+YPsxkf54XuMrC
 KEvRKPZP5ZDCKAG9SVZQFBVl+gm3UgAmkkmt0HCE5AlCJF4lf/vU/a2OnvINmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NlspGe6M
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/basetest.py: use
 Bootlin toolchain bleeding edge 2022.08-1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Mar 2023 13:27:49 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> This patch updates the default toolchain used for runtime tests. The
> last time this toolchain was updated was in commit
> 0207a65323fc73fe9570f3d7e03bbfed4ab6d477 3 years ago. Since then,
> multiple things have changed:
> 
> Firstly, it used uclibc-ng as the libc whereas since commit
> 4057e36ca9665edd5248512e4edba2c243b8f4be, glibc is used as the default
> library.
> 
> And secondly, since commit 531b2a10cda6bae78ecc141c9fe48f2024f71dbc, buildroot
> dropped the support for gcc 8 and it cannot be built internally anymore.
> 
> This new toolchain bleeding edge 2022.08-1 is based on gcc 12.2.0, linux
> headers 5.4.212, glibc 2.35 and binutils 2.39.
> It is now required to add enable BR2_TOOLCHAIN_USES_GLIBC and
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC since uclibc-ng is still the
> standard choice when using an external toolchain. If one were to change
> this, it would break the builds for people using a uclibc toolchain with
> a recent version of buildroot. BR2_TOOLCHAIN_EXTERNAL_LOCALE doesn't
> need to be enabled anymore since it is implicit in glibc.
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC needs to be disabled since support has
> been dropped by glibc but it is selected by default when choosing glibc.
> 
> The previous toolchain bleeding edge 2018.11-1 is based on gcc 8.2.0,
> linux headers 4.14.80, uclibc 1.0.30 and binutils 2.31.1
> 
> Tested with gitlab:
> https://gitlab.com/DocSepp/buildroot/-/pipelines/821745386/
> 
> Due to gitlab constraints it's not possible to check all the tests. Most
> of the tests that did not succeed didn't because of such constraints.
> The remaining fails are missing python or perl modules, timeouts because
> the test takes more than 3h, tests.package.test_kexec.TestKexec  is
> executed with a property that is unknown to qemu and several tests use a
> different toolchain.
> 
> I noticed 4 tests, TestPython3Py, TestPython3Pyc, TestPython3PyPyc and
> TestTmux that failed due to locale and libc.so.1 not found errors. I
> verified that they did run with the previous toolchain and subsequently
> introduced changes in their configs so the tests succeed with the new
> toolchain.
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
>  support/testing/infra/basetest.py            | 10 ++++++----
>  support/testing/tests/package/test_python.py |  2 +-
>  support/testing/tests/package/test_tmux.py   |  1 +
>  3 files changed, 8 insertions(+), 5 deletions(-)

I've marked this patch as Superseded, as you did another iteration that
used the stable Bootlin toolchain, based on the feedback.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
