Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED8ECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 884AE8436A;
	Fri, 29 Aug 2025 15:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubmmWHTRzzr7; Fri, 29 Aug 2025 15:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A385584274
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A385584274;
	Fri, 29 Aug 2025 15:45:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EFCA6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FC9283C34
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUB1d2Eejgtu for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A995E83BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A995E83BC1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A995E83BC1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:45:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 850177832; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:45:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us1Ht-00CjQP-0y;
 Fri, 29 Aug 2025 17:45:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
References: <aLAtDsqpq1ePUy46@waldemar-brodkorb.de>
Date: Fri, 29 Aug 2025 17:45:13 +0200
In-Reply-To: <aLAtDsqpq1ePUy46@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 28 Aug 2025 12:18:54 +0200")
Message-ID: <87qzwugmie.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=huCxyZ8fZYNgPbmW4h88nPXB29pQGCbgPk46NYwGS2R1rVZWE6yz9LCq7K49YSC6PCq9pv8cr2X6Yjqsxi6MrD15VCmDI3zn85lnizhbKQSAjnfeP9aCaPBeMBMl0hz08qbP5tWWTaFmqh/tP2yqomhbbSWSi12/Q9iIh2ff66bay3uNnrcXqDD49FHYVglSKwdETuZqm6131qqig1aYo2mtrHLYjldzjUG9pHk4IYmGsilmTfufAydhamy0GfkNWMkwuUtZtvO7si3PYo/dU/RdfURYvAVdGzOLA0Rr100SYWt//ja2lLmUGsbYOd4j7ZZWo5En64mqN9CnFM5x1Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Zf28BalfKqKB5hncUqbPUgxCNnN/RUSSkiffCb0vCCA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=huCxyZ8f
Subject: Re: [Buildroot] [PATCH] xterm: bump to 401
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > See the Changes here:
 > https://invisible-island.net/xterm/xterm.log.html

 > COPYING was changed, the year was bumped and some extra
 > license information was removed.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to next after fixing the subject, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
