Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A974C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8EBA8231E;
	Mon,  4 Aug 2025 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HMCfrsoHwh1; Mon,  4 Aug 2025 18:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A15B82322
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A15B82322;
	Mon,  4 Aug 2025 18:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3D22118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A24E582322
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rB6SJVYJkBFF for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D7E78231C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D7E78231C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D7E78231C
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:32:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 234467517; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 18:31:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uizyW-00BETS-2x;
 Mon, 04 Aug 2025 20:31:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Hans-Heinrich Hansen <hhansen@avt-nbg.de>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <FR5P281MB50782986E33353F9AFF80C468723A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
Date: Mon, 04 Aug 2025 20:31:56 +0200
In-Reply-To: <FR5P281MB50782986E33353F9AFF80C468723A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 (Hans-Heinrich Hansen's message of "Mon, 4 Aug 2025 11:37:52 +0000")
Message-ID: <87y0rzkkf7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bWVol8eMUQxhfbPpKwKo1va+0xRrNzSLZxWfGIjqW8ak5GdrRI3LGmvkFPsZQ+q/Eq89DZSDohV5cCrN9ZxNKIx6od9h07iCIkZ/fPnmolVSIyWkdlKGhM4rndqCaRwg854p0VqOBDsDa9XOKVjFnzj8nLqy+3BaZJwpLB2HvWT+miIFBdJAEM9pV89H+JJMynkhtGvtt0tDaBq9i43f/sKb4Hj/1ffe7PeHBkCvfA/FYeM+R6oMIRW0mjRzYOqqgeT1baq4ls3qeK/cS79fLFfzrVFYo2kfB7jq77ruUiObdnQft9EVCS8HVfzltZYaNpSlNqXZv+8JAsIrGu08QQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=HQVQtrpC2iqoTi/lcJPG+qkEEMJkt0V3yq35Waq48M0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bWVol8eM
Subject: Re: [Buildroot] Buildroot with Advantech EIO-IS200-DRIVER
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Hans-Heinrich" == Hans-Heinrich Hansen <hhansen@avt-nbg.de> writes:

 > Is someone working on Advantech EIO-IS200-DRIVER
 > (https://github.com/ADVANTECH-Corp/eio-is200-linux-kernel-driver) for
 > buildroot?

Not that I am aware of. What specific issues are you running into
(besides the general issue of a not-so-clear out-of-tree kernel module)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
