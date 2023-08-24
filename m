Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D16C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 19:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9ABE40908;
	Thu, 24 Aug 2023 19:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9ABE40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDQnpnfss5up; Thu, 24 Aug 2023 19:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B76640538;
	Thu, 24 Aug 2023 19:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B76640538
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D16251BF852
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 19:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B79D3607FF
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 19:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79D3607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qgf7EmZQUUUf for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 19:28:06 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 529D860769
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 19:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 529D860769
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A798513F88E;
 Thu, 24 Aug 2023 21:28:01 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53542])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Aug 2023 21:28:01 +0200
MIME-Version: 1.0
Date: Thu, 24 Aug 2023 21:28:01 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230823230452.4552936c@windsurf>
References: <20230822194922.71368-1-ju.o@free.fr>
 <20230822234113.12dd618b@windsurf>
 <695d398827606c825566d544ee8665c5@free.fr>
 <20230823230452.4552936c@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <8eb47024f30a3a2f1ab8d42497da15e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692905282;
 bh=Aj0cOg0WPZVVUtr9Fh5mv8px1Sl8Lu/D/NlRYtRPH84=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SRAX3TzYEsRswcwQWX91QWOQo8fM+bEp+V/S6uUtJVZ/Tzt9Ej53U/2aEJzp5KIcr
 eSHzWM5R0DwjMt58ygvDMA7eMUft9IIEQbfjFLeLmTVJxrF+O2O2VdjTAFdxVR04aP
 qWP4TRybOZdCLS8bhJfh3ajQVEwgJHfccUASHp6dHarKZSOYf9GcTSVCk8GSFEtcu5
 TOM/TxDPrjaS4KjHEoSpkpZs+7UhXd3+qyHOafIczYLksCUP/5x169/wuS+Xm52o/R
 shGTaOoK51HKuZOTDwTQNKKayf3iN250CzJgdRoGyO8lUY6/rd/ys44148c4JgfgJq
 FhpP+twXOEtzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SRAX3TzY
Subject: Re: [Buildroot] [PATCH 1/2] package/screen: security bump to
 version 4.9.1
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 23/08/2023 23:04, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Wed, 23 Aug 2023 21:12:15 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> This is not a mistake. It is more an unfortunate technical issue. My
>> original series was including a new screen runtime test in patch 2/2.
>> 
>> I'll shortly explain, because this situation might happen again: my
>> internet provider smtp (namely smtp.free.fr) decided few month ago to
>> deploy an "AI based" anti-spam filter. Apparently, the thing was not
>> trained enough on "git send-email" content. This generates many false
>> positives, specifically on runtime tests. I'm working with the
>> postmaster to solve the issue and complete this series when
>> possible. Sorry about that.
> 
> Ah ah, so free.fr thinks you are spamming us with too many runtime
> tests? :-)

Yes, it's true I have been spamming Buildroot with runtime tests
lately... I just hoped this would have been identified as "good
spam" ;)

Anyways, this 1/2 screen security bump could still be applied to
master without the runtime test. Do you want me to resend the bump
as 1/1?

Until I fix this (probably by finding another email provider), I'll
try to stick to standalone patches.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
