Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828ECA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5297844B3;
	Fri, 29 Aug 2025 15:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1snuOLCnCtO3; Fri, 29 Aug 2025 15:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5011844A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5011844A5;
	Fri, 29 Aug 2025 15:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6981BD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FC69415DF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiPP_nzHH-Pn for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF0A640735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF0A640735
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF0A640735
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -802448998; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:32:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us15G-00ChYk-1q;
 Fri, 29 Aug 2025 17:32:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250828130513.146485-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:32:10 +0200
In-Reply-To: <20250828130513.146485-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 15:05:09
 +0200")
Message-ID: <87ldn2i1ol.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Q5gOnLhGZOwaTviuBTcJipKUwvf+zpmHGLHtE+vE6qYCky2tI3CU5qM0MqqQf1tCMZJMToWGvyxp/hSddgcZCbJlcbb02oxtajZG3Rr1+4Pp/4dT+cv3FyRw1PzjZq7eZMSsEL7PMSp8pwqWD5IWqXaCjtxh3GHrwiXslz88fZGcRvDCwp/xgGcShOuPrEuY2ZRJvRmfwBRaMOLBXTtfyWhCaaZYGqkSHK4ezOI23QVH88vfYo4ZdZzkfhPaSQV3hZRn/I/ShtirhHPfnAV5F8VBUIZRYXDkaKtEYNaJdrbo5ZrZMP6KEk9f2GnVVbS82zl5madPYuezgAAJLA/SzA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=3tDlzzOt3CFP3WZHJYkEmtbqrYm8JFmunGH1Rlae7E8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Q5gOnLhG
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libsvgtiny: add patch to fix
 GCC 15.x build issue
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Add a small, easily backportable patch to fix GCC 15.x build
 > issue. The issue is also fixed upstream in later releases, but this
 > patch is a minimal fix that can be backported to LTS independently
 > from a version bump.

 > Fixes:

 >   https://autobuild.buildroot.org/results/c3d703663faabe40448d908afbdbb351a016aece/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > v1 -> v2: no changes

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
