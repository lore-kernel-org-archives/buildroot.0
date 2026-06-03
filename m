Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FD6CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3188884422;
	Wed,  3 Jun 2026 18:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXpWgm2yPWwQ; Wed,  3 Jun 2026 18:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F45883077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512404;
	bh=5viX7QMsg3C8M/0i2e3vdvL3Nz6JTO1GsrKMJuPnGD8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZTe2aktaCNyf77h98dj5C/fXQ28djZe+r1zET3okhrGbSzjv/spsPESlKTHYGBCST
	 8KENAFVKUxD9xtj+CKZvSP+NclNYyvJzd6zGdbQd1cOIkOLqMb5Rdj3DVAvXbk+Thz
	 OMAsniVc0Vc2q9BXmUdx6+7ogXu4iSD5kQ/V+KxtImdzA3ypddmsyOsUJLaLxQu0Wn
	 iqrSszRRosZTvNJofiNYKFdjbkUAz7zBY92p8ICGtRgM2J5X3jsqCYVg8fSyvEuwI1
	 28LhmV/rW81c/995j5pfL9Xc+X3BCsYgEnKWiPdOygI1ryQsgNTl/Sw4GJVlcP1lPv
	 L61JCJ/aX4xFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F45883077;
	Wed,  3 Jun 2026 18:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E930192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23E284229C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCH5-jR9XWRR for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 106C04011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106C04011C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 106C04011C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:46:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1435687403; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:46:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqbs-0000000CfTQ-3gll;
 Wed, 03 Jun 2026 20:46:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  James Hilliard
 <james.hilliard1@gmail.com>
In-Reply-To: <20260602124035.287632-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 2 Jun 2026 14:40:35 +0200")
References: <20260602124035.287632-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 20:46:36 +0200
Message-ID: <87jysfo41f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=puAXXh9WsKt1yg15YMM6yd7gnd+3P+j94grFNqEio1ho1RP+MvQon/lfU8E8kNCOxYzcs/wcjEhBeuG1VEattHFGNhcb4Fi9cS3DoBy1pqRm2tkoEMxn7izwZM4BPSKF6cDVZ8oq75LlR5nq3gVZvKDsM66zXw30JbVhywyiMuUmofNDqfJM+KqN2rAKXioWDP3qKKKF7FWWnh91AamALFhthuxyTLqA1df0B9YprEKqvkVzDvgsWCAQ4oHIuAkSE2nvC8cl4NnGmWP4Bl1vWbL2GwGvmNAerMaPEPmSsPeb4kcvzlp7Z0xEGLrVedsEGOKfgMFQPUpPNcBxMwMjJw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=5M5uAJv0LpUxN8RYQ78F4BQFyMrxi6YBK6uA2ioEqN4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=puAXXh9W
Subject: Re: [Buildroot] [PATCH] package/python-ecdsa: update CPE
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

 > The CPE 'python-ecdsa_project:python-ecdsa' hasn't received new CVE
 > since 2019 while 'tlsfuzzer:ecdsa' received two [1][2].

 > See the package CVE history at [3].

 > [1] https://nvd.nist.gov/vuln/detail/CVE-2026-33936
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2024-23342
 > [3] https://security-tracker.debian.org/tracker/source-package/python-ecdsa

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
