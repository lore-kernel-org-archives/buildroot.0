Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215D0FA3745
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 417DC410E5;
	Thu, 27 Oct 2022 21:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 417DC410E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9QqD_XahFDN; Thu, 27 Oct 2022 21:32:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 372A5410DF;
	Thu, 27 Oct 2022 21:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 372A5410DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D517E1BF2A2
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 21:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81C2360792
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 21:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C2360792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5JIsAAnz0XJ for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 21:32:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F5960773
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3F5960773
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 21:32:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6AE56240005;
 Thu, 27 Oct 2022 21:32:36 +0000 (UTC)
Date: Thu, 27 Oct 2022 23:32:34 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221027233234.6ee18998@windsurf>
In-Reply-To: <871qqt9fma.fsf@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-5-tobias@waldekranz.com>
 <20221027084900.0844e13a@windsurf> <871qqt9fma.fsf@waldekranz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666906357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLMiEIMZHshJ8h6Ms7XXUKn3nSNyJB7Amyp1lqpNO44=;
 b=CdeBpf8+jhrLMG0D9wmkCE0+M7aaeb/zaaZPHS3/U1kfbWIDliWEtdwhYOGZOi8X2C8baa
 MGPYvQfKbfpPKlx73bxWshniqaMbQcvzdGC1HLpVCLbZiY4FLven5I+CTFOk95PdXN0Apw
 qPtQ0Vg1wY/EyqGj5yo1Kwgl7L2X17pzwp4UsmcUmqRJEV9N9KZzI8cyWjwrHfk+gUbQHh
 kKR86hL/BrJdLr5u+Z60r9ZQqLppP+JMmw1KgBnvbR2GFseJWk7/c88PsKClkCep9On+ao
 O51FyLXqg0MqS+1b8Rn7eTWNSQdjpOpApdsrAY6DYiuLplNQpVa4G5DvdeGeGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CdeBpf8+
Subject: Re: [Buildroot] [PATCH 4/4] package/kmemd: new package
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Oct 2022 22:27:25 +0200
Tobias Waldekranz <tobias@waldekranz.com> wrote:

> Thanks for going the extra mile!
> 
> Hopefully the next series won't require as much work from your end.

Oh, no worries, your patch series was actually very good! There was not
much to adjust before committing. Looking forward for more
contributions from you!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
