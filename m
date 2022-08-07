Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78391C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 253614051C;
	Sun,  7 Aug 2022 16:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 253614051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MF6yM3vXH-7; Sun,  7 Aug 2022 16:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F7E740543;
	Sun,  7 Aug 2022 16:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F7E740543
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0711BF681
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33FFD8149A
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FFD8149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7RvGuQAdo7S for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:10:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF20581428
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF20581428
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:10:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D16D60005;
 Sun,  7 Aug 2022 16:10:02 +0000 (UTC)
Date: Sun, 7 Aug 2022 18:10:00 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220807181000.4ad50de7@windsurf>
In-Reply-To: <CAM70yxD-pbF7awEqoP-y5kKG_VZj1oTXZYb8s-zw6rE_nAM5dw@mail.gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-3-emile.cormier.jr@gmail.com>
 <20220807165300.2137b391@windsurf>
 <CAM70yxD-pbF7awEqoP-y5kKG_VZj1oTXZYb8s-zw6rE_nAM5dw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659888604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tM3z7gyzn1akM22BsZXvA+mazfBw558kkEUqmYLq/6g=;
 b=hs3fcUD6LECOOllP6+BlMRuOJ2RfHr3dICb/hWd58A5Kj8i3AOIhM6ytpSBles5MQs4ltQ
 /G7TC5o5oVqsNRYL8lzOPkYfrW3Y352yatXRbu1Y9Llxx6qV91wE/TOXhBHzvmAF0mOGwK
 fM11j88t6jTu+2PtYpgtLOZio9WVjL4jzHWVM15ZNP9JB7mdSStNhzJ8WfwVIpjbvi78nj
 x1pv1a22TVatgnDYidZAqlMvStTgCMi+KsCbWzDFv7YcC4pwoqtrAuqB1Xu3eNwmvx7pJM
 PXZMUT5cCd3WleMRMdAKc80DlkI/Jlu9Z7RyVzjdbEmWMzg5XoOvyxgSYQmIdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hs3fcUD6
Subject: Re: [Buildroot] [PATCH 3/6] package/python-zlmdb: add new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 7 Aug 2022 12:37:46 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> I'm in the process of migrating away from Crossbar, due to dynamic
> authentication/authorization no longer working and the author not
> interested in backporting bug fixes to older versions. I can no longer
> devote any time to support Crossbar on Buildroot. Please do what you will
> with these patch requests.

Ah, too bad :-/

Do you still have some time to comment on
https://patchwork.ozlabs.org/project/buildroot/patch/20220403221953.1158787-6-emile.cormier.jr@gmail.com/
? I was looking at it, and wanted to ask a few questions.

> Sorry, I'm not familiar with zlmdb; the only reason I introduced it was to
> satisfy a dependency by Crossbar.

ACK, no worries.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
