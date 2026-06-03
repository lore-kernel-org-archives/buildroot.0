Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E050CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A630B61651;
	Wed,  3 Jun 2026 18:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiDgZg7hJPzl; Wed,  3 Jun 2026 18:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 818D160C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512490;
	bh=Nae+jLn7//uKYZgJI/0aqYI0UQoqqiqktH0bc7USdhA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bihuyIdg1AklQsaecM9ycZRn/cqFf4NxqMczz3r2RLJkrHCRHY1iQuC1nRwvHqtxG
	 mls1F5A2Z15Fc0KaHX+K1UpXTqkmXl1/dl8yPkgNV/Bcrlm8rdydbrR9ssM9J164Xn
	 lt+fwbWrJ9zec2L1tandT6wILr1+fkWgGF4rcOERHsDTDx+i2irw0qi7ZQUtPAQOTh
	 EMoGtNN4dPWqGf7LxUCHEjh6TuZZ2mnTHQsSxtUL5OuNmIjIe/So6DY6/p8o6uFGrK
	 R7cdXkLiQ3AXgaWoZGIunYv+2lmtXW4x1EiEfuUFNHNIhtrs7qRPu1iIn40iYb8KoD
	 dnpA5iFzMfDrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818D160C01;
	Wed,  3 Jun 2026 18:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9805E2F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A14A4276F
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUCvTfXxxydr for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:48:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82FE142721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82FE142721
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82FE142721
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:48:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1900956041; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:48:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqdG-0000000CfYA-1cqz;
 Wed, 03 Jun 2026 20:48:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260602124047.287780-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 2 Jun 2026 14:40:47 +0200")
References: <20260602124047.287780-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 20:48:02 +0200
Message-ID: <87fr33o3z1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pf2jenY9+l+SLjWO6oNnP8nLRiABen3o0L5rPyVTrhOY2sKNeFFxDgXqCNYiW0EV+vRMqOzOU2ioSRJwIklXXMVz8ih9sD6AwP2JCInYWOzXZQEdd9bG3cIYQhH03KdP6QoTnM28GQ2nBn2ojyVSExGIhdsqMeThGwkDc43SdZplOm1TWbeOncvm/X9Zfuc9bnllp/Jp3MDeAqrosolLqjdOPxEwaqKlKBQzZnCJ3RuvGy24D7RizXy1JQ60WntFayOBMFdRavmNJT+TQu7IohqIloHxKtwn2GqAqR9538tyjCl0TtnxbQrS13VKmhaFcP8IrYscQNyl2Cl44T4bbw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=c9lVkpn7M3nGHr6c4ELLpD9k55lNYGHeO/gnOww9XHE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=pf2jenY9
Subject: Re: [Buildroot] [PATCH] package/sane-backends: update CPE
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The CPE 'sane-backends_project:sane-backends' only has a single CVE
 > assigned in 2017 while 'sane-project:sane_backends' has 9 since 2017
 > [1].

 > See the package CVE history at [2].

 > [1] https://nvd.nist.gov/vuln/detail/CVE-2023-46047
 > [2] https://security-tracker.debian.org/tracker/source-package/sane-backends

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
