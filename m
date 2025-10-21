Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA59DCCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 14:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0599E60AB0;
	Tue, 21 Oct 2025 14:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icifrRE9w5W5; Tue, 21 Oct 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A9B6065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A9B6065F;
	Tue, 21 Oct 2025 14:07:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 312A043F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 14:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F2740139
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 14:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnBc8IQryCiY for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 14:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51B3A40135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B3A40135
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51B3A40135
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 14:07:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 601595805; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 21 Oct 2025 14:07:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vBD1M-000XDt-3C;
 Tue, 21 Oct 2025 16:07:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>
References: <20251015071659.CE0248710B@busybox.osuosl.org>
 <2238c48e-068e-4215-8c19-c41f1a17998e@bubu1.eu>
Date: Tue, 21 Oct 2025 16:07:28 +0200
In-Reply-To: <2238c48e-068e-4215-8c19-c41f1a17998e@bubu1.eu> (Marcus
 Hoffmann's message of "Tue, 21 Oct 2025 09:40:45 +0200")
Message-ID: <87a51kcpr3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kwX7teS53njr3NxxLCaAX/cUOALh+D6YAB1Gx8XrOl5IOfHKVZWa3lponRRL3gLfM3nmElSomdOHxNnrigSCCpoWrx5eTQmM7BA0D+Odgj+MANrq4c5JIHOu0n27WOT+fsSv86NjY7vgZzEgRJR1rX/qnJOtUJ59wDoCH84oBcYxMXKwCCPUUzwfJkltx/c+1XnE8LkzmTigekpZ1X/2bmuKqvv0xzC6+2EA/zjIEXmaMDrqSi5yUAG54Z+JTSJsd2Q63jq08IFbhMzF3iTU3BdwWAQelFvmQa94iSB+AnHookkRDm7fq+kJ+7EHsmG2sUUVdfz1X5YCQA/35Hj65A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=DjHu+k30r41RU1MicpatqDB6PcWr8o3FhYdng+V4TkA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=kwX7teS5
Subject: Re: [Buildroot] [git commit] package/python-wrapt: bump version to
 1.17.2
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

>>>>> "Marcus" == Marcus Hoffmann <buildroot@bubu1.eu> writes:

 > Hi,
 > On 10/15/25 08:41, Peter Korsgaard wrote:
 >> commit:
 >> https://git.buildroot.net/buildroot/commit/?id=1519659b42323ee0dccd3b4642258b756a968396
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > For the record: the commit message is off by one version here and this
 > should have said 1.17.3.

Ups, indeed - Sorry!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
