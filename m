Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88519EEAA74
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC2260709;
	Thu, 14 Sep 2023 20:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC2260709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqeU0NPIiMlR; Thu, 14 Sep 2023 20:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72675611B8;
	Thu, 14 Sep 2023 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72675611B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4407F1BF368
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2480F41F1E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2480F41F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lf-yT6wzBLcu for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:56:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5C0A41F1A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C0A41F1A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65683240004;
 Thu, 14 Sep 2023 20:56:54 +0000 (UTC)
Date: Thu, 14 Sep 2023 22:56:53 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230914225653.26f39f19@windsurf>
In-Reply-To: <20230914202825.399940-1-fontaine.fabrice@gmail.com>
References: <20230914202825.399940-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694725014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQU8aPcXriQ5xWgFhyCbCC3vbhv8LZk7Rf9yqe5VNMQ=;
 b=MizpGCNtvy8eWyIi7EZdL8rqTuALW+JFAd4cY8KDa4SaoL91WDhV4RgUU0lZsKoXjTzGuc
 mkHdYCG4vUUwyKAa0WmrpHWH7rp4qZhwFda/B8MsG13H03BAeTTkpNdiikAT2e4CX5fMec
 GGFTn41e7fIBF4ru8Vmd1oBqQvZEqOPIFWlMJjz+viqiy+wmclxQLYj/u2ziCaAtc3+kYT
 Mjw1UDlIFbeohHpJMfT3vlFC6QETMAauRP9+MSCQ1CAocGiMFuvy/s6DcwHiH6uzpFspun
 70697bmDHltzK+BMfRXzm774HSP9fNZSO/1ir6/zVy6zPyJpLH0X2L1M1Etjvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MizpGCNt
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: add
 LIBHEIF_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Sep 2023 22:28:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:struktur:libheif is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astruktur%3Alibheif
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libheif/libheif.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
