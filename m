Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102F7C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:11:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB72761028
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB72761028
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A21240252;
	Thu, 19 Aug 2021 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5EP8NkTcVb6; Thu, 19 Aug 2021 21:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F37A40266;
	Thu, 19 Aug 2021 21:11:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13E431BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0338540266
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mFx9OhpDbY_q for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:11:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C6B840252
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:11:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AB8D5FF803;
 Thu, 19 Aug 2021 21:11:13 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:11:12 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819231112.0c561c52@windsurf>
In-Reply-To: <CAPi7W8386-5F-fCsNzNWev47_14DB5B7Tqey4QawWDWELMJHCw@mail.gmail.com>
References: <20210819160317.1045482-1-fontaine.fabrice@gmail.com>
 <20210819223211.720d6e69@windsurf>
 <CAPi7W8386-5F-fCsNzNWev47_14DB5B7Tqey4QawWDWELMJHCw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: vaapi-drm needs egl-drm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 19 Aug 2021 22:40:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Do we can only use Mesa3D as an EGL provider ?  
> From my understanding, vaapi-drm needs egl-drm which has been added
> with commit 031df474c24f92757ac95ade572b90995ebdc6a2 and is only
> available with mesa3d because of gbm dependency:
> https://github.com/mpv-player/mpv/blob/0b56e1c00a57fdb767674462c299a5c973a9e373/wscript#L571

OK, so it's related to the fact that for now, only Mesa3D is recognized
as a proper gbm provider.

So I think your proposed patch is OK: this is a limitation that we
know. I know internally at Bootlin we do have a patch series (probably
it was submitted once) to improve the Buildroot handling of gbm. I'll
poke internally to get it posted.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
