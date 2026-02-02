Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B83E7FDD0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB3A6078C;
	Mon,  2 Feb 2026 21:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HuViGdXDmmN; Mon,  2 Feb 2026 21:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A3F6079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770066812;
	bh=gvd3RgSpIp4jzCwCIHeGXBNkXATMdIjQrc/M/xLj48c=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PopK9dIxyyBLh3H/3fwh+c5uj0SpI4TkOOJyTwsE7/Im+QAnce/0G48AXg7aRrIe6
	 g3IU4GoJR5/oCfBcJ4s8JvL5KmnTQ/NsrVrMIUywDl5Uz+2truT1gjYeAuDrlfhs71
	 g3WyPgvhHJbAjReU6Dfj84mFBUcIbeXwtgHIAL1wZFfVL5W14SDWFQ5Am292JEEwaC
	 Wyy8FQDr5DY8aw0glsby87vzVMCVazA0WFk/DWttKwUjVYGdLN9rU5HwQ788omEZ1w
	 CrWHLZrXTId6as2mlIMvSrjy/uMeoQ3ngQh1/IubeO8avzlGmGLysGzE+1rjrQxl5p
	 qCoflDf1hpapg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A3F6079D;
	Mon,  2 Feb 2026 21:13:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C471149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EC3B403AD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRRd0SjoGC4S for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08C8E403AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C8E403AC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C8E403AC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:13:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 58676789;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 21:13:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vn1EX-00000007eKn-2Eyc;
 Mon, 02 Feb 2026 22:13:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260202193053.173059-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 2 Feb 2026 20:30:52 +0100")
References: <20260202193053.173059-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 22:13:21 +0100
Message-ID: <87ms1qu9vy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kW0fZIa4MDzAxjbAB5PVGo6tzCkYKL2XdnkbltUww29QKn/gtXQaMvcNxNKN8ny5XL9kPZNm8N6qsfXhPDBV4XO2+DCyEbkhJxLU/erwN4Kv8D5YL6bpaXethwfEHf8Wqg2L1rtnZdIXOEUAEST2gA8plCgH55sLXs4S1nXIOOXGcETV5L7jbIG88x3qE+eNLlgmxWd2acToEt07cA490rLUdJ5FLo5u7QVEnDyzTZq4FAtnwT0Jn/uAjmny/vK9LK7Vjqirms4mEpoU7r1D6F2nQhUzFuWAhoWbj77e2drc9EFUYS6kYmSNWDqDb46o9+JflXMEx76/cvCaI71bbQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=phxFB2pavlqd0kKHrDe7M6u2QPTO/LgjtOVKpfEN5mg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=kW0fZIa4
Subject: Re: [Buildroot] [PATCH 1/1] package/hddtemp: bump version to 0.4.4
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

 > https://github.com/vitlav/hddtemp/releases/tag/v0.4.4
 > Removed patch which is included in this release.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
