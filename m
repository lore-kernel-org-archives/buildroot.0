Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7D6CCD19A
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 11:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31818607CE;
	Wed, 18 Sep 2024 11:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfVMEtgCt6Pa; Wed, 18 Sep 2024 11:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EBF2608D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EBF2608D0;
	Wed, 18 Sep 2024 11:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B51C1BF97A
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9518480F
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Dh4ctUSz_6d for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 11:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66CA680C4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66CA680C4A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66CA680C4A
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 11:16:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2D542000A;
 Wed, 18 Sep 2024 11:16:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sqsf9-00DBx9-0a;
 Wed, 18 Sep 2024 13:15:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: ende.tan@starfivetech.com
References: <20240821055146.46029-1-ende.tan@starfivetech.com>
Date: Wed, 18 Sep 2024 13:15:59 +0200
In-Reply-To: <20240821055146.46029-1-ende.tan@starfivetech.com> (ende tan's
 message of "Wed, 21 Aug 2024 13:51:46 +0800")
Message-ID: <87plp1rz4g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [1/1] package/libkcapi: update site path
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
Cc: smueller@chronox.de, fontaine.fabrice@gmail.com, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "ende" == ende tan <ende.tan@starfivetech.com> writes:

 > From: Tan En De <ende.tan@starfivetech.com>
 > Update the site path to reflect the recent organizational changes on the
 > chronox.de website.

 > Fixes:
 > - http://autobuild.buildroot.org/results/77243633783ac2d037d15d7e9c01384781fe700e

 > Signed-off-by: Tan En De <ende.tan@starfivetech.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
