Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE1CC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2486460C2A;
	Fri, 11 Nov 2022 22:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2486460C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qcx8BVtvl7DW; Fri, 11 Nov 2022 22:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D04C60C03;
	Fri, 11 Nov 2022 22:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D04C60C03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24BFD1BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C16781971
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C16781971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MiPzbtxo3btJ for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:50:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AE881951
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1AE881951
 for <buildroot@busybox.net>; Fri, 11 Nov 2022 22:50:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49484240003;
 Fri, 11 Nov 2022 22:50:32 +0000 (UTC)
Date: Fri, 11 Nov 2022 23:50:31 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221111235031.04029345@windsurf>
In-Reply-To: <3e8e93e9eed117bc7e49580fd77e254eee237a99.1668060990.git.baruch@tkos.co.il>
References: <3e8e93e9eed117bc7e49580fd77e254eee237a99.1668060990.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668207033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxQjki5gyW/Ood/f+L/skJjvpX3znyx7Xp8Cq+XoKl8=;
 b=Yp4mN6dC1+k/w0tP1Aei6lHvoNgQTfGBizSMcKsZwCa9DCrwx+UGEwgId9kLEZyagDI1Jj
 yXDwxu6nWdiwIKodgFaJvyu8zCBV2+0z/Xd97HcXLQWbjpMzx8gIuMGcGEh8OVZ+nALkgB
 ge3mRXsqvXEDIBusNP8eeRMlyvdJ3Y+UvuX1aH1IsEnxPNUmM5vKKvKkpvdA3J3tQ28Ve/
 sU9c+b0UYKlsZR2ruFie1UNAY8SRON6o/AWlumfkhHFRl/HGALsmyTPHPcMocnfxfazKQD
 4grVshSWxwYawJWgNIcDwP2Ik72hpmgp6VU8t5S9fFR+7eJWTjaan5xktHtDtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yp4mN6dC
Subject: Re: [Buildroot] [PATCH] package/socat: support OpenSSL only
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Nov 2022 08:16:30 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> socat is not compatible with libressl.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6f0204004c52f762d6e3cb3064238d7eb3646038/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/socat/socat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied to next, but after cherry-picking from master the change
in socat disabling the use of OpenSSL with static configurations. This
way, I resolved the conflict right away, while the topic is fresh. I
also expanded your commit log, which forgot to indicate since when the
problem occurs (it was in your follow-up e-mail).

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
