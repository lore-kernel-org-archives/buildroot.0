Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232EFE732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 18:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC5A415ED;
	Sat, 30 Sep 2023 18:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC5A415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Z-iQZDLQ4iy; Sat, 30 Sep 2023 18:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C4E3415D1;
	Sat, 30 Sep 2023 18:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C4E3415D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9509E1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D4CF8205A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D4CF8205A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WL0zgDJ31or for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 18:55:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4CC982030
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 18:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CC982030
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3F5AE0002;
 Sat, 30 Sep 2023 18:55:05 +0000 (UTC)
Date: Sat, 30 Sep 2023 20:55:05 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230930205505.748336ae@windsurf>
In-Reply-To: <20230609174955.409551-2-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
 <20230609174955.409551-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696100105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FflVrkeb5UpgjXcKuhwZ1pq9iM/B8ig9tvfDlY5MjDQ=;
 b=TXTFTxEbUky2G8McYvd1ReD00iP8z1U6xEArd1VemTRBZe7NuWu+dDPyOpST3tOJYpUfPD
 5XDRbROWRKTh+VQjFjyScKvpS89Kd6pZixJ0P1a+uNO4VFhh3rvgsM5l6oKwAIieL2Jlxa
 0y76XLDozWvw0RddCeDqqbr5SPpfBDs3tN4s1G2UsDqc4tYmWxUAdOCLrB+UdfU8Z1P+Km
 xE/aUY8LequKtCe575NLMJWBg7W8QSw0zkYwIcRMX0h0U4gYyHqNeIGaCh/+pVN3lZKC4W
 8JfRylCtFcf2CZDH2o4GP/Qwri/oVIBPK5mY1BI5Lo5FpHf5J1gqN8fWJysQew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TXTFTxEb
Subject: Re: [Buildroot] [PATCH 2/4] package/python-mako: add optionnal
 runtime dependency on python-pygments
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

On Fri,  9 Jun 2023 19:49:53 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/python-mako/Config.in | 11 +++++++++++
>  1 file changed, 11 insertions(+)

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
