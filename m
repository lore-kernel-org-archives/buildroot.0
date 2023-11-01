Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B25FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B07A1431C9;
	Wed,  1 Nov 2023 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B07A1431C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7udRJ_cUtlZ; Wed,  1 Nov 2023 21:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E2B143295;
	Wed,  1 Nov 2023 21:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E2B143295
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACC6C1BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78DF3428DA
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DF3428DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T-c_ryQG6ZGw for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:46:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 326FE428DC
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 326FE428DC
Received: by mail.gandi.net (Postfix) with ESMTPSA id D72EF60008;
 Wed,  1 Nov 2023 21:46:33 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:46:32 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101224632.662e151e@windsurf>
In-Reply-To: <20231016211414.28406-1-fontaine.fabrice@gmail.com>
References: <20231016211414.28406-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698875194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBSz99CGGQbVzRmDV6KQZ8qNm7sxnlTTnr+mexV2jT0=;
 b=Zl/ikJE4PiB3GZ7fghm+56YmbWtaMhj2DvOa48xK2AEWn7u1NhhYYoVz9z98m0rpdncoNf
 /fJ5iOiBkfOkBuw26vhNFIMgty5O3iq4HCtZF1WXO6SKacYzFsc6ZWdQ3+/HGG7thl4lB6
 LF9Y2Qxjtqr5O+d/jPzd8iVDvbwZ75BIKQIyvjQ1drDm963CVNtXNzpdtBdM/lPfZivfya
 MDYhZuYyVoeqmfZ0lY7jJ3rYUHUe0M82pgBSg392gb8iVfVj/d4wV3wbhj2hrkkTxyL2QC
 eMSpegpwJtWPlxFanE5d7Yf1Ep2PWHh2H9zLECr4Y2TxPSvBXrPysTeedWOXIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zl/ikJE4
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: fix configure
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 16 Oct 2023 23:14:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 4.19.1 in
> commit a8ff60cff9402dcd04fffb67af15dfe2caab0995 and
> https://gitlab.com/samba-team/samba/-/commit/fb4bb188acfc3e88887b500a05e9e4db8b08aed3:
> 
> Cross answers file /home/buildroot/autobuild/instance-1/output-1/build/samba4-4.19.1/cache.txt is incomplete
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c1fbfdab11c0521b8199f6a661987eb6076c84d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/samba4/samba4.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master after improving the commit title and commit log.
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
