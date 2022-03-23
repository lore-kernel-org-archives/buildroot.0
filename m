Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68256C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 19:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D716840C61;
	Wed, 23 Mar 2022 19:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meqMJ5VOtifO; Wed, 23 Mar 2022 19:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9622A40242;
	Wed, 23 Mar 2022 19:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E56C71BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 19:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E29858496B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 19:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJyeaP-03tpO for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 19:49:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FE1D8493B
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648064945;
 bh=0zmeV9qG8PiglK5h2KFnl+i3RXcsUJwvjvBoep8xlK8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SGuvKPrXSe4KdJxCwfJwPHKbHydU+55NAdxDnLVL5PFJda2NlMRaYV8LxceccjMvO
 wvkA8szZLbbKVLdbUSLG8WDlUuS9hNXTbUsz70gzIswGboDK0e7PzlIl9rxiVvmbS1
 i6fFlHlYI+6mffIbdy/dmZS21u+yHmP+2UEe13iM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.123]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1nITqW2BH3-00GmKr; Wed, 23
 Mar 2022 20:49:05 +0100
Date: Wed, 23 Mar 2022 20:49:04 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220323204904.3ebaeeb3@gmx.net>
In-Reply-To: <20220323203535.307d504a@gmx.net>
References: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
 <c2c49834-638c-dbfe-bbba-7bcbe153a660@mind.be>
 <20220323203535.307d504a@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:YhgEyWQOmhUWd/MR2F1to+8ZT++JZ0Oqtk7WVa5S+AfbnJPCLVF
 D+BHxLK/0X7f8EuHnYEEzhMbMlf5FQxb2TjddebUo/MVsBM73LvU08xwMfbCHRDA0CngEcw
 hz67lLvTQjRGPHUtdQG6+X6ZuyXPWUKqTO+DuUugJOuP91KA6szoP2PfIRcL85XLhOJ3iqL
 E1/i/ibVLGbgHmrRoL4aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ylPgxXzRkuU=:ftHKXbGUI2MQ8yhaYzWoss
 d7Vy+Np38ZjTaF6x1k8XUqc40vb/DGzoFFS4G/oRQz3zmCfEBsjnkVhpSYCTAVZEkCnDFVZ0c
 yhD0QZ3i3g3V/l6zp5zUsKGeQjKS8q+EM+26OtkGHcnA76TXtTwtkhaT42TCEpI2+fp+/e7q+
 +1A46HWmr8Vtge3jT1nTjGsU65+qt0Cxy9Y4pNn1lHS/SouK6zDpDAHGk3zXutxvekEXjQZVv
 Qps/+/JHgq7vBm1Tn5JmJ6wppr39iPBKr50ejyzf0XzFq7DhcBkiIvJcw9YWS3hehSgN5t7xs
 +ygczKDe68Iw5dFtn/TYJIfWdPfvlj7w1VCDeZwYtY7lLTBybBB0bSu3Uq19QhZFVcn40IAvj
 Os0ZDKpvlBgbWSWCn92fZvZZi6hqdK0bgDvidW/PwV4VTIXyfM42gBeGVuQyfONIYmlTTt0cl
 KkFDmYLaUgKc103blITzAyDD+F6BQiK8JinQ6qVB/jwA2S0cSGpkHIzmtWs2LwblSKzZ0S2Bi
 VUMMCGR9I3GbuPKkycCI1AKRXlJw5jgDxRBmiVJE3LYGcnTHhbdgT0JjsY8FrKGQlMgdogn7P
 P3SH+1J5FRN2O8wrU44OJ80Dv1ZxIsay7oj7IYpMoCX64MBnqQ0watu9CVHIRcuaU9W2MpTe8
 tfyx4udK2t0YFkmUreGAlZsdoT+OV8YbNKPX5Q5aCePXkc6eKTKxerKQfpxcHCdyNT4koQYvV
 QatAgdSGyjVa0CZnL+Uy/00bsSKtrPKKLlnE3EzL2e8ts8KWiDq09fR7K4V+pSqxofA0tsPHB
 lvhP+FCC846U99Sb5NrQMBqTze4ZYwZzasigKcmaMdAN5tn9kiStMf4Q3mQEJebocfQuSrq0d
 TuXOdVPy29Zcvc8YCF7VdNU91Sz5txlU/uZ+BTBxsDuqZdQOgYj8mk8VJCBPJ19N1txoWngXg
 lGdqsig06CMTh252DnagYbi140AD+N77XpCVrIPYJphivaKIl+4+0yP22r8YWS9Ft8reFn3a6
 TM9Vc5qZPIUw9ufjcCR/vNo9OtZfwzunyoHCUwiIaUxW6DJwDjm9Yze3CzZv0SzaZDCMUSjkn
 OXbYJISkS1ZPC8=
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: fix missing
 files in overlays
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, "Sassen,
 Rutger" <rsassen@comecer.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Wed, 23 Mar 2022 20:35:35 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Arnout,
