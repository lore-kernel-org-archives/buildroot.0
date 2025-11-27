Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669AFD11183
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 07:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3017660BFB;
	Thu, 27 Nov 2025 07:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lj8RW3mcRbq7; Thu, 27 Nov 2025 07:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767CB60B21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 767CB60B21;
	Thu, 27 Nov 2025 07:32:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6159708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 07:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D89AB81E7F
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 07:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtfuApPnB-Mn for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 07:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D07AD81E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07AD81E77
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D07AD81E77
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 07:32:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1640174336; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Nov 2025 07:32:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOWTt-0000000C9ZH-2KiC;
 Thu, 27 Nov 2025 08:31:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251126202307.1269790-3-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 26 Nov 2025 20:23:07 +0000")
References: <20251126202307.1269790-1-neal.frager@amd.com>
 <20251126202307.1269790-3-neal.frager@amd.com>
Date: Thu, 27 Nov 2025 08:31:57 +0100
Message-ID: <87see0exsi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RmjfBmivMLcFjagRVHaEoj4RjrA7bybBg544LZUpbBw/yvyK4HpGX8F18AhQi6TxTMCOpbW7j6AKmZokgRJuCN6YoqCrwHzIr5hOaCBXE2P4GnQXXXJVSZU6/RpTInsLKUeydvIzet+8kwKjeT3c93uTts/wyStCNql73oSkZxEOVInQCIQF+EDrEWlzvRCsugoks/hJQRuN4xYpI4a1AdaiJvV5cLobyqSBnQnmSCoHMtqcl634NkoIUJLKpG8QXu1q5sWv7b7n30I/FKTMUwV9BGemNMAb1/GXbG2pndwhVpXcBIkqJMAy253BdHM69Z/Y8OJ0pyq+f99c2OYE6g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=aqBeNZmYPgqCWgYBqDqMXKDdWoE9ZwB+jIT3ZpO+0I8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=RmjfBmiv
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/xilinx-prebuilt: bump default
 to xilinx_v2025.2
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

 > Now that all Xilinx board configs have been bumped to xilinx_v2025.2, bump the
 > default version of xilinx-prebuilt to xilinx_v2025.2.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 > To be applied to next branch

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
