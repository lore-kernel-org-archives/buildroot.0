Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F6606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z653tDwo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=DMjoqFor
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D8AA40DD8;
	Fri, 20 Nov 2026 06:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBOzVRr29__f; Fri, 20 Nov 2026 06:37:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5AE2C40DC1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795156661;
	b=HmSsW1i39gMl4hfvxf2gevzwu9N4goA4K/Y3t/n6ZQ9cDzHn0I+vdZk/6cx3yuoYmZmj
	 M0oZEaaCEmfUGGHUuh5FnH9KWNpiDJGIwltMVkkprbjWrOGFe753xfZPccJ9dj4V2LPQc
	 n21QZNMkk7XxiwRuuQ4xPMR/GMqHg3cCh3k2KFiYJGrHO0vPPY6WrJmcf8oz7X1gTyYKb
	 XqwhvHy6MnABUtZ1eyCuhYX1hbSjxYKq/I3rZYet/suLa7GgnyDTKLI9TwKx5pvZqz18Z
	 8pK4It6lsdqOnctFq+/tgDuAq89A+94WlrvPA8Z1ZrehlQWBW25xwqesV2adpk2jL7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795156661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fEz9zrGLupRQomsKWog1FBAsxiM2XtJa6Tvmb9azCvI=;
	b=VmqIYK1uQp9QVnYcWD/35tJ+xbhg7opFinefz+Cv43vJQWEF4j8UFhmDh6erDpIk1O1n
	 18PZSNdkjy7TUID9V+jYngDEH6pmNVR1jN8Di8A464Dx20tHOidWjy1dcfqY5rIErjrGL
	 3tXjwHfuWMh3Ff43/8otXQpzcCtDfJtq9D6LeovSuxy1cdsXf5jhdbqJQF971Yvp8LjA+
	 ObjI3zFEwWO6VfSA6i5UyI+0DZQ4gDCrHwXQ370PHxGK6ggSskNynop+ZVpbuLKC6FEcJ
	 EHnZObhv8mnA3A/v+jcnDIn4Ac9nMkmCjab902dZnuisv1bwnEoXnTl93SQvs2wGZDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795156661;
	bh=fEz9zrGLupRQomsKWog1FBAsxiM2XtJa6Tvmb9azCvI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z653tDwoT8pLpNn82LgUfXLdgB10X/Zh+1Au2xPf67qGAr6DOjjhcU8ZE/2T1IF0o
	 mtAscOyBHcm7icUvEVU37cxkulVNiBn++/Za+3ccH6cFBNVpMIC7BIvw52u17RTsIm
	 eZNLPw6JrsOq2u5IuITPb2Ax3WCaryqa9yXc/K8vUNnkNEzCty9AcE48DaGQVqxIVh
	 0PkY1232VMlPVIxQXU4XiVSULnNoFDrgup3CKQKnj4UrwbMe0cD00t/vESiOP8qZ08
	 VSsvX33mItkGyuNTwwoXujnsrkwPkRCaSC5vOet31t12Vn1Ezt/9m3KvOH4/1bmMmW
	 udSH/SdQtN3kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE2C40DC1;
	Fri, 20 Nov 2026 06:37:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8D3F1C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A6D26072A
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxcEvJNXTfX0 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 06:37:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C0B1606E2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=DMjoqFor
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C0B1606E2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:37:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=DMjoqForsyQHVTvA+R/I/twOVRtdiSePPdaxEcDoev4gGxOP1Y8K6OP+UKOaNPRNZju87S14g4LzwJH/0gi14W0njKrZ1wa1YTQlsnEbkMISfRzHbmyzKMRJ4i7y5SKgDab8b8XGyJJtRIK9ynT2zVMg4mmir75Aw+JoV6WBvjLqsrBMGj7/jAkwlLb22Pk6APxnYrlWWcJkST/GwhREkK0h/c2y8l9TUkBPHM24Q5skrVJNMqIvQUvv55ijNtaB5sydHHAtd0I2bA14WJT5KpMDJQTN072MEefSmuMFjFh/72PopaO8DXWZRO0KJa2pteLppGhYCp5ywPWKxxo1uQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=7OVDrlvLe29ju14mglcnz6Fo7wTXDTw7kTShEc4DlGc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1272063901; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Nov 2026 06:37:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xUIFX-00000003Qa9-3Sks;
 Fri, 20 Nov 2026 07:37:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <3ebcdfa3-6ae0-4e41-9a68-005eeaab9385@bubu1.eu> (Marcus
 Hoffmann's message of "Thu, 19 Nov 2026 23:31:36 +0100")
References: <20261119160005.628790-1-peter@korsgaard.com>
 <3ebcdfa3-6ae0-4e41-9a68-005eeaab9385@bubu1.eu>
Date: Fri, 20 Nov 2026 07:37:31 +0100
Message-ID: <878q2ouhxw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version
 4.0.10
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Marcus" == Marcus Hoffmann <buildroot@bubu1.eu> writes:

 > Hi Peter, Julien,
 > I'm a bit late here as Julien already applied this, but there's a few
 > inaccuracies in the commit message.

 > On 11/19/26 17:00, Peter Korsgaard wrote:
 >> Fixes the following security issues:
 >> CVE-2026-89078: Double Free issue in Regular Expression Parser
 >> CVE-2026-93577: Integer Overflow issue in Regular Expression Compiler
 >> CVE-2026-97229: Integer Overflow issue in CI/CD Regular Expression Compiler
 >> CVE-2026-110264: Integer Overflow issue in Regular Expression Compiler

 > I believe these are technically gitlab (the product) CVEs and do not
 > apply to ruby, even though the cause and fixes live in ruby.

True.


 >> Heap buffer overflow in regular expression compilation
 >> https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4

 > Typo. Should be
 > https://github.com/ruby/ruby/security/advisories/GHSA-3p8q-wmhx-vm2w
 > instead here.

Ups, I must have cut'n'pasted the wrong link.


 > Additionally the github release notes for 4.0.10 call out:

 >   Update the default gem json from 2.18.0 to 2.18.3, which includes
 >   the fix for CVE-2026-33210.

 > And then (as far as I can tell) there's another CVE hidden in the ruby
 > 4.0.7 release which bumps the embedded ERB gem from 6.0.1.1 to 6.0.7
 > (https://github.com/ruby/ruby/pull/18282) which fixes
 > https://github.com/ruby/erb/security/advisories/GHSA-q339-8rmv-2mhv /
 > CVE-2026-41316.

 > For these last two we don't actually have any good way to track this
 > in buildroot in general I think. :-/

No, indeed.

Thanks for the review!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
