Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F63FCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4376D85458;
	Sat, 30 May 2026 21:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IL-HLDjoHBTW; Sat, 30 May 2026 21:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C0DD85453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176852;
	bh=xjd/xKoAbXSq+bow/bL3nknDKMs6xtC2mpONARa5ulw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldtFqqNyWiDOm7KuNOQDi4F45fMR/oyopJ0pf20YrNAC7/U8HmyCa18tVwCkoE9+h
	 COKGOnv9g1kjYypl95nVV5anxureVRgk8Yv9EAlP0y+pxAjpI+yu5pmEr/eCfBPcyK
	 5Pa7lfVj/7NOXfLygi2yINikZLI8SywSf2GBxLPBRkRtVlWjT3G6NDBL07QeAWph71
	 634SUaNbATAq24AveWogOjNkbR7Ba1QZz3vIfm/rhDd6MnFObGDR/19gJ2Gx2B9aO2
	 dFrZuadpWV8m45wAPoy+34hL/lSUrjibLFq5bkxgaEWp/0QkLzKIKBE1viitiCq+rG
	 h1NhtiahBJttw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0DD85453;
	Sat, 30 May 2026 21:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E0B512F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73259401F1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbkNczX0Uw1g for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53E0D4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E0D4010F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53E0D4010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2032111592; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 21:34:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTRJg-00000005nOo-3bza;
 Sat, 30 May 2026 23:34:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260529191238.17385-1-fl@n621.de> (Florian Larysch's message of
 "Fri, 29 May 2026 21:12:37 +0200")
References: <20260529191238.17385-1-fl@n621.de>
Date: Sat, 30 May 2026 23:34:00 +0200
Message-ID: <87v7c4inuf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LeM01Q7oaXIU9C2YeC5RCOPLTevZolvfvuN+QZw4IA+UJ61uN34G5QnZS0KpHo6dZgDgeWTzm0u7viLicRjkSrt0RD9FVHbU0mrnvFf0vt2KOS6d7HrBVnNrGewh3RozO0DcgzMvAgG5GqxtnNkY43is95SddEXavGHDkm3P4ALXOD5sLMQPPlZFsKXn67ui3n+MKRux27GprsDd7m1+WvBn54UF0qvXoVfRE8pSSWrx8dIbw0ONPdeOkqGFsztEgCBJ3NryM43+A733f7fD2RH+66lvtXRRleFSzu0JRhwKOk1yPwAJTAQmTwZGuJRG2OV8lPLhj4cyg11iG2onKg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=iYIWM/F9ovLkNYYXcxWl5R3NcTa9kSyQ8nm9YP9dSA8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LeM01Q7o
Subject: Re: [Buildroot] [PATCH next 1/1] package/sigsum-c: new package
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

>>>>> "Florian" == Florian Larysch <fl@n621.de> writes:

 > Add the sigsum-c library, which is a more lightweight alternative to
 > sigsum-go when only proof verification is needed or needs to be embedded
 > in some other program.

 > Signed-off-by: Florian Larysch <fl@n621.de>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
