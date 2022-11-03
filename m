Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3FBC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 962C881767;
	Thu,  3 Nov 2022 21:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962C881767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpNjSBV-aiVO; Thu,  3 Nov 2022 21:25:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B67812A5;
	Thu,  3 Nov 2022 21:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7B67812A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D444F1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFEC340BC0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFEC340BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lcjp21gaIWuk for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:08:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B47140520
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B47140520
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:08:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F46160007;
 Thu,  3 Nov 2022 21:08:49 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:08:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220820.4ae98de6@windsurf>
In-Reply-To: <20221103204035.1098102-1-james.hilliard1@gmail.com>
References: <20221103204035.1098102-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTF47XIhEc5MxL+sCNBs7PmB70UxGuS03jcrVOSxOJM=;
 b=S5vZAdL8zRuTwpWI3mglkH4Ftx4vNqrgNubYkaBYI9U8zItu3YdiH6dK461PHLLrY8zb7m
 nky4DljFFycG0y26GvmVJykO3uCOOXWAduHDmCG5kMIn2XE5xv9yHi/sgq/DXO7fwLcZjZ
 1citgHIF8C/bnIwX/gqnPsJYFy1OkqcWsxXKkpOSruzdW4iyf32g4X4Sqo/k+juOCm77cX
 6AUZZY08Zu0H8CTsbYP+JzmOj/0a/4mm2eNRqePTqi45u3SCaZ9wOKHFAzx2v0eyLpGCKM
 6amx1q0B2tuWiUhq802cMAyXNk/cF3GrGeb0lek30dRUUkLxLMPZdKiN8+nhbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S5vZAdL8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-webpy: bump to version
 0.62
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 14:40:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License file was accidentially removed in latest release but project
> is still public domain licensed.

Could you report the bug to upstream so that they re-add the license file?

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
