Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63755EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19DA561006;
	Tue, 18 Jul 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19DA561006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJ8nZvWB6yVB; Tue, 18 Jul 2023 20:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A756103B;
	Tue, 18 Jul 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A756103B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7CF91BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B152981F70
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B152981F70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4_KfDnInuZT for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:52:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2B1813FB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F2B1813FB
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:52:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 260C0E0002;
 Tue, 18 Jul 2023 20:52:03 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:52:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718225202.07ed42a1@windsurf>
In-Reply-To: <20230715210558.3642490-1-bernd@kuhls.net>
References: <20230715210558.3642490-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689713524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmExkCJV6FI0d/J69OCC22pst5d1G0kyXBgZAJmEitQ=;
 b=B/zbQtkMNFvMmYZeaXIj1kr/oeEPWHeCs4Oroo6vXmYlKxwq717be4rYqDD5Cep01PwjYK
 g/Ey82jusJNboacVcm1PiZc7CHuX6NMx+ZNOJGuhQpbZmfPgDT3bOqHT7QffxytgPsJjqX
 OOncjP6+oIJbWixY2ShL5mxsr0DZHXa0LcbCvHi9Ltww0AcavosNSDvbMd5ekXyKR/Ioo/
 nRI97JyeSGbYBPI2K+jSOtxs+rZLAD5UUlDuEytHjIay2M7Lcfor0tuD5aw1/mdwO9LKEH
 BPtRBn8v4OJ3vr+JELxWgMlPoKlD7uGQ2JW0AUEdPv+rtSWmqk81BORfyeLGfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B/zbQtkM
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump version
 to LTS_01_2023_Ref02
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Jul 2023 23:05:58 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://github.com/Azure/azure-iot-sdk-c/releases
> 
> Version LTS_07_2022_Ref02 added compatibility with OpenSSL 3.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
