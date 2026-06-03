Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45715CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4844257B;
	Wed,  3 Jun 2026 18:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLnECD9-3pAz; Wed,  3 Jun 2026 18:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52AEB426F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512715;
	bh=j1J8zufoPju6hdwb6CNPjnp7bOwh8+jffkQGToskoRo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhpnDK249tyGbpo4bYz6kdVQugc+IxBTCVhoSMZjXyeTODnv/En8+IZvRMsKO/mVd
	 NH2zZPbIB1nVJ0S8btzyOCWnYlUE27fcNY1Lm0DK9cHRV3fDlF5f6fw627yPm0Hm3t
	 kSGTW/AGohNu9R0cBIMlcqf1ShhgS3oY33VpshoNSdbPpNmin17b/SLzEy7DSXW8O4
	 Js8rhoQbyI4tagLQ2s5FnSZRN/zsqCShslsUW7UD+48YgHCDpJkRFHkhvPEHsPTcHB
	 0vGSliYnAVOD8/5Q9/p8QcqRqtLS9JRhr6zWq3UoreCpy/zMZsA15HS2pAAPozNWHo
	 081TeGVFf9unA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AEB426F4;
	Wed,  3 Jun 2026 18:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 192C42F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AFC48457B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLoTKaoth4-K for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FF158447B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FF158447B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FF158447B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:51:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1192928834; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:51:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqgk-0000000CgH1-34NZ;
 Wed, 03 Jun 2026 20:51:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602184427.1707888-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 20:44:26 +0200")
References: <20260602184427.1707888-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:51:38 +0200
Message-ID: <87y0gvmp8l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BKiYaEPA59tKcX3LEGrAG7y/QN/0ewE8sWdaIWaUSqr0gTNJJbCcPfF0TecbeHiZ4e33hC/um6pVGtOZonH39W4L9I4EHujpMCo2xWH7sZ+x6XEImyGlnLfsCRQE8OFryDeateA/rVhuLwfRLxMXZZM6f6s8Juc+9KlA90xAt3LEPMnJ9hqIuZdKXO/nh9WOY0xNHvOZFWXsw1ugFBD5ofV+lfQlj0mAklhef457eDQq0VA678ANtbooFBgYoX3h7kRQ4LIlsUx+xkpq4fUx9vBy6R5gmizpe/6H7AV0y9XA5RYz4mFgf81sHHk3wL/ubWD0QkA5kJ7S4+fV361h2w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=6qTY2oEYCJt0IzFy+BQVXtqwNeaiYLtTlcX/eopzyrM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=BKiYaEPA
Subject: Re: [Buildroot] [PATCH/next 1/2] package/alsa-lib: bump version to
 1.2.16
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#alsa-lib
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
