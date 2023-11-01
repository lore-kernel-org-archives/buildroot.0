Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6AFC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6548F431CD;
	Wed,  1 Nov 2023 16:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6548F431CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxO_W1UHZjGR; Wed,  1 Nov 2023 16:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3ABC431D1;
	Wed,  1 Nov 2023 16:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3ABC431D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 301AD1BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AF734172D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AF734172D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3G5lHipe3Rh for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:36:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E337A431B6
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E337A431B6
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEC3EE0004;
 Wed,  1 Nov 2023 16:36:13 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:36:13 +0100
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20231101173613.516c74c4@windsurf>
In-Reply-To: <20231010131626.1128436-1-thomas.claveirole@green-communications.fr>
References: <20231010131626.1128436-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698856574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ik7NaKqt3Sb0kV8doSrMdkX3F5jCwgTdZiQglv/ZLlA=;
 b=j0sUqxkYHffDCK70juIaGmRHP98VckegqOZE9Y9esn09OqE1PO9ZHSUL5eptSHsiTCJkin
 dw/smtFmmrcnihdkqviNwKFeySwWNIBvH63Y8Uxhkt8jzsTVbf/iFrroxwXnSq8hcPMpsi
 TG7lKwsgMfBZFWrEwA6oV8HR4KP6NV2AwCfIHyooqRAqcSTjwcHOQe3OLFfrn2JrRwPg08
 hYR2PVr5oY/XP2l7IMiuDn+aEMzH/nyrXtsTo0Iin+XBkP3ip4abGL2VQ96ANMMYmgHbrz
 8AvPK+RfVhvqTHRyYu7BqmLyPgLm8yXdu7oLGeOWtFBmiK0hhQc4bP6GNZwKsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j0sUqxkY
Subject: Re: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.3.4
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 Oct 2023 15:16:25 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/vuejs/vuejs.hash | 2 +-
>  package/vuejs/vuejs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
