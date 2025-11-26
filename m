Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7DBD1037B
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0501A60AFF;
	Wed, 26 Nov 2025 10:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnpMloJu0jVX; Wed, 26 Nov 2025 10:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16FC8606CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FC8606CB;
	Wed, 26 Nov 2025 10:39:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B452A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE1780B42
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atWxyPs5KopZ for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1648780B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1648780B07
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1648780B07
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -668985904; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Nov 2025 10:39:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOCvr-0000000BcMK-20om;
 Wed, 26 Nov 2025 11:39:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251123172531.527134-3-neal.frager@amd.com> (Neal Frager's
 message of "Sun, 23 Nov 2025 17:25:29 +0000")
References: <20251123172531.527134-1-neal.frager@amd.com>
 <20251123172531.527134-3-neal.frager@amd.com>
Date: Wed, 26 Nov 2025 11:39:31 +0100
Message-ID: <87ms49gjrw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dTlboMQgjfa9ACn1BcT4ltK97Ig3cDs7Bqht2NTQmGAnOa/M7FaDAdgZeMVAesL6O7LksZ8HtFRRzJpswF8E3ypHdNkrFJmcysKHPrLnpcZD+8Xu4sHKoYbkNnhqfTBXmCItarJPxNp/e4ZDrlGpmNMnjXx8XZ0W8jArBfiplRz21fZh+sEvQD+bjHNJ2YMahGeDfRGenrTtHyRIwpZF/U0COJLiCelA5WaH3pSAUwnpW5LLDwtoFx2Y2uHUhfVtpUSIUzRsPkSTk249Mc/8pbOcgC0AytfnkXToEGUO7FjSl57tbayUO9pDxbp/o0jw+NlBdModPpko8R6itcJ3tQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=cIFmJbJcYt5siXPBPg8OUnBrm7rb9DQrJrSZ6Ur58eE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dTlboMQg
Subject: Re: [Buildroot] [PATCH v1 3/5] configs/zynq_*: bump to
 xilinx_v2025.2
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Bump zynq defconfigs to xilinx_v2025.2.
 > xilinx_v2025.2 includes the following software versions:
 > linux v6.12.40
 > uboot v2025.01
 > with all Xilinx downstream commits included with xilinx_v2025.2.

 > xilinx_v2025.2 was run tested on a zc702 evaluation board.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
