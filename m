Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F1CD10F21
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E401C80BB1;
	Wed, 26 Nov 2025 10:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4A4yflKsH0c; Wed, 26 Nov 2025 10:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA4880B77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AA4880B77;
	Wed, 26 Nov 2025 10:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A92332A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EFC4606CB
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXZENMn7cohK for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87DE760673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87DE760673
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87DE760673
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:44:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -672789673; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Nov 2025 10:44:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOD0o-0000000BfbN-17Ci;
 Wed, 26 Nov 2025 11:44:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251126070704.867987-1-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 26 Nov 2025 07:07:03 +0000")
References: <20251126070704.867987-1-neal.frager@amd.com>
Date: Wed, 26 Nov 2025 11:44:38 +0100
Message-ID: <87a509gjjd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=0Gw/2gGJaBmItz/Nl2vFbhqaA97GNllvarRkJUDt+EIpXGGSaiBcotMse0GZF68M5ahZZSb8SSC/lb3x2OhJRR/y9hnRACThTvO+zTxlXB/zXOxxJKFO5gDfs2Dxywjz5AM2Uz+umVa53wzpsSElvPkLJJkJKuMMSAfKYVGYqJSkMznxhqLB+mOWy1lKosr6yLGfZaNhbi/LS3Yqhz/ylPs5wdMKT1nJpVHu9NBGFZ7qdaj9BZq8DJn6eAZwIcrXwdwIR4NNoZCILT9iTDrvrwudEaJKB+nXTQYoWUVT0NhSxD9l7ErMqnqwPNTsFaWgLDDMaeWtjgjgUhmCar2ixw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=82SJWCcPxLuyNArhnGTCq9o2J/B6vsRcVwVNEQU2W5I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=0Gw/2gGJ
Subject: Re: [Buildroot] [PATCH v1 1/2] boot/xilinx-prebuilt: add
 xilinx_v2025.2 hash
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

 > Add hash for xilinx_v2025.2 version, so that example defconfigs can be
 > bumped to the latest version individually.

 > Since the license.txt changes with each release, move the hashes to version
 > specific directories instead of having a generic hash file.

 > xilinx_v2025.1 hash is moved to boot/xilinx-prebuilt/xilinx_v2025.1_update1
 > xilinx_v2025.2 hash is added to boot/xilinx-prebuilt/xilinx_v2025.2

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
