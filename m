Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D62BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 15:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E47CA60A83;
	Mon, 29 Nov 2021 15:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Etby8b4RrGuk; Mon, 29 Nov 2021 15:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47BEF60A85;
	Mon, 29 Nov 2021 15:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65FBF1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 15:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53ADF4024F
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 15:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tQaGJ0og6RSk for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 15:31:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EA334010C
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638199858;
 bh=ake6RHXDUzqGdnkzG8oGZAG3J6yq9DcyksDYoEzyJJ4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Dy8SmVDFxb627Ke+N+flX/Zl83XhbynnCgHSOgJZ2zCcOM9AGE3ZYrH5ZbhRIRqRq
 +hnNYYjLqVXd6MOtOz3tUnklWYuKcnnQ38zDUVf5k//ietCkwxjvoOvmJZCHRY/MOD
 Y6l219IJJ8fxf3EaJrvqtQ/g7vEBgH+WSeCRLuyA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2O1-1mN2h906xl-00e7L8; Mon, 29
 Nov 2021 16:30:58 +0100
Date: Mon, 29 Nov 2021 16:30:56 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211129163056.7f2d52f3@gmx.net>
In-Reply-To: <20211129062043.2173567-1-fontaine.fabrice@gmail.com>
References: <20211129062043.2173567-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:NGcFNXINEV/APAyIiAaIY0p1DWj7sYVyWMmCERmcqNHu81xIiNG
 oWzlvjCwaLnI8TvUiPm5JaxR3uPaePCz0iHImn105mHsgPzuiFOhF36Ca1t5zSrxtosZR2k
 +BAVMvnLL440xYTshLBKauya4p7j61iM1Ve4vdOQ38lHtvcFz314g6M5p4uLMXpgCCfnCIK
 L0t9SUu2Pz/ryBnimaXUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UcV6PeXRkDU=:G8VAX2bwEX0xHFNjaVYoW0
 FT44x0SPnN6eX11yMebn5AiPsn0QSUjlQPkZF3aGpiPcNsFSRphYM/48bfpvtidNL4MPFV1a8
 iPUv/mFwge45pQA0lFr38FtzMJN6QP1AzApmqScpiofFZhPw9Df0x2Hea5jlnXrs+Dxra5mgL
 1mfxu0GxiTiKN8/9hYn2bjuhEfXfdaMil3pIqZlfhmQ9M5anUTYBSamU9O/7hHqklHG1YNNje
 e3c0vXQ9aIZFjDggphU83NOImRAyfsrmxkaT76nAMQk9HKgrNDNOlWehA9CANcZZqT+uaicgj
 y5vIuYhh3/emLbICtjpUcdZcFDQ/lY2D5Xx+wF/4yUjt/TEVWBjPkOe1X4ciL4NLuRrRoq8SR
 5fTeGL7FwqPHI91RpgltWuDw2WqYxG3iEzGxlveHPb2A8eXiwbcL8ZNVjVgj+DvY90u7rPj2w
 jyqPHrgHJ8l3KCDl6jv9OgAt2mfNUL4UvObITsPrhmMToVj2GEEiQqXbT1YDLeeI5Yh3xEA6D
 1yLbbT39CfzTOTBpFGzIxOZcisVaKd/uFIfIFaBQUheFc/mRWiJBLuS/+9a97dqBOKHD7MR6F
 K1pm9Kio4okzbvGY6gQHeQbaPGVUHmntmPzdB0+55MIAvy+80MPwXN3PRh2aho8uJ02Ifo7T2
 nOlVyfCG400Y56irJl3cx4oKK+wf/VYzGEXVc37y365FzVYDRDb1ZEAIvge8R4QBkLPvQMSBw
 ShVTGdWhVnn/N9D652hi53xyd2QyBsSh+0kl2p5SGobM/j7vKkcDrUHAMvul8uIEE405DXlhA
 LPIo6fqzqQqBrdiHegbBK2u+vne8kI6ONkqHTrk0Xx0hFSGsV54WqJpJYrXkf/rCWasuX+7tG
 u4YFZSTbDIh3fntqO41w/9MB0TjrRNdSLETsGrqAU0nKaPSNb6/LacAQaDf4xU/uwrmg1xVVE
 7IdoMXlGBRRo3sokmNgP/smn3aRPCbAA/jorphQNn5VaiBf1qkNTsZTRfTYX3uwj4ZMe2m+qZ
 DlKg4cPL/p1i8fJHgcg2pfflEDBHTes3O0cFfTvo+ITTKcYoj0wO6S4QZnXU2zgF1dpVqZzle
 0NIG6nynAfzuwI=
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: drop spurious
 space
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon, 29 Nov 2021 07:20:43 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop spurious space added by commit
> 71dc107d41e5daf45e0955740b302367313aa23f
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

...as the spurious space was introduced by me:

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> ---
>  package/wireless-regdb/wireless-regdb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 0db8c6f345..9e01283c01 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -12,7 +12,7 @@ WIRELESS_REGDB_LICENSE_FILES = LICENSE
>  WIRELESS_REGDB_CPE_ID_VENDOR = kernel
>
>  ifeq ($(BR2_PACKAGE_CRDA),y)
> -define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
> +define WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
>  	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
>  		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
>  	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
