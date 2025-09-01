Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB626CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 07:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E71C4134A;
	Mon,  1 Sep 2025 07:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84YtPvW6L8J8; Mon,  1 Sep 2025 07:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE8044136D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE8044136D;
	Mon,  1 Sep 2025 07:58:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4D2169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 07:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DFF34134C
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 07:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5uiRbu5qEWk for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 07:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E7894130E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7894130E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E7894130E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 07:58:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -850104615; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Sep 2025 07:58:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uszQj-001O9e-2F;
 Mon, 01 Sep 2025 09:58:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org,  Tzu-Jung Lee <roylee17@gmail.com>
References: <20250829080657.2627985-1-peter@korsgaard.com>
 <87o6rvfset.fsf@dell.be.48ers.dk> <87zfbevqsz.fsf@tarshish>
Date: Mon, 01 Sep 2025 09:58:21 +0200
In-Reply-To: <87zfbevqsz.fsf@tarshish> (Baruch Siach's message of "Mon, 01 Sep
 2025 05:40:12 +0300")
Message-ID: <877byifvtu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rtcXOZ23OOqCS34jFA8P/GhZpRXNi7STSAanuT45BDlt5N5nO+N0/r35yTx5ZogrknNGj8ggx30NBVVvXxJvuMfaaDzZrBTFdWgkQLb0Bilb/spxUKJg10pNl1piIyv5MfvPvQLTAvvrPVd4xU7s5qVZeyWTAlRc7FEnK78eqQ6dITlXLCO/oFXCPaVgOu6Dv7STS0dcBa16jAcKaeD3rirnPFpr0ctqVdNtnnTsQk9OPWCMJmh0/OAxPNKwRYT3XxNu+Yuc/rwQAq76OFJPUS0YW22LtFzRKbxy5tb4jsEr4h08ZYzBzi4JTRPbdjrKA4JMvbCpfs52faDgkmIL8g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1WA/WJSsNF9en6K5a3O4lWkAd79Mk2Mhm3uxeJInu60=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=rtcXOZ23
Subject: Re: [Buildroot] [PATCH] package/tstools: fix build w/ gcc-15
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

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> > Add a patch from an upstream PR to fix that.
 >> 
 >> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> 
 >> Committed, thanks.

 > This is not in master as of commit c7af01f47a ("package/ipmitool: move
 > to codeberg").

Ups, fixed now - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
