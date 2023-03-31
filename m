Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B094C6FD18
	for <buildroot@archiver.kernel.org>; Fri, 31 Mar 2023 07:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF17614F2;
	Fri, 31 Mar 2023 07:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAF17614F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U22MldZzZfq4; Fri, 31 Mar 2023 07:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B2BE614EB;
	Fri, 31 Mar 2023 07:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2BE614EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84D5A1BF83B
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 07:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53BDD84407
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 07:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BDD84407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rw_PIJNQPc0a for <buildroot@lists.busybox.net>;
 Fri, 31 Mar 2023 07:28:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEB37842E5
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEB37842E5
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 07:28:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A3FD24000B;
 Fri, 31 Mar 2023 07:28:54 +0000 (UTC)
Date: Fri, 31 Mar 2023 09:28:53 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230331092853.5ed10789@windsurf>
In-Reply-To: <d04a0e76-d934-919e-a883-f526599b1275@mind.be>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
 <20230329105022.6137bf1a@windsurf>
 <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
 <20230329112855.6110cf8d@windsurf>
 <f4e1e805-4ab0-e187-8001-c5cfa9c0be00@gmail.com>
 <84821597-4e34-2e1c-99f5-4d03bdda0d45@mind.be>
 <20230330142133.002fa797@windsurf>
 <d04a0e76-d934-919e-a883-f526599b1275@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680247736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bf52CQmjsHAsUc7vXJkqsExHJ9OP7CBUrFSmJvYnbw=;
 b=YS1nIT/pzMWf2Sqh+kcpZEFtIn1rfKNPAX3iWIaGJTqDxoSdmquqRns/P7c60+xViLJ8T7
 inmI4ItUsk5Sdfu90cvI0KS89CZBHl8u4kuAEX1MxtMew7o/md5qlmnwtCHKb13vhhoUw4
 ZutZf9TK+Zzmvjca6gtTlxn7Df3O5XXSXDS8l4NaJCxfh0Wwdxv8lBWF2WWuY+9CGSHVQk
 5mUiam+Sgu+4VoMz1SjlhdRQFr/Yy2CdpcXLNeitjZNjjOe5iVx8OGo1LiykeDV0bhxoMy
 8AnogTWmmthyf2e8AzK2REG7G5H3S7Sfe29y2DsJc4oCQr9oP9dORWc2RqX9pQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YS1nIT/p
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Mar 2023 14:33:24 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   No, the person who did the backport. It's inherited from Yann's original
> [yann.morin.1998@free.fr: backport and adapt from upsteam 1234CDEF]
> 
>   OTOH we have the SoB a few lines below that says exactly that, and also the 
> author of the commit in buildroot that adds the patch, so it's pretty redundant 
> information.

Exactly what I was going to say: who did the backport is documented by
the SoB just below.

To me:

Upstream: https://github.com/foo/bar/commit/<hash>
Signed-off-by: John Doe <john.doe@buildroot.org>

is sufficient.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
