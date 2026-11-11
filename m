Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D7606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qBNTJFHS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=Ub7ahIHm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9685540AC0;
	Wed, 11 Nov 2026 11:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WzYgKuUAANd; Wed, 11 Nov 2026 11:14:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D9EA240AE4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794395666;
	b=TMvb5o4MCCbbIBsmYW5Kxh+THE+a4ae+28Q2AVyvjfsmSHKrGcE2oocrqzTTD+5LF9L1
	 TVlXJLY6xQmiWaRYL3y782TEBqrfv8hlnnE+Ww0Tau3sFbpdFngXxdo7YdATVQRpMyaIl
	 UBUxxn15eVgVAZBQNIqaO8nL5aiggtGarilT7U50Y2cYHPRwHA8onz5hdzMyneXrZkC8M
	 gc+f4bdQkzf4GM0BAgxmQ1fslAw6wWWD3w+Os1p33W7eHlx2RRd9oB1t1GGkq00UxzlAS
	 5UYpCXCh9mL0mdKbRqTbRTlY2IxzTV/VV5JCVhd2+gM+dre0On2q/TQcVHm1fI4DOOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794395666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8IjMopP1oMlvDv0nRrFDPacx8WHMr9Z09klvFK6yXGA=;
	b=JnwP4wXslEdp3wMucLxgo7iwM38uKxo6hKIzSnXXqR/9ohNHBwzv8NE2+BcYsTe/rE+c
	 A9r5I2AqFOvgB93nYHR1HOA+kdploPsgLQ43UBx6S3U604a1JzYZks0bZjTqlFfoffaXE
	 WjjLUZeT4SC8oVPueVMBQkTvuwAoE+Bx4ovlmqB8zcEPdfbUydG1cDmidVzueyHd0lCUy
	 xsBhbLKzYGoDemI10VU//KVSosQ78mSanQNHzJYe9Etwe0d4UNRP2aBOQR726EY6JAzWf
	 xEL37Ng98lmFuBSixPrStPLe2+4oaJbvHh7EpW9JX6xF8+Jzbm5Fg5y71K6toC7yKDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794395665;
	bh=8IjMopP1oMlvDv0nRrFDPacx8WHMr9Z09klvFK6yXGA=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBNTJFHSrTyDOfq3QKpVn5en1iX/VaNjCCvn1lzdyE5JGObsgyJ9I7JqkI0fu7T/V
	 qFWcb/4sdfIqrKhu/Pr8oLLFDCSsE1FMnBCmyUY9djm2UvzgE5ZcQcZkOKTnfWW5BO
	 8Ff/z8FpB9wza7ViAR1dpkJvRKm1h4oRxP92s17UW9g8Fpnxr3rXGs4w7EtIcRG8C8
	 yML2TJ1tgwXQoTe0QwZ2ACychm/mNYsFOx+77aKElkaHHs8zJkfFFKZmzCer6Vp5du
	 GiESa8dl0fJb6bp08g25t0SCXIDGMNkzqAQMMBKOjRuESefGJ9K7vav6MI+fT7xUhG
	 JHwddRJUVGPFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9EA240AE4;
	Wed, 11 Nov 2026 11:14:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC9B8731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7D0440217
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqRdI3fZdh9x for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1AB56400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Ub7ahIHm
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AB56400D5
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Ub7ahIHmf4D0xjxu0nyEzRjXmzW+CJgj4d+WXA8mdHQ3+OJOBE2+6niqQ1LzYP4tBrQPEgrRvbZh/khD927y75bPbnqWZgQLDtzV63QAHwpbVrGSmmcI02ykEZzWg8eSvHRMfrNkRFzFvgg2GrvLa2DJnQN8IyrapgE0qgDdzg0xvsceGax9nLtVyameP23kGf9ky3UQThA817gO5dhxCXzEjgWPZxsp8+Z8Qofj7GjdXXkXgk2gPuZV6uHI9iMgTM1AHCtOEoO95AWWB8K63dGEVr1NJ062G5afQ1Q1XK7XeHhSsu6Mr8gvxVsYct63xEcvPvah8byhKc6HeCLaNA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=5aZ7sGe3NwOLPeGPoA0oatWnUHF25/EI4E3aP8l/W3g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 552019567; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Nov 2026 11:14:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xR6HK-00000002QpB-3TfG;
 Wed, 11 Nov 2026 12:14:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261109123717.2228375-2-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Mon, 9 Nov 2026 13:37:16 +0100")
References: <20261109123717.2228375-2-buildroot@heine.tech>
Date: Wed, 11 Nov 2026 12:14:10 +0100
Message-ID: <87ld6zk4cd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.16.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

 > changelog:
 > https://github.com/catchorg/Catch2/releases/tag/v3.16.1

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
