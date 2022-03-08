Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DC0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E01741762;
	Tue,  8 Mar 2022 20:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQ8aCAuRJKhX; Tue,  8 Mar 2022 20:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4007F41758;
	Tue,  8 Mar 2022 20:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 869AD1BF86C
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 730BA60B5F
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiARcYPPuhXl for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 20:41:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17DB760B1D
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646772095;
 bh=aYy+9UCVV75kk0TwUhmylX/oNbcNN7j+c+G9w2CndTg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KUgGC8PbWzQ6pC7qnK967bJIwCvBe/ru7koMCVukp7RB1ODtha+H56m911OilpQcD
 CAEMyn+yEMhkXFsj2Iuawg63MdeG/U0acguqoxd1N64vbiPfHCl9fP8PHyxskbgK3X
 9joXWmYFA3Eq05dOK2fUQ++QgK07P1/PqZilFh9I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.213]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1nciAx2FgG-00Sizs; Tue, 08
 Mar 2022 21:41:35 +0100
Date: Tue, 8 Mar 2022 21:41:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Sassen, Rutger" <rsassen@comecer.com>
Message-ID: <20220308214133.5b494e1c@gmx.net>
In-Reply-To: <YQXPR01MB6121F6337B4EBC7B28B55AB3AE099@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
References: <YQXPR01MB6121F6337B4EBC7B28B55AB3AE099@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:nbRUr/4Axe1Xim9bsxyzySxiopOjMyRR5vOpOTQx14Fic6RdpaW
 Lv7bgzMGDjl+s7pdI+poYMZ3ZTEzbEtVx5stu5o/zFfLg0cZzC5FnnO291N+cCIrd292wdg
 567o/WFnmPSGEfgzvZe1CzyusIfVAPCOj4ybKI8815ucl+JFlpFU7n6X5Y4h4Ta72XInHem
 wRlt0FVqwHaFse8jGSAEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZcpTVnwJDAE=:deJ8hXrzA+hd6o4SBrtTrX
 whZkgzHggfVNjbzrGv7d6kbsMLB4bfxyZR1iQBy2Otm9tEIDAWdVfvircVbxJNnhG3izLh9Wh
 Jd6j9ipPfvrEqj8CkqxDGz0jSNCs7LrvURmM1Qwy9OwW2MqyeL2oINKPQ1xtoH7qf8A38LLZa
 seLjXcSRu9Ze3ZURlJ0YBCVHAibSHnohwUvo0hJAAFfJC8yiYtFL4Me/RjoJ/MwuLBBOl4XCk
 52w2sCfbyb/zGONPKONKPyTL3U6n93FVc3GorRZjDsyLLAF4fB1KemjJx6nw5QDyOl4JURvuE
 wJEM4u4c6Q8c0Lyeduyns3Ykc3To+lCW+zdQeJiDcMgw/CzEBNjZI1si1Ty0yFHe8yfuLz4tV
 Z/Q2O9I0MPtNajuMcFPt8IuJsMaI55JVaTUjia9SNmyeodyL/ZNVYtLvM8zzs2RUiMc4M6+8M
 p4nMG1ISb2eOv5fsmYfdVvs7lPwfSvfsVxlYnudlZBLuWR/oGVb1x5ZmEFyZcm5RW+sO3cj8Q
 +r0WCWDBrd0D0yLCvcoe7kdN+Dh3oBO1U80SbWwcmdmeh02DH1mWopStrYOZb0Zr3RftWolBj
 ktQS3VsOHJLlB7RFEGXvcY1w80Lr4D9XAlYaJwfiVa6Kgn85XACnxQIz9ArLRXr/Dnouc4kzl
 UdAL3mIykmFJLhrPPHq9DiBpgZqaZPciL6v4gom8WMA8RAKJmi+fQ1+oh9rAvKz7P63LpPLbD
 9WGriButxlae54zTVefmfnAJeg5xe3Na/oCMcxPkWJyu/wFxbjy/Qu9wJKEpuXd0/Rx9tRsCu
 7pRn7iBLNkMjrPGnuJ4iutQpS8KJswP/6NXwJKXSt6jgi//g0XmLSXaL8UAXRRs7nTTvsys4A
 qmLiitlqI+8MDEm+vsn/F6pEJlxARroua2rK7wrqvOA4tbECL0CJYzvOw1YhVfi+pK+JKki0o
 An3fVYkB4m0gMsU44A9bDtBlNS1ozlhDlTToxTn/BoDkDF7NLqGtr39KNZhtxlJjYyceLPVcC
 zaogRTFZ5H7kzEGcGAu/oz+31dfJAMZbyNp9njIAzf/D4uX6s+OB2zT8lJBbZVeD4y8iIvOBw
 n6eKkDIMbZw368=
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix missing files
 in overlays
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rutger,

On Tue, 8 Mar 2022 12:40:14 +0000, "Sassen, Rutger" <rsassen@comecer.com> wrote:

> Not all files in boot/overlays are copied to the image, which may result
> in overlays not being loaded at all, or a wrong overlay being loaded.
>
> When using os_prefix and/or overlay_prefix in the raspberry pi
> config.txt, it checks for the existence of README in the overlays
> directory. If it is missing, overlays will not be loaded.

Any prove for this behavior (could not find anything about it in
the docs)?

>
> The overlay_map.dtb file contains rules for overlays that require
> special handling depending on the specific type of raspberry pi
> hardware. When this file is missing, the wrong overlay may be loaded.

Only if you use this feature, see [1], [2] (building multiple rpi targeting sdcard)
instead of determining the right overlay (exactly targeting one rpi flavour sdcard,
as the buildroot rpi example config files do)...

>
> Fixed by copying all files from boot/overlays, instead of only *.dtbo
>
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index b46a7f5270..4b9a442bb6 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -45,7 +45,7 @@ endif
>
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
>  define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> -	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
> +$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*), \
> 		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
> 	)
>  endef

Would prefer to only/explicitly add the overlay_map.dtb file:

       $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo) $(@D)/boot/overlays/overlay_map.dtb, \

or

	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo $(@D)/boot/overlays/*.dtb), \

or as it is a (maybe unwanted target feature) add a new buildroot rpi-firmware
configure option for adding the overlay_map.dtb file...

Regards,
Peter

[1] https://github.com/raspberrypi/documentation/blob/develop/documentation/asciidoc/computers/configuration/device-tree.adoc
[2] https://github.com/raspberrypi/documentation/commit/67f5d3b4ff8b2e52239a5415c4b0272a85a910fc

Please avoid your footer message...

> --
> 2.20.1
>
> This email communication is CONFIDENTIAL. If you are not the intended recipient, you may not use, copy or disclose to anyone
> the message or any information contained in the message and I ask that you please notify me by return email and delete this
> communication immediately. Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
