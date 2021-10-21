Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0690DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:27:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F24610D0
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42F24610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC3283C8A;
	Thu, 21 Oct 2021 21:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pb-jjkCQM9mS; Thu, 21 Oct 2021 21:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59DA483C87;
	Thu, 21 Oct 2021 21:27:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7EB1BF4E6
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 690BE400EB
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPDwcP2mGGhM for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 21:27:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1E0A400C9
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 21:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634851639;
 bh=j9ZdBTzT9injIN01Bo5Q2tjBqSBRm4B/hJs/Gywcyqk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=USsDkaMfnxMs8rT53QImV32TYp3K2OVnsYuOjaZ2t7HMGspJX5FwKWeqM0C6/XxEX
 bhwjeQIUnqK5lthVWzPd73lwz1mV30ngH43ICYmpWB8/pywb9GHGOwepFtm6Ie97ri
 tDWiPwEqApnbpCAkSfkX8civSHMlGi/kh2VA2uMM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.165]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRjt-1nEe6g0qRl-00bq8L; Thu, 21
 Oct 2021 23:27:19 +0200
Date: Thu, 21 Oct 2021 23:27:18 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211021232718.69617e1d@gmx.net>
In-Reply-To: <20211021210823.148802-1-fontaine.fabrice@gmail.com>
References: <20211021210823.148802-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:OsGKq3jz83opNjyHDtEjZRuDaIOH+UwKnMg5QWmgF4h+oDGNJhx
 AZGJjPgzStHnOFcp8BUDbIRz+GhV16IRv3Le4vR+OXfHGG69vqZLFs6bOg39dxlfUaeb5TS
 g6FmtWc7BV0a/bUAHSn4cFSFikYcPh7/bHqspJicxO4whLcy31+YC/+izQZ9b2XffzLlUUd
 mM0eHdk864/uunFdHzCuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WSjiDLKG/F8=:bT2oQA+QEcLwm98KpyCBJZ
 udLihtmDETbKMu9SXJmAtutX8L1G6lYNml8chYYrLMNQ6Mv+l5a1n7iZdc+RWL8/OB4ECzzuW
 z0lZUoPpmdFCaXzh9rOkb8Kg+4tQQU0vVSSLxOSrMMAt8Vc/6C/J2PdCV6CcDuo+Vbjb8vFQJ
 9KDKTSBrjDwEcX3VmNcpr3vnLAZ6wtWfNNKYTz1Ma9gQ0GSU2pT4Ak0Z1qm07NInvblx2nNUy
 5b0nUWbLw+r5uxbzx4rlRtm7wwAWA4yNeD7KyVqkQs/dBq4CJbFmvgefOqRxhpelzxq5kFfUU
 PQtzUJUmiFi4foNQQuBlwMbhxAM+6pG164eqKAkO7tveBap9j62gISnP88e/B92EGoR8TL+b2
 kpdQT1GSdSYArxYk0urEYHaIXPYRf7cdOcEWsDaI9a+fAxL8V5kB3TQttVloSbGeqMywd6XV/
 WKhX3J+9yHhzejDa1T3SD2KIPieWH+5Ggd3+lwYP0hvGyE6/av40924jbq/hnpTY3ylhwlRA+
 DnfSscIR4sHeBCpkHWqRRuYXVcoc0FLLWOPtH3Uu4eYcLbTW715kw4fLVSP3F6IFpQhoH/C4a
 nwiCno0wPrEbyD+x7Lbfyx+Zq+/eEPXS+BIcr/g6kLaPdF3Ng8JYNOTPM7o7X/A+E9aRwXjJV
 C9gPIcU8e7Rm1kh4mQf34Ee9Epwc5dKaaytr8o5vsn1BaNtvnP6fhKwJAl4bDOTRGzizvw2Ry
 6CCodN2v0nOJk4eyCzSBGuV+MrlWhRQbKJ9HJxcD3UGJ0RKlQQyeypUEQuFbsmbdgjtwJFy/p
 EHFp0Qajt9QS6c/u8eycOy2MytRUbryLES0OH4Mfn757F4sIpSCmj2/L+Urw5fxD5wV2YH43p
 4Woa5bCvmKEvWNbfjO+iVOmITx0RgFJ8mh+WdWHgkkQiMDwQMGfTvm8XbTQxPMjYwGYX2dk9b
 ocMOKjMUoDVgxjr/JrHvyEgY0le8Hix95hBs/dFOTzdTuOd8UDf2UJuEFx8R7Ui5aH3veSu3x
 SBR9UZHkLkUMKg1BTfB8HQhEtcFklmjOdaXrT5qrzKJAEtEjqcCWGN0WXE5/RB/RvjnYsg1k0
 k6zzQGLAuJmXj8=
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu, 21 Oct 2021 23:08:23 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the rework of boot/config
> file handling in commit 689b9ac439ab7b507c8982b6102bddf59d03efbf:
>
> /usr/bin/install: cannot stat '/home/giuliobenetti/autobuild/run/instance-3/output-1/build/rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342/boot/startx.elf': No such file or directory
>
> Fixes:
>  - http://autobuild.buildroot.org/results/88b2137ea81c4944cbded11fa68adcbca02e83d0
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 8a6a435f63..c0beef7b42 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -13,7 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
>  RPI_FIRMWARE_FILES = \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
> -	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), start_x.elf fixupx.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \

Thanks for fixing...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
