Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9696C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1E940E75;
	Thu, 28 Aug 2025 13:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Do9mA2FsT-06; Thu, 28 Aug 2025 13:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDDC140D26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDDC140D26;
	Thu, 28 Aug 2025 13:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 151DAB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED1B480DD3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Geshd388Oi_a for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 108B880D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 108B880D71
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 108B880D71
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9EF9B978384; Thu, 28 Aug 2025 15:24:40 +0200 (CEST)
Message-ID: <aceaa861-7e5a-4579-89be-9892377abfef@rnout.be>
Date: Thu, 28 Aug 2025 15:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Meena Murthy <meena.murthy@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
References: <20250819102203.3323366-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819102203.3323366-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387481; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5UM6v+dPjIWwoNrjabPu/6AYK5mUrvTogccbTyph0dY=;
 b=cdZm6Ghtd2ZedP9setLxfDe4KPOmC7Wjt72aGsepQBnLSK9JWjE+kkqckc/sQ7WpfnHzqc
 saRwzpdL0m6cI+TTykMf+So7XxFK9YR1OXUZ50rF2YgAFCtKAkKG9/tT/LX2d6I6Ki6A2N
 T8UY9n4gcTPzRpUgoKwi5/tFnZb+5QnNFeNWWUwGw0s9wXJksRjxnSJ6RLkrpoY7OefPAb
 tcbTACSN+/6G6fkzHMNl8GGpggZUPvX5hTov5eSUyd8iDLwdiW6/iQDQaYOURRaVI5mLaN
 kxC4WvFAfXEqy/9UpgFetzB/lPtNHy40aypnNaLzKt81QHmLlAsxPTapFsz/9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cdZm6Ght
Subject: Re: [Buildroot] [PATCH] configs/rock_pi_n8: remove defconfig, broken
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/08/2025 12:22, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769867
> 
> It has been broken for at least 2 months:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Drock_pi_n8&kind=BUILD
> 
> This defconfig was maintained by Suniel Mahesh, but his e-mail at
> Amarula is bouncing, so basically this defconfig is unmaintained.
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769867
> 
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
