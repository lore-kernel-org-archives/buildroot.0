Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0441EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:28:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE81E61165
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE81E61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8685B6089A;
	Mon, 25 Oct 2021 19:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSZURcGDZG1E; Mon, 25 Oct 2021 19:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 099E460895;
	Mon, 25 Oct 2021 19:28:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8BA1BF34B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DEFA403D8
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kw_7X62gXQkZ for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:28:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC44F403C6
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635190123;
 bh=wxHb1SbpMzD20nDy6r35G2/XV04oU9NeoUuCGg83FDM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EO2HjLCWsRq4q5fcn13+6ztcnZUAZ1WQ/RD6/AlzbZrDmB/zi/TlBPolukev64j7p
 mfMYTxr2vNS4iZbsYDVsSLbxgDp3PcDw54hSGmXrl434tJPKtR0Io7+b/bnrOnoQzV
 qScLW0s9KPBH6wflWNRfkYZ2K/bvKiIilTUi4v7I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.232]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1n4HRm2Nkr-00jXz3; Mon, 25
 Oct 2021 21:28:43 +0200
Date: Mon, 25 Oct 2021 21:28:42 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211025212842.6a0d2f97@gmx.net>
In-Reply-To: <20211025082809.3967881-1-james.hilliard1@gmail.com>
References: <20211025082809.3967881-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:rbajTnftf0TnFAzHVQ1OB2lMy+ukeeo3bNPA9hM2/PexdMjYpBI
 CAkENbxmC2LHG/usCpG304T97+LQXDD2Ob6FB778i6u2B9J7S5K5tlFZySMQKwFCn7y/Q8I
 BqXSUh9p7VLghHDL5uGWk3G2nYSphmY5S2va/DuIYQ6hFwEqD966K4Zz1NTx4sMdCuF2Ci5
 P16C3qrFI3nLlYYwHzRBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:25y1G6FK0TQ=:/Zw7KONtIBCV9qorYn/ikt
 GrcS373LTzwZVHUU/J4x1LY2ua2r6RUWXrRCOdTkOX+ILdeiTQht5glNFNwb+htBB0/iGFcaQ
 CNjPV4AsGV7gEpfFw/A4wWeBwkrwwUFBOBpl51w5KrQnYWNNsWu5tVHm/2MNK6GkazCreSPIL
 fykvN9fchpcjgzWUMFU7/A6k9ec5NmtowSMBtL5q7/yAX12hNg8oA4H2p2CY4ZVwVXEridLN6
 V+WbrFv/N5SqVW7EhIVe7H7si0dVOUxSV+RtY5qLWHciMlcgoSUefWlJcahrjYKKYu6PA4oX0
 H39/XfHSfX0G2bqNX5UUK2pxlDU14ntlR9SbsVqaoe/5fwPhiRWJJSaOv+DfWamVjTWMqyRFu
 A3VinlaIqIZ5fDk6fuCTc7CSCPKGV5tM7/rj7zXc1o4bYTFaH65AaioI0wcqPjJ6GZTKNR6Qw
 oeSjYLCfdfUdfZaPspeymw9ewQziBbat+wONIzB5jwmALfJF5kr+Y9fF1tSY8aYHs1hUTj1op
 1ZpcitqKY9G0Q2rINBfHrJF0J/viUB3QDDGcdVj8I+6WKDFt3ggORv9+udXkszV7kSfkH/ZVy
 lhBhOU8gW7nU8YlihpF2zNdO9RLEBvc0VM4dE0sbY/sKfdTbVXPhFkQrxXnO3ljmOW+xT7wuZ
 eZs0ifjsqWYw0yPYKh0a1v7uDlNdSt4jISFDoZVOO/Z7xiW3f1UPR/5Sk1W/ewY/cNerB58Cn
 0khm+rRctuY70BWa7jN87CDpq9+LdvxSUkAdZ+bHguCj92vktXWnAXVkyhypNxcaGNHpNruPi
 jP/x+BUnM6KP98Q8HBEjVVEeHIyn5X0UuyDmPjqDkOZzpmNMnEXa+LKlx0QtvKFF8edvbwhln
 78iA1Z1d4JQSwYYIdltF/We9LVRKwLjO3mfcf3lT5BpaovxUk+XT8EheOXZEkUOyDCGDK2i21
 PFW16DJLfJgZS62RRONgc5ckdY/f4yyRyNGbd1WanlIBCAeRQNEIAm2OIC5VHWZ1VF1NTfQ8Y
 9csQgLLMsTcrNzNVmvtpUnRurectnXkdSx8B1WcDFx2XxR9PNIaEYZH5nTxqMyTMWg8hroBKf
 B7lYC8vElm3/4w=
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-ugly:
 remove examples option
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

Hello James,

On Mon, 25 Oct 2021 02:28:09 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> output/build/gst1-plugins-ugly-1.18.5/meson.build:1:0: ERROR: Unknown options: "examples"

Same comment as for the package/gstreamer1/gst1-plugins-bad patch...

Otherwise (and thanks for fixing):

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regars,
Peter

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> index b3dc765d07..a25110264e 100644
> --- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> +++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> @@ -14,7 +14,6 @@ GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+
>  GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>
>  GST1_PLUGINS_UGLY_CONF_OPTS += \
> -	-Dexamples=disabled \
>  	-Dtests=disabled \
>  	-Ddoc=disabled
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
