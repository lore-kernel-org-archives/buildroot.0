Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102C8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 07:07:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB62760F46
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 07:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB62760F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BAA60800;
	Mon, 18 Oct 2021 07:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbIyvC3mw1jp; Mon, 18 Oct 2021 07:07:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C55EE607CF;
	Mon, 18 Oct 2021 07:07:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A84C1BF337
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 07:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88935403A4
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 07:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zu5cbn-y8g4D for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 07:07:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CB82403A0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 07:07:05 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id B9173C0C0F
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 09:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1634540821;
 bh=PuGduxbTaLLVXfbht4fQZ1cP+/2fGKyds+MpJNyS5kk=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=PWUmp+LjeeHyjCzX81FPLJkxxYpiAyJNY1ckWy/S2+vSLd8TmM2n64pnNTQKy7miU
 e52oCAgfiVg5KCO15amoJ/b/Bimmk7DR8A6d9NyXf/jkinI566w4pCDozlFgBRqipn
 cUryfA3xZ3EvPXFLiUzXxdRpPRZWNZfkZsMhxqnvU0U3+v0wFDejQ98piotW3TKvU4
 ObJkghncjbaWJCgwZvSx9vEoQz/NvHt662ru1qPNB/wa5GQFByjUybNWsSnHbna+cI
 PfwZqnaAq7vHE5NIDDPyQY2iG1W8B0UJ0huMX1gVWdo76piWAuQI7FjpJlltgHDkfJ
 txb/i3BRWuc8Q==
To: buildroot@buildroot.org
References: <trinity-a8e521af-a576-4087-9be9-2a71b6fb4186-1634504603077@3c-app-mailcom-bs08>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <9da598c5-88ea-055f-27c6-25796ef23d50@grenoble.cnrs.fr>
Date: Mon, 18 Oct 2021 09:07:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <trinity-a8e521af-a576-4087-9be9-2a71b6fb4186-1634504603077@3c-app-mailcom-bs08>
Content-Language: en-US
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-10-16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Dagg wrote:
> odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667149
>
> anyone else gets this timeout?

Yes:

    https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666713

Seems something is wrong with some of the CI runners.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
