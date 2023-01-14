Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8472CC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22322414E0;
	Sat, 14 Jan 2023 20:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22322414E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvSVy6eJLDm9; Sat, 14 Jan 2023 20:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 097E9410E7;
	Sat, 14 Jan 2023 20:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 097E9410E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 212891BF2A5
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0F4B60759
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0F4B60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PnCfKWuL9IC for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:08:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC4CD605D6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC4CD605D6
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:08:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5637100003;
 Sat, 14 Jan 2023 20:08:43 +0000 (UTC)
Date: Sat, 14 Jan 2023 21:08:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230114210842.1cf70a03@windsurf>
In-Reply-To: <20230114170126.1085188-1-fontaine.fabrice@gmail.com>
References: <20230114170126.1085188-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673726924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXFywsAIJkNkmkbp4YzK7SLzQgN29ajWYP6WfQw1CxQ=;
 b=O6wbIrCyi73kCqW9qu9hgXoPAnf+B+fPr3D2ukYrcmerX9WP5EBMdLK000k9NsfrjHPNE9
 n8Z9XJRvDZmKXya09rvPSae9L5d5mV01Mth9Ozt4byh/aSX86G25U2AIbrs1okqMdvrsbf
 m64E99TaHXtdnyoAkQ2IamFXJUXQaemq252G25UuFH/tiF3FtM/lBpoVCJL+/DjBnX/5kP
 3LUbHbrkJSGjrXObI0wZTTc9Kh1C8LuDAJPDeppb/1oh6oQbZ/1/BQGwLeSUir+Vq2RQ84
 LCWGwDK/0JopTBnHOjWDij6Yw1nvJaXuCENs5OKKOnr+OMjqK09mT/SmatyGGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O6wbIrCy
Subject: Re: [Buildroot] [PATCH 1/2] package/janus-gateway: add libcurl
 optional dependency
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Jan 2023 18:01:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libcurl is an optional dependency which is enabled by default since at
> least version 0.0.9 and
> https://github.com/meetecho/janus-gateway/commit/ca9c0a86f975f88fbdd791af3cb4f8986883c1c2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/janus-gateway/janus-gateway.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
