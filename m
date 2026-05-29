Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC97CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 871764218D;
	Fri, 29 May 2026 08:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsa4osfrqFx8; Fri, 29 May 2026 08:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AFC24212D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043826;
	bh=O7ozG8HuiLot1opP2r/TXpG+PB1FJiY6HHSe2ZRz4q8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9aj60sfk6TapM0m0wKW6tsDA4+kjzdsPL9H4SIRJPKB6FQ/O7nUpaW51t5n7gDIS
	 nQfS9GtHV+Ek3zgYYgSq9TJ/+JUsd61T54+b7v3+MMKtvEz2sUnedqWqqSFv6m01G6
	 t0wiwdE8nLoS4IU5laD8/6QiyL58wojhiKF9peZhW0bOE5tYTZ8uTV0nHOdW6Ry5Im
	 jrWSywjm4H1TaoNHWp4JVsQ/5jBS6/2W8gjyG5WMOyEpcB4pm1Tgq2f3flZrZ7HngR
	 Td5O800TJS2N71TAU2caqx4cHHrZaZhX1dz/m7uscMZaoDr6D8Nw/xWUwatpG3qLj0
	 ZER68FOnH9jnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AFC24212D;
	Fri, 29 May 2026 08:37:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 934D6288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9071240B94
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ppUoQVQHByl for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18EFE406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18EFE406F3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18EFE406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:37:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1521461299; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 08:37:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSsiA-00000001aia-2Ix6;
 Fri, 29 May 2026 10:36:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <ahj_eBXQ0dJThOrD@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 29 May 2026 04:52:40 +0200")
References: <ahj_eBXQ0dJThOrD@waldemar-brodkorb.de>
Date: Fri, 29 May 2026 10:36:58 +0200
Message-ID: <87jysmk3x1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=otBVANbTrA8A/PwI9Ub/Dkl9FpyETY2xKP4GLgYqSJTMdMdM9mWkoqtRi9UYHXvapNa3sa37WmKFRliyOx64vzdP8fQurA1mNnM00KUaJv1+ZXGP0yT19ANS0WynZkC3zOPILEc5Q7N1iZ7a9OJmM8guv5Wtqg7oBtX42qSAASvXGuwb+gLsoit46eoFpWkwYEdpkCrn8hCTpAOIQS2YneEfX1poWeRDH6om8hJHWIC+Jxcj3nASf8wKh7C9CCKWn+Qsn7dP9PVxPRS2Tg4slWDOkp/U1T8KBm2uzOE8OU9CzgUv+iPxKAqzwoNC5GKHSf79qfY3zuRKKhqIlMkW7A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=PE9/fd5QBDTxPvVL9wqWheHdcH2Kxlk+3PBURCSNp7o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=otBVANbT
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to 22.9.0
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

 > See here for a changelog:
 > https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22-current.html

 > Pjsip was updated to 2.16.

 > Fixes some security issues in pjsip:

 > Author: Mike Bradeen Date: 2026-03-23
 > Address the following pjproject security vulnerabilities

 > GHSA-j29p-pvh2-pvqp - Buffer overflow in ICE with long username
 > GHSA-8fj4-fv9f-hjpc - Heap use-after-free in PJSIP presense subscription termination header
 > GHSA-g88q-c2hm-q7p7 - ICE session use-after-free race conditions
 > GHSA-x5pq-qrp4-fmrj - Out-of-bounds read in SIP multipart parsing

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---

 > I want to stay with the LTS version for asterisk.

Makes sense.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
