Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E835FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDC2813D8;
	Fri,  2 Jan 2026 17:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiuK3IS5i433; Fri,  2 Jan 2026 17:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DEE0813A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374718;
	bh=4A6XuTgcRQTprr2H/9OcWcmhCA5wATk7q7v0Q6re+bI=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=R8zu6KmlBDe69aYjLrWwbJciDyIMufxBE/UYIGaqyUxNcrt99GxsYl7CqLdVRkHHY
	 g2MCmZOodHKWTXTltlZdDdDvhuLmIIVTCZlIsjJrEHu7pl/1VPs7hpEEO72n9HVrY2
	 h76zO+GmBmkK+6iL3gp59Eh5kWvz2++Ee7hNq41/dVcqVEDDK28lUS3WK+LShmoYtN
	 dgLlHDLYj02B6dtf8NaB32UHi077qia5ZiA6SApQ3mONBhjyjX2YiLbZfDTSiegBTh
	 sTGukbAGEG3g/AQuZD/ROKh8wirjUvbjEzvtO2ECgRiDJUzVWyWcurW+z8OqB47Yae
	 et3mbetHyiwlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEE0813A4;
	Fri,  2 Jan 2026 17:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FFC619D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61666406EF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGrPLv6xpwnV for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F1C9406D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1C9406D0
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1C9406D0
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:25:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 428B54E41EEA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:25:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1942B606C7;
 Fri,  2 Jan 2026 17:25:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 516B5113B0442; Fri,  2 Jan 2026 18:25:12 +0100 (CET)
Date: Fri, 2 Jan 2026 18:25:11 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20260102182511.77508423@windsurf>
In-Reply-To: <20250904195812.3259342-2-buildroot@heine.tech>
References: <20250904195812.3259342-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767374712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aMFTg217v7wrrIGbDXXi/PjQv3bpeiJKwx8ZTLwtGwU=;
 b=GbsSmXAYSFCyTw77ctp2h879p4C959upbawQliHg0sivSkZdnnfRPaTnJouKpJGcD2Gbls
 +4cq7SJVxs0K08lU5frtRFhjfcXs0kkqicWsUZhWLgUp1nPo/y8yBgfExdBCpEdSyROEiE
 t6AmhNXi6D1GivEsQIZZMja4p21769hc7Okc3ipeimFMoQ5hEOye7RIWzhNVhnDNT2H9KK
 I4TsPjs2M2ckWdQQ+dVE2lQwi4FhtPylhEz8pQkrOFdfPrMOPyjrnT1yzyIttjyMtvbN8i
 3hOnwz7jiLH5NWepEYUuhwScWV5YUpSSr7HWQJXSzFdrVPbprKwEX07zY5ODjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=GbsSmXAY
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libcpprestsdk: add
 dependency on Boost.System
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

On Thu,  4 Sep 2025 21:58:07 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> libcpprestsdk searches for the Boost.System module in its
> CMakeLists. Hence it should be selected as a dependency.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/libcpprestsdk/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Both applied, thanks! I hope the second patch will not cause too much
breakage.

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
