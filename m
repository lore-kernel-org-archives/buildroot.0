Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BB5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 17:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 517C461067;
	Mon, 13 Nov 2023 17:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 517C461067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-otZeA4bu4R; Mon, 13 Nov 2023 17:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B4CE60EE5;
	Mon, 13 Nov 2023 17:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B4CE60EE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E98A1BF390
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 17:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC8AD415C7
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 17:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC8AD415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fXwlLXSQISyB for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 17:10:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BB9C4159F
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 17:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB9C4159F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DD4E1C0008;
 Mon, 13 Nov 2023 17:10:24 +0000 (UTC)
Date: Mon, 13 Nov 2023 18:10:23 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231113181023.34bf6492@booty>
In-Reply-To: <87bkce21br.fsf@48ers.dk>
References: <20231018111357.2898095-1-neal.frager@amd.com>
 <20231031121222.1dfa4035@booty>
 <CH2PR12MB50042DEEED0FC5E7D3BBCA99F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231031133415.1d89db5a@windsurf>
 <8a0d97bb-2fe5-4e09-8e95-b928a431ce1e@amd.com>
 <CH2PR12MB5004A3E0B5725A32D422E945F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <87bkce21br.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699895424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAZaHyKJwFegD/Ibog1OQyIuzYdZe+QjHu+acp+/TZs=;
 b=DYP24xfuKAKpeftY+WukxVSIQpLZGLKzrLI9vuLyV1NBhzBs6xmQKV8+gfyVuxxcdatyVv
 TvQmbjstw/JDV4JhgGzmDoQY+HdqJMpTL9yt+UYj0eSifdIBn1OqCce9tvBXEE4FcpRzva
 0s1c1z26qtLuZMuJ3SvmHuQqBjLBla7M+Sr+MoTwFdx903wcoZVf4P0r+eTxdlXkODz1er
 4on0xvferHJx0cy0w4KtSj2Jot6gGXQy0uBcfagzk0XOhy9O8+Qx663BcRWirV+pIErkL/
 suMtEQlQbpNyiaNOvvFfzZYxD3o8Dpxm+ZB90WuJ6gjRDF/tMvuWLTsPwdmyAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DYP24xfu
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Frager,
 Neal" <neal.frager@amd.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Tue, 31 Oct 2023 17:39:36 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:  
> 
> Hi,
> 
>  > The remaining question is just a matter of how many zynq, zynqmp and
>  > versal defconfigs is the right amount for buildroot?  I would like to
>  > be able to support the following 11 boards, if it would be ok for the
>  > buildroot community.  5 of these 11 are already included in
>  > buildroot.  
> 
>  > zynq_zc702
>  > zynq_zc706
>  > zynqmp_zcu102
>  > zynqmp_zcu104
>  > zynqmp_zcu106
>  > zynqmp_kria_kd240
>  > zynqmp_kria_kr260
>  > zynqmp_kria_kv260
>  > versal_vck190
>  > versal_vek280 (coming next year)
>  > versal_vmk180  
> 
>  > In exchange, I would be ok with dropping the zynq_qmtech board and
>  > possibly one of the zynq_zed
>  > boards.  
> 
> I think the main issue with a lot of defconfigs is maintaining them (but
> you already do that) and the CI overhead from building all of them.
> 
> I guess we could come up with some logic to skip some of the zynq*
> defconfigs from the Gitlab CI setup. Romain, any good ideas?

After the discussion it seems quite clear that the patch is useful, and
the CI aspects can perhaps be sorted out, so:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
