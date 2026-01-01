Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1862EEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E7A407F8;
	Thu,  1 Jan 2026 15:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEDj13lLJi39; Thu,  1 Jan 2026 15:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA72B40776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280121;
	bh=4uoQDPdWiKTUXto8Y47Q1OZOjmhqN0/1jZ7uWg5Tn+8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B86JDJIhLpElHdo7sbfxIdAf+Q2IAokX3hovtrlsnOFxppZ4xXSA3ynuGPumZSXRd
	 3PcTEk/j+mYDZukId/NQSMDbRdLivoLMdqwYNN5u8CWQtyE8cl9Z/86i/ppML+azWu
	 V9ZXTvLc+I9JvVzUYizMMo8XgYV8JVTvSA0mwncZJ4dOxmD5YvR22KxhJ4YbaxFqgW
	 BfU020RPI5R/4PRdv/0NtXSwgieWNMj7yvN/4hYrQ1+NqrKA7JUn4iZ5coY00i/+q7
	 J1I0qxh3CyxsRkSgvEnj60wVf4HaLLPIoYu6k/dEw2TwNKgKrXPnaRnTmd3JUrBMIV
	 Ht7hVJWZlXKWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA72B40776;
	Thu,  1 Jan 2026 15:08:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A792D351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A2C140776
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_MDD_tE8UUk for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFA5C4070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA5C4070C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFA5C4070C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:08:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AA4611A259A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:08:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6BD6B606B6;
 Thu,  1 Jan 2026 15:08:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14FE0113B029E; Thu,  1 Jan 2026 16:08:34 +0100 (CET)
Date: Thu, 1 Jan 2026 16:08:33 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Message-ID: <20260101160833.267f427d@windsurf>
In-Reply-To: <20251115164828.1519438-1-bernd@kuhls.net>
References: <20251115164828.1519438-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767280116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=87uNZmABz62hI6RSS3HPkHmi8mO6Dj+LTc7N1CHFzMQ=;
 b=KsW77S06l0WoUGYuB/XWiAcsHmzQHyqtCQtW01f7lU3km1fpuyAP0Fp5o6vja2sCXBT39Q
 d/STXZQE89KfHO3Qiu+DNLrnLyxUtjt4qtx08sM6YIknBzhK3+REK+oOImuYZNaC782xLa
 JzsoRH7ygyKJ+VGHTGbQg137BenV8+2VqG0BgqWuulkaEU5S4Lieji86OnuObaxvBCMnaM
 d1GbkMMHCl8TS81edJCd013Pu0933BAdFDxZGmYBabp+2TlDGYE3HH8y4ssIaMlr6qHajy
 uzeiQtqfQBH2QA+AJ6218wxJExvB5lRTglW0RxiJTT263DgZ5tlDweXiFVG1gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KsW77S06
Subject: Re: [Buildroot] [PATCH 1/4] package/liburcu: bump version to 0.15.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Nov 2025 17:48:24 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> https://git.lttng.org/?p=userspace-rcu.git;a=blob;f=ChangeLog;h=4833f6a67efb4cf0c4e56c9e4153b3ded6d89d34;hb=refs/heads/stable-0.15
> 
> Added MIT license and updated other license files and hashes due to
> upstream commits:
> https://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=29b2b11ef53eee2848dd06fba8c49003e17c539f
> https://git.lttng.org/?p=userspace-rcu.git;a=commit;h=d001c88633f6a58e94eb73f4814976d13f61bd77
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/liburcu/liburcu.hash | 12 ++++++------
>  package/liburcu/liburcu.mk   |  8 ++++++--
>  2 files changed, 12 insertions(+), 8 deletions(-)

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
