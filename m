Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8899BFD8FCE
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B9938151E;
	Thu, 26 Feb 2026 15:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZN2xHgutgSGq; Thu, 26 Feb 2026 15:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 313B181489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772120731;
	bh=5uV/DJ2TjJpkRlALrpulCnlg4WEqIapz+zdCTM4JsGY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bs90Msa9I6L5noq8mz0QGcqnliLZp1DxK3z/gnN5iTSivb8XXG5PyDCiZckv56kAb
	 V+una6ywT9p8ac5SbbZcwNxU9EeiHXUDknO7eQ2B/rnp/gjbC9pgtuhhZWBi4/XpF1
	 Gb0FzEU/FoJ/U07g7Pi2JxAJ5Q/rqy1ecpDTH0MMHJbfS2Y65kJCyHk24c4dEaSbDV
	 0OoW1kCIDf4iUW3q19q4SLY6947uxY/VDW8vQ0JXMLmzHWZ2K+3SDSynCNkxmK3ZD7
	 KLjnnp3RJ+LsflBBqu01b19inIYhJ4EoleqeM4HfhmWvMoJBJvSZayVZiOcRp7GatY
	 1wVqYm1XsIACA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 313B181489;
	Thu, 26 Feb 2026 15:45:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53DB9204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 510DF608CE
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgnD8XNAwPsv for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E136B6086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E136B6086F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E136B6086F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:45:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 837310162; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Feb 2026 15:45:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vvdYD-00000005liA-2bje;
 Thu, 26 Feb 2026 16:45:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: buildroot@buildroot.org,  Pedro Aguilar <paguilar@paguilar.org>
In-Reply-To: <20260225175138.2965145-1-paulk@sys-base.io> (Paul Kocialkowski's
 message of "Wed, 25 Feb 2026 18:51:38 +0100")
References: <20260225175138.2965145-1-paulk@sys-base.io>
Date: Thu, 26 Feb 2026 16:45:16 +0100
Message-ID: <87ecm7qzjn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VlVRNDRq+G4nca4VzWeRm3kCPTyRO6COwujnRgqp1P0TyJDWWdvUPKK9S0rtreT2PMWzSArnF3HdhpNte/qSH0xVWLkKgYs3H3MJmrCTXooBkyJTN7knF4UlxVU1vAMKkUHtsE+YIWS3fGHyDGlsoLcYCZFbEvYpqDHC2EMz1YgNK86EpZfaRGjwQHQINLG8Xk7gRn7ROjoSIqEoKEQz+GvAYlBDc0iDEm4es21fq3eSTz4liTq1ZjUlHurJmY2ycAhXH9OEwd/MUAFn20SNygH1O2qm7411TNp68Mz4DISSpISmuPpnXbl6r8YVou1f/xGy88Kq2gBbKCjLhCxnzg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=YYkdmqdiPINllE4509/iNbw+mCxuVOC9kYs6OafMkHg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=VlVRNDRq
Subject: Re: [Buildroot] [PATCH] packages/libunistring: bump to version 1.4.2
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

>>>>> "Paul" == Paul Kocialkowski <paulk@sys-base.io> writes:

 > This minor release contains a fix for building with host glibc 2.43,
 > which fails otherwise.

 > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
