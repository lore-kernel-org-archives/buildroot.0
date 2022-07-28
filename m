Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3293C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9793060AF0;
	Thu, 28 Jul 2022 20:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9793060AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HK9Fr2llqxSD; Thu, 28 Jul 2022 20:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C87F660ACD;
	Thu, 28 Jul 2022 20:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87F660ACD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7EF1BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09DE28269C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09DE28269C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XTWl0RZUmFA for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:56:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C94C88267C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C94C88267C
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:56:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2035A20004;
 Thu, 28 Jul 2022 20:56:48 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:56:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225648.220c97b6@windsurf>
In-Reply-To: <20220728122449.2615761-1-fontaine.fabrice@gmail.com>
References: <20220728122449.2615761-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orB9YVoBfeZMcOBYFAHrv5Wy2I9uH/ubISvo552ZqR4=;
 b=OogspWi9Ts/GAo6vo0ZVRU7Hq+5iAOEVeiIhq5HO2HBUzubSwWkYmdL0dLqoczmeaqo4B0
 MZry+RZxuBqb7TIL5p4u4l/Qxd3ANQbv7ILc4/+9QRvS7RuXhh/SJqUNKGM4YWcLV24VWe
 rTWpcppAhLv+l0BxN2tsx7dZUJU3chRnfDrCE2PYqtMk4x/OtSda9i4S19vLkbXJIyhbIw
 4E+emdIXs4ex3VWkv6mohlj148OUcNU0UrxL8xKiQdo+UcOlZow/xR+eu5/N9OKu86L0o9
 J1vc674b9PMTgjmgzhsuLqLuai/G3LuajqV/jFXRisQ+IlOgE3buOpwQOrT6fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OogspWi9
Subject: Re: [Buildroot] [PATCH 1/1] package/mediastreamer: simplify
 alsa-lib feature selection
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 14:24:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Instead of having the user need to figure out that 2 alsa-lib features
> are needed for mediastreamer ALSA support, have the top-level pulseaudio
> option select the relevant alsa-lib features, when alsa-lib is enabled
> as already done for pulseaudio in commit
> 97cd3680a4cc4bc0c71bccccb1459eda4b880159
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mediastreamer/Config.in        | 2 ++
>  package/mediastreamer/mediastreamer.mk | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

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