>
> On Mon, 21 Mar 2022 22:56:41 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> > On 17/03/2022 12:06, Sassen, Rutger wrote:
> > > When supporting multiple hardware targets, overlay_map.dtb might
> > > be needed to map overlay names to one of several implementations.
> >
> >   I've added a reference to the documentation.
> >
> > >
> > > Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> > > ---
> > > Changes v2 -> v3:
> > > - in Config.in use if statement instead of depends (suggested by Peter
> > > Seiderer)
> > > - mention the filename overlay_map.dtb in the help text (suggested by
> > > Peter Seiderer)
> > >
> > > Changes v1 -> v2:
> > > - instead of always copying overlay_map.dtb, make it configurable
> > > (suggested by Peter Seiderer)
> > > - do not copy README since it a special case, only needed when
> > > installing overlays to a non-standard location (suggested by Peter
> > > Seiderer)
> > >
> > > When supporting multiple hardware targets, overlay_map.dtb might
> > > be needed to map overlay names to one of several implementations.
> > >
> > > Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> > > ---
> > > package/rpi-firmware/Config.in | 12 ++++++++++++
> > > package/rpi-firmware/rpi-firmware.mk | 7 +++++++
> > > 2 files changed, 19 insertions(+)
> > >
> > > diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> > > index 8070dc3019..36054353f8 100644
> > > --- a/package/rpi-firmware/Config.in
> > > +++ b/package/rpi-firmware/Config.in
> > > @@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > > overlays, to support HATs (Hardware Attached on Top, add-on
> > > modules).
> > >
> > > +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > > +
> > > +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> >
> >   In the end, I don't think this option is very useful. So I removed it...
>
> Why to you think so?
>
> I am still convinced the overlay map should be optional (in favor of explicit
> overlay/feature loading/enabling instead of firmware magic) and the
> overlay map is only one way to achieve a hardware dependent feature loading
> (the other way is via Model Filters in config.txt, see [2])...

Missed to add the link

[2] https://www.raspberrypi.com/documentation/computers/config_txt.html#model-filters

Regards,
Peter

>
> >
> > > + bool "Install DTB overlay map"
> > > + default n
> > > + help
> > > + Say 'y' here if you need to support multiple hardware targets
> > > + and you need overlay_map.dtb for target dependent mapping of
> > > + overlay names to one of several overlay implementations.
> > > +
> > > +endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > > +
> > > config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
> > > bool "vcdbg"
> > > depends on BR2_arm # prebuilt arm binary, rpi-userland
> > > diff --git a/package/rpi-firmware/rpi-firmware.mk
> > > b/package/rpi-firmware/rpi-firmware.mk
> > > index b46a7f5270..800b560070 100644
> > > --- a/package/rpi-firmware/rpi-firmware.mk
> > > +++ b/package/rpi-firmware/rpi-firmware.mk
> > > @@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > > endef
> > > endif
> > >
> > > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)
> > > +define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> > > + $(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb
> > > $(BINARIES_DIR)/rpi-firmware/overlays/
> >
> > ... reducing the patch to just this single line.
>
> Which renders the review process to void (as the option was introduced by
> Rutger on my request and this is what I reviewed/acknowledged by the Reviewed-by tag)...
>
> >
> >   Please check if the commit [1] does what you need, if not I can recover the
> > original patch with the Config.in option.
>
> +1 for the Config.in option ;-)
>
> Regards,
> Peter
>
> >
> >   Applied to master, thanks.
> >
> >   Regards,
> >   Arnout
> >
> > [1]
> > https://git.buildroot.org/buildroot/commit/?id=da38cdead909aa133b9c468ddebf3f67c8d198f2
> >
> >
> >
> > > +endef
> > > +endif
> > > +
> > > # Install prebuilt libraries if RPI_USERLAND not enabled
> > > ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
> > > define RPI_FIRMWARE_INSTALL_TARGET_LIB
> > > @@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
> > > $(RPI_FIRMWARE_INSTALL_CONFIG)
> > > $(RPI_FIRMWARE_INSTALL_DTB)
> > > $(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
> > > + $(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)
> > > endef
> > >
> > > $(eval $(generic-package))
> > > --
> > > 2.20.1
> > >
> > >
> > > *Disclaimer*
> > >
> > > This email communication is CONFIDENTIAL. If you are not the intended recipient,
> > > you may not use, copy or disclose to anyone the message or any information
> > > contained in the message and I ask that you please notify me by return email and
> > > delete this communication immediately. Thank you.
> > >
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
