Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFED10F21
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E216078C;
	Wed, 26 Nov 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhDQ24WOXN99; Wed, 26 Nov 2025 10:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D4B606CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D4B606CB;
	Wed, 26 Nov 2025 10:44:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B309E359
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99A8D606CB
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzL3CzEPS4Xs for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 804D160673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 804D160673
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 804D160673
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:44:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2003349317; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Nov 2025 10:44:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOD0t-0000000Bfbm-1UbM;
 Wed, 26 Nov 2025 11:44:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251126070704.867987-2-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 26 Nov 2025 07:07:04 +0000")
References: <20251126070704.867987-1-neal.frager@amd.com>
 <20251126070704.867987-2-neal.frager@amd.com>
Date: Wed, 26 Nov 2025 11:44:43 +0100
Message-ID: <875xaxgjj8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rqboA/GiUXvNHR4nGfzAhY5s9q4QY1XRERm+1kfbqrpHal5pzyHr5KcYmodAkc+Wj02Fq3DugwZPP4PxkRXTZydCY/wNf5rzm2XKe2cctwb6axOXdm6xh7HS1RrJ22m6JqO4j2eMfm/V9nsPhDWHdoGv4K5jcPFVB3kahDrDT8t5oljFob0klNieHh+naTc4FaIzYhiDyaKsK+5mgaBf5Z4YM9z1T85DSSodBCYj5KeZyRhhsPlD751XS6ZSOqxZAWmZq/lah8CjKFwC84xEyTmM2GvEnPwWU3tarkpeRVS4meEpITxxmaSw3/lQgSePi8zAlfloB8HX/D3NO7eXpQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=lpEdb4U//a07/JdhlaWAlvCkXooupZk4jJ+1Yr5pPlA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=rqboA/Gi
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/versal*: bump to
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

 > Bump versal defconfigs to xilinx_v2025.2.
 > xilinx_v2025.2 includes the following software versions:
 > arm-trusted-firmware v2.12
 > linux v6.12.40
 > plm xilinx_v2025.2
 > psmfw xilinx_v2025.2
 > uboot v2025.01
 > with all Xilinx downstream commits included with xilinx_v2025.2.

 > xilinx_v2025.2 was run tested on a vek280 evaluation board.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 > This patch is dependent on the following series being applied first:
 > https://patchwork.ozlabs.org/project/buildroot/list/?series=483234

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
