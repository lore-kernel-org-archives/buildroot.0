Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5B4C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 087BD83F84;
	Wed, 26 Jul 2023 20:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087BD83F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIA7useMTJrz; Wed, 26 Jul 2023 20:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E5283F6F;
	Wed, 26 Jul 2023 20:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E5283F6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B56DE1BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E89583F6F
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E89583F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nR1R0nIC2nkN for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:16:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EB8583A52
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB8583A52
Received: by mail.gandi.net (Postfix) with ESMTPSA id C29A120008;
 Wed, 26 Jul 2023 20:15:53 +0000 (UTC)
Date: Wed, 26 Jul 2023 22:15:52 +0200
To: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
Message-ID: <20230726221552.7b9ba813@windsurf>
In-Reply-To: <20230618111434.62274-1-SIBobrenok@sberdevices.ru>
References: <20230618111434.62274-1-SIBobrenok@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690402559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqCy92BB50XAop+XCq2V7Kr1XcFh72m0+zZLrYgLhoM=;
 b=ZcnwIJ3w1mN0KeMXtS0gB1tU2PWfKKqKag79kaH6imE1Vf/WiVuEzrZdkVP8OfWevQZJ8k
 ZJB4nJ8AgqBl5VIITyOB3C+0B6HbkFCCTyY4S67Ng5mbjfR709x+8C2NjSgDjqfy0UsmDy
 CjCnBEWJ0FTQGoK5fa5Bb+3UHp/XlstwDiz62dqfGrKEFArmOwep1Zu88LBGQyDkkAvV9p
 cwjuOGFFRy4OUYnJfksuL4rfsNQ59iGDnTaK2pjjY43w0iet3NwJ4Ej6f1lbx4zgvQSqCC
 khlUQQiNPkckLYSnvPYxtUg7exUEGOuAqUDsZ12P8o9rB+mouEsBa+hlugh+8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZcnwIJ3w
Subject: Re: [Buildroot] [PATCH 1/2] package/python-iniparse: add host
 variant dependency from python-six
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Sergey Bobrenok <SIBobrenok@sberdevices.ru>, Asaf Kahlon <asafka7@gmail.com>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Jun 2023 14:14:33 +0300
Sergey Bobrenok via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
> ---
>  package/python-iniparse/python-iniparse.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks, both applied after adding a comment in each package explaining
that it is in fact a runtime dependency, but we have no way to express
that for host packages, other than by using build dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
