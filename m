Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00068C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97DFA4050C;
	Thu, 28 Jul 2022 20:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97DFA4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRl5u-As_mRv; Thu, 28 Jul 2022 20:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6F5E40354;
	Thu, 28 Jul 2022 20:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F5E40354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E36B1BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F778267C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F778267C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEfM9wzlT01t for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:57:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED1FE8266D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED1FE8266D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:57:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88A97240007;
 Thu, 28 Jul 2022 20:57:48 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:57:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225746.5a07d555@windsurf>
In-Reply-To: <20220728123215.2617378-1-fontaine.fabrice@gmail.com>
References: <20220728123215.2617378-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEjO6Q7Jff6rgYZMezNxFhhX0/NfQhlT7Gxs4eL8Ksk=;
 b=n6V2u5qMcQfOTKm9YWwnbCBIFxG/poJpvblB9Oo33L/IS81qx4jHSOJRmrme5Ye9/Bsd5I
 H6QMGmMe5qoA6UDZ0ONsE277xQeZKZDD/j9J47gzQZIZS0yHbAtzVRAHm78R5xI1njuemM
 OVAlVq99LoMTmvyyxYhdVCl5xWL7g/snZZyWW7EX9B/S4/XU1SfJFAjKj5cVDvS05jy+nU
 kuEVe3Kwrt+Bm7CbVwsAvi7HvVzPLpYuY1n8ZGCKmwv+7KALAcey75+4HVvDntBD/SjYhw
 LVEMoxSLQr6xbr+i4Un2it65IHSshLLIHjHhSR44rNEflHfcxiEZtiUVy38iCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n6V2u5qM
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: simplify alsa-lib feature
 selection
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 14:32:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Instead of having the user need to figure out that 2 alsa-lib features
> are needed for mpv ALSA support, have the top-level mpv option select
> the relevant alsa-lib features, when alsa-lib is enabled as already done
> for pulseaudio in commit 97cd3680a4cc4bc0c71bccccb1459eda4b880159
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpv/Config.in | 2 ++
>  package/mpv/mpv.mk    | 3 +--
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
