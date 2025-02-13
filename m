Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E849C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 22:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BEF16073E;
	Thu, 13 Feb 2025 22:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgUieWYN1yHn; Thu, 13 Feb 2025 22:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B236077C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B236077C;
	Thu, 13 Feb 2025 22:46:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD5CC2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5AAD60853
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMW9FhageHSK for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 22:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00FB06073E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00FB06073E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00FB06073E
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:46:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 18FACB0055E;
 Thu, 13 Feb 2025 23:46:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Feb 2025 23:46:02 +0100
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 23:46:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <CAGrGpJAvUU9u4zF7vzvu+upr2RQBLp37ESRdQfBVmrXbmv802Q@mail.gmail.com>
References: <CAGrGpJAvUU9u4zF7vzvu+upr2RQBLp37ESRdQfBVmrXbmv802Q@mail.gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <67507e1170f133fb149852539b3fcb59@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739486763;
 bh=5OySE5m70on5XPRnCwvUMW09R9t1v0FptpWBOL2RByc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gOwEXpRDNZW0jiCvjv2EEFzQIPJVe9uSp5yVRoMlWqRYioJSnKEIE84m7QWGg+E7h
 IoHE4Ja6BOrybziN5EBwGQB9ZQ1dHLlJ5kQgi0c52pfukZj0JKRDCHjbBrL7FHV35y
 GYvZM1U1zC83GfBf61+BVXdo2cH0w/Wb+USlqhORzO+wfXEZ49Z7dT/af9Drw3TUV9
 oiCtop6b/4hnEFUpxgpqW/gTlbJA1zkw1jaQF1SPZQGpunhcmQdEC3r0cbnZ/Tcdxy
 T86GYr33Da225aMpxmmxsWwoYdXLbAkYsVZtQdH6+fwA6aeyr7CCI2MotLZIn4zKmo
 tc8kXuTRty8Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gOwEXpRD
Subject: Re: [Buildroot] previous sdl2_image and sdl2_ttf patches are wrong
 - please ignore
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 13/02/2025 09:18, Peter Thompson wrote:
> Hi Julien
> I am having a brain freeze on this update to buildroot package
> sdl2_image and sdl2_ttf.
> 
> The previous 2 patches just sent are again wrong and I have
> resubmitted 2 patches that are hopefully correct.    Third time lucky
> (I hope).   My apologies!!

No problem! I marked your old patches as "Superseded" in Patchwork:
https://patchwork.ozlabs.org/project/buildroot/list/
We should now see only the most recent version.

If you set up your patchwork account, you could have done that yourself
(you can manage all your submissions).

> 
> Peter

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
