Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4244606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YN/kbMmh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=rgkEl1x7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8791B812E0;
	Fri, 27 Nov 2026 20:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FR7Glj3qKB_T; Fri, 27 Nov 2026 20:55:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A3DB812E1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795812939;
	b=MJrXgVRihlM+D9Z700wp8KskGPzv87o7uWqKncHd4sAw346PXqLmG+cmGcR/c0l33xPU
	 3lbBdRZcc9QlVw71TGxC7fZPFvWrmnUt3KLpz4oHAOUO0HRI5EYJ9qdQwCkkNpSRkxPnV
	 UQP9MtdOi1pwSeVpg7p8L4sMp0lP1gNsjO7ORMZ8n+uSfdfGSgyhCx0rxEWbUrS8NZVQs
	 PRy9Z35cMDfrGRRP/dOUhFTFGi7bAISyAiLTWuBxVcY3coEM2yP89ycoR10D7Hg2Mv9NR
	 Rzs9FcKVAPpewIlEKZn9Hi7kB56mvHpKpC98wQAT1pWTlaW2WQW0unHP6Dpyb2c0wDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812939;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=M9FAl4UjErY38uCglay/KxNjCXq6qnMx5r68rcEqFKs=;
	b=a1rWdDsezLEauiaRbGK1nYA+MWS0z1WB8WxVaQ3gVnkoWlXmOtAaI1eteuYUroTl/FHA
	 dR7CVTIHtODkw429aK0h5psV29lzf0KFtQby6C+J/ZiDbU7VqRaXZ+XGG/yPrZN2JtU3Q
	 m8KzgCJxcON81k7zvkbMq/enuiujGiuIcMAY02TC8u/j1egwl43eAAJ53aGD2jylVW/0l
	 J++x0uN6VJYTK2+fkf24ZhIwmIXJ71cxXtonnxBpx10o8Fvr2+Ic1cO2N91AjHrNUZIeZ
	 aVxufLsiMuaFgLfScSb7zwheWh+BeCa5IPjvvBE/o5W8STwi1qmE1wa4DRd1pProFng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795812939;
	bh=M9FAl4UjErY38uCglay/KxNjCXq6qnMx5r68rcEqFKs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YN/kbMmhNlh9i5Ey6p/LFkWix08FKPkatBAVhJi+2RxHegq9lVAUfUOPrI8PPPH86
	 Rx2zY9wxXE5qDSOGTmXc0RokshKtGBq86uG49i+4xARgG0fi9fILIviF+0KBw4WJJl
	 frYzTJx4IgBsGvqME9N/TOzULMJE/KS9wxCluph+KxClYW35fvaW/t273bcJkQXvpq
	 m+Gt9TjZPmwcLAmj8yfPeaI1AZ38ekSXtc5eG0QWGyPr7WVXIvXl7XU86V/+GKZZEN
	 ueeudXf2D/BAJ1i3hGSqgHhMPvRxK06rLrpazuxgp6AWwwGx1lnzarWNTp2M1HG1Q3
	 eYom6S1RCJMKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3DB812E1;
	Fri, 27 Nov 2026 20:55:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D39D2FE
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 20:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89DB6400BB
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 20:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7r3LLRAXX_cr for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 20:55:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 901994008C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=rgkEl1x7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 901994008C
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 20:55:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=rgkEl1x7ww7UW53Ikd7bAfmC5xmShZR4Jy7jjegbD4OtCikdptIAIu80ZwS/wwWL8M2b3YWUfHIgE8CgGJqyif+c4raEE7OMsb38JWJB//uZR6n+7FZGy7ASAoUCiu7CMhKrPz2m47SNBAn4vh6MbivfuESLTVym1/xfe3aEVJ1lCFnCLhxLVc93mb0xX5V43A3EEPakKpux/5IkB9VwV4Agncj+hatgFN9ZT+jr6773LeeFhgET/mpirrHkjnQ6M/16nJ1SwhJFh50DtXl/MNrzDKmVURRx52DExLWnyr4l726WJapT4sC6hUBZgtHeelEaHnxw4RbvPKPkOUrETg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=iizFcbgmkvuSMehsQdR+G1OTstlj9r7B/6vHfpADRt8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1496431018; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 20:55:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xX2yh-0000000Ex2T-2Fmr;
 Fri, 27 Nov 2026 21:55:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261127150716.2258686-1-chakrabortyshubham66@gmail.com>
 (Shubham Chakraborty's message of "Fri, 27 Nov 2026 20:37:14 +0530")
References: <20261127150716.2258686-1-chakrabortyshubham66@gmail.com>
Date: Fri, 27 Nov 2026 21:55:31 +0100
Message-ID: <87h5h2f0zg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: merge duplicate Shubham
 Chakraborty entries
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Shubham" == Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

 > Commit 8ddf1d864770 ("package/zstd: add pzstd support") accidentally
 > appended a second Shubham Chakraborty block with package/zstd/ at the
 > end of the file instead of placing it in the existing block.

 > Move package/zstd/ into the existing Shubham Chakraborty entry in
 > alphabetical order and drop the duplicate trailing block.

 > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
