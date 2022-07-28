Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848C4C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2822C60AE0;
	Thu, 28 Jul 2022 21:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2822C60AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysg782goPyWZ; Thu, 28 Jul 2022 21:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC5460ACD;
	Thu, 28 Jul 2022 21:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DC5460ACD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE2F91BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D717740354
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D717740354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JKQHFeYTh-d for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:01:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD36E40327
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD36E40327
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:01:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D7E6B1BF205;
 Thu, 28 Jul 2022 21:01:03 +0000 (UTC)
Date: Thu, 28 Jul 2022 23:01:02 +0200
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220728230102.221c28c6@windsurf>
In-Reply-To: <20220728191648.1201217-1-arnout@mind.be>
References: <20220728191648.1201217-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659042064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2j/ilWRAmAX1fyXJ0d3Cp7EmtEs3lZg1Om9V3hMpXY=;
 b=PfEOvh21tHN39+o5I+ug+CxLEI/fxCSuuQX7cvpyM03D8fXtlmP2CexE/RwasyTspZVHI4
 trESZEzOS0zdpT76FxBEJJE5j9IYWsq2bEp2HbxVIqNSYKwICzjorQbpKC3DkVmHx0zuhS
 iw0aRdXHDi3f7hsahUao5Mo0YgacBgoIfqenwBfKcnCrjtgBHswFtKQbKDeT+YI91Pbo0v
 AGhqoFKVBurnn13RxcYND6V95goY7iVjAfctsuvXMZHjzHFUaHdN7C43cYu8pzOstN1hD+
 sw+loHKR4+7TrP7T9+T8oAGHCrqhnXw9OXN6xcleyK3kNg8E4UIUmsVs78/erg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PfEOvh21
Subject: Re: [Buildroot] [PATCH] package/zsh: add more cache variables for
 TRY_RUN
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 21:16:48 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> It turns out that zsh has a number of additional TRY_RUN calls. We
> already set a few with cache variables, add a few more. They are found
> based on reading the configure.ac, aczsh.m4, and the configure output.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Phil Eichinger <phil.eichinger@gmail.com>
> Cc: Norbert Lange <nolange79@gmail.com>
> ---
>  package/zsh/zsh.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

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
