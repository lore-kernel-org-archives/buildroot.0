Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA445CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7928385487;
	Sat, 30 May 2026 22:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLeDe__fhNt4; Sat, 30 May 2026 22:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81B9C85254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178441;
	bh=mVZL5MnyCZwjNJTCfezhWiNLibNdJj/FP/+xA/RQBGo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VsSCA6L5iBVJN/ShB0iZl29JOJAf2wwtju94S8lMHX5SdgGBtz/kVek1wpEpyXpuJ
	 y5Bqe2JXZt/Hpa2Md4o9uZwH0kyCOLbp/YQvX0fBX8d7A3BugXvVukkeObJtSSAq77
	 X17qV7yyY2F0vua4jLm1Q7VqLEq+E5iOtVjvQq924ici9gvodQNjJt3x0pHwMSbvuP
	 Vw4cNkMVKzhFvnGG5BqtsJiNmZ1aD8NL+zBhlZMndsVLHSqdlk9FZGI+e3rJbN+b1X
	 dpcuoY/Z8/xbpkSAyI0qBlmtmYxJ+T8Db5eqEILZ8rQevFsitJSvLBeKCthGiqgdtc
	 mfAQmDxDUL7Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B9C85254;
	Sat, 30 May 2026 22:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64952D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A30440225
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inBSUp1sPWGC for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 463A94010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 463A94010F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 463A94010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1327806790; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 22:00:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTRjO-00000005pAr-0VQ3;
 Sun, 31 May 2026 00:00:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Julien Grossholtz <julien.grossholtz@openest.io>
In-Reply-To: <20260310134131.418353-1-fancp2007@gmail.com> (Scott Fan's
 message of "Tue, 10 Mar 2026 21:41:28 +0800")
References: <20260310134131.418353-1-fancp2007@gmail.com>
Date: Sun, 31 May 2026 00:00:33 +0200
Message-ID: <871pesimm6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dNWNYEmRVM1QsQuOoRfEFaZevDpyin3ICjy7Qsqr8GUJXd5V5sQM05A4TKUuQl8NsE47x06s6I8FM9fnQ3dhVBfKndbfQDMmQLNDnCX+Y6w4PPmy5ZDdadlAVHJbnSuUu+Cb1gBQRk2DFaT+NHz9EyOVlbMrM7cf3WIGm5ZEs1F0OooBevH34Fml1CdoKst3y4YZFhR1/aiNJ5U6dP7pTGkdvnuXMl+1pAUEw64GeiK895OSLDTENeh6lC9GIA/bCOxyh9EIE4HFK7u/THM169ICwJTsjWEEmU5JOJeX4MrK77d4qadRkz6Zl/K4a44RUbVt7O3vHPLypmpDCdur6Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=I9EHGm/ZXYY3r+Z8twlm/raTOqEdphgSinf7yxIiAfg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=dNWNYEmR
Subject: Re: [Buildroot] [PATCH 1/2] package/paho-mqtt-c: bump version to
 1.3.16
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

>>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:

 > Release notes:
 > https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.16

 > Signed-off-by: Scott Fan <fancp2007@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
