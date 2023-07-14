Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD03EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3714440A71;
	Fri, 14 Jul 2023 21:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3714440A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNXU2x2We_mR; Fri, 14 Jul 2023 21:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A3CC40A67;
	Fri, 14 Jul 2023 21:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3CC40A67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1001BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF878226E
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF878226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LaKB4IGJx8i for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:26:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89318224A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C89318224A
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:26:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C0D6FF805;
 Fri, 14 Jul 2023 21:26:21 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:26:20 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230714232620.030c4b85@windsurf>
In-Reply-To: <20230714164219.9934-1-ju.o@free.fr>
References: <20230714164219.9934-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePfMlJU247Jdm7UGdR9lImm1PTt0jTKOPVp7pgLeZI4=;
 b=Vl8SQHr0spwPCGAnbrqHVCStEYWSOGPeLSfYTERvLwBZ5+IWp0anDeQUUub0IF+4J8ax/5
 bs/+IK8oIJ0GU2Au9qwJCrFQpQrtoP1zbSSU4c7Om1TxMZsGOZz77TDp7BEY8vF7EPl/Ip
 Tbuytoq3Ey/Ru50VsOZkPZMfUahvhZTppYm7h+18c7q8k9VNERzN4s1Hb6whzwZMggkNZS
 H0P7vjRiRkXyZg5z+rCeZ2hJvHW7lPcHQz5JmoL4sRQrFtRRpyZo/CB8xjTw5bW/G3lAMj
 M+Z350F+YXVVV4rkJtGU5Vc7As6TocZ9D+X4Tg0eC2QWHSZytazVOeSllCvaYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vl8SQHr0
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_pigz.py: new runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Jul 2023 18:42:19 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_pigz.py | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 support/testing/tests/package/test_pigz.py

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
