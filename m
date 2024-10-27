Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0084D13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D27960BA9;
	Sun, 27 Oct 2024 18:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtCN7bqx1ctK; Sun, 27 Oct 2024 18:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E0BB60BC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0BB60BC7;
	Sun, 27 Oct 2024 18:12:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8364F971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62FA54065B
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCRuXDZLtqkO for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED4E74063B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4E74063B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED4E74063B
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:12:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4B4120009;
 Sun, 27 Oct 2024 18:12:08 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:12:07 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Marek Belisko
 <marek.belisko@open-nandra.com>, Julien Olivain <ju.o@free.fr>
Message-ID: <20241027191207.5a7bb4c6@windsurf>
In-Reply-To: <75be884f-08ea-432d-86b0-3b3604d25177@gmx.de>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
 <20240916151206.947484-14-adam.duskett@amarulasolutions.com>
 <20241026181808.4cae0be9@windsurf>
 <75be884f-08ea-432d-86b0-3b3604d25177@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730052730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OS3IMZEbuGNne64xt3LFDWBPOguLqFi+537IA5D4hcs=;
 b=E15gr2Rxa67ilOvew4Di1guNgLytT6vjQ0dKz5ybaeFU4AmgQPNp+kSi7THFrSt9MLTEC9
 JpFbVhNAv7CSA/meKiPjvsmPVFIPkR+qAN5LDdl3hut//S3RL9phF+1b1Y/jbId+dz5ncS
 RQhbC6VMtytfjx2qiDUw/wU252ENurjUo9edcAnJqZ1boS9csopp4peSNM3Z+Vssd+dRtj
 oPEC8iVNG0EL62Qtp7PWq8gtlX31rPB6M3DCgFGPL5TNa14k7I6IZB/rvGYhnJ0x/5Kuog
 wrRLrRz06SRQYshRzHLcLFugNb/iVSxRTlgwnear4jfWrfJhfqXvKCIPAgxbBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E15gr2Rx
Subject: Re: [Buildroot] [PATCH 13/13] package/audit: bump version to 4.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Sun, 27 Oct 2024 17:45:29 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> > This init script is kind of special, as it doesn't really start a
> > service, but does a one-shot action. Could you Cc: the next iteration
> > to Fiona so that she can review the proposal? Or maybe Fiona can even
> > review this first iteration.  
> 
> I'm not that familiar with SELinux, so I have to ask: Is that rule
> loading something one might want to do independently of starting auditd,
> or is it something that only makes sense if you're using auditd? In the
> latter case I think it should stay part of the auditd init script, just
> like package/openssh/S50sshd runs host key generation if needed. With
> systemd you can define explicit relationships between units, but we
> don't have anything of the kind with Busybox init, and implicit
> dependencies tend to be confusing & error prone.

I don't think it's something that makes sense if you don't start
auditd. I believe the reason to have it in a separate init script was
to mimic how systemd unit files were organized: there is one systemd
unit to load the rules, and one systemd unit file to start auditd.
Whether it makes to mimic this or not can be discussed, but I believe
that's where it comes from.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
