Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A50C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D4480C83;
	Thu,  6 Jan 2022 15:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nx7ptShZDAxT; Thu,  6 Jan 2022 15:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A4A80C39;
	Thu,  6 Jan 2022 15:00:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1451B1C113E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1ACB80C0E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyUfpKhMHmOW for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:00:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C728280C39
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 15:00:41 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0A15F22247;
 Thu,  6 Jan 2022 16:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1641481239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgPk2JuDY5avUdoqM5TgmNzB8B3d+w4xd671dtfbCes=;
 b=QmytDbHHajlb2w6BGiU92Zd3RyuCxe/dd9Ni5CAJ8rZLdLBksCAwscTI/cUDb/XvgauEPF
 2s0SKGrrn2Su01ZUVIjfpPlvxBviytHdBFbWgkaF57bXaBkriv38Xx3PMhA+QQ5XLDzH8C
 6bokpKSzsOH7+vriQAiTn2vIORWLqec=
MIME-Version: 1.0
Date: Thu, 06 Jan 2022 16:00:37 +0100
From: Michael Walle <michael@walle.cc>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <737df820-79da-b710-22fc-dc8c53e9223c@mind.be>
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <737df820-79da-b710-22fc-dc8c53e9223c@mind.be>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <70c6686e301152345e96b4a199d2a96c@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH v5 1/9] package/nxp: new package directory
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
Cc: geomatsi@gmail.com, Chris Dimich <chris.dimich@boundarydevices.com>,
 Changming Huang <jerry.huang@nxp.com>, thomas.petazzoni@bootlin.com,
 buildroot@busybox.net, heiko.thiery@gmail.com,
 Michael Trimarchi <michael@amarulasolutions.com>, matthew.weber@collins.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 2022-01-06 15:45, schrieb Arnout Vandecappelle:
>  In this series, the only commonality that I found is the binary
> extraction, but it ends up to be used only by
> qoriq-cadence-dp-firmware. That's not worth it IMHO.

mh? all the imx stuff is using this method.

> 
>  Therefore, I marked this patch and rejected.
> 
>  Note that it would make sense to do this if we would also move the
> freescale-imx stuff into the same directory (freescale is anyway nxp
> now so it should be OK to do that).

ah. yes. that was the idea back then IMHO.

-michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
