Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF329606A31D
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 10:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QAunXO6+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ci0GdcGN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF1F6061C;
	Sun, 15 Nov 2026 10:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEnoIXVGaoTv; Sun, 15 Nov 2026 10:50:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6292760634
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794739855;
	b=ShwG9aQUTSDclgyvYnHmSAPSKnSZ0bN7v0tTjF+FziqSKNDKrdaJHXqcSxF4KijPrIuW
	 vCXoGbK8P56N2AfDs0KfATWtTll83laTGnsimcMftI5zJqXxWAD8/I5vg5cbtvgfaFlat
	 GL22H7sPtsDN+I4NHBMdlcRBxSaW8C7fJkneRkIo8pNTjXkyywDKuuqAg8WdeMu9Om4CS
	 YRp8OxpZ8E+d1AOeK8Jf7K5GWWM2X5yi0DP2KTvrEmtnreLyP+yPxqnzql035Vxvm3Jb3
	 7hMldWKcDjgs776Mz/k6btoDw9qeXQODr2SR8ff8xfayfC476grt0LlKahXVVMWSF5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794739855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IPV598Ztu4uukGRXX4VxSGx23q0Ebs/tno+rzUnQ2Zg=;
	b=IpfmGvrAycm19kEtO01Fu3i5Ov1SJCnkvgADIGpfFSfkdVvHjeNZrthtRR9bb+csmc7Q
	 4vT6q4dvkBd7eguZDe5BCExuwaeh5xm+1twOKJDnX4NvJslwDHErDE4to5emdSxQOUhIR
	 PC8bHd80XSSoHJlUqC3yCv03QcGM0kF86FRjjND07aJ9F4Dbv30pFhOvRYtBx++azha3/
	 RH9qGFMte+kDMnU3X/H9Jqhrmg288ee8nLPAsvIXBtQEhLd32n6MT7GDMcdaLP19C3uuS
	 fxP4ZZy4RiUGK9WoTvxXqpuvRO4sjjAwDW7wN1KE1yrEoGOEEBZY/47+ELRDHrO8o4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794739855;
	bh=IPV598Ztu4uukGRXX4VxSGx23q0Ebs/tno+rzUnQ2Zg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAunXO6+L/vh4ydG0tjBRuSfeuTm9yLR1J8ED4k1nLmH0ehfrwjCp2pYTLcSL/pF7
	 L0q41eVHVcs6FDh3ILqPTjdtZ8zWo6oEoSTM8QYF7Qk8Rvz61GVhNKZXRM1KSgkTB7
	 NVVO3GghkCHvlYuAfhe965DVJi6RDNBM7sDom/G6Uc2YX9NQCufUkmhIJtyPNecDe8
	 nnk2vGBgOTe189wUECW6dUg7pNeOI6qnXdz11JqSyd/3CJjaV4h0Zwm9FjAK5VfjvI
	 /IVK5AnT06/rZZ+QBf3AxnCNXIF89xzDOo2waX/Kgrp2FzB498WGYFWy00c41gVhLg
	 6IOtjk868YBNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6292760634;
	Sun, 15 Nov 2026 10:50:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D89262E5
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA64940653
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1w_8peapWXC for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 10:50:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE36C405AA
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ci0GdcGN
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE36C405AA
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:50:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ci0GdcGNsuYoUmVIZ244i934vUJLSLou2xW1UGwT5Afl3MZu+awGHD446MKxTOOsXySfXe9DWZwp4AItBmT2hXlqFbH8knoVC+GMuMIszjcEXScZBGXXt2ssAa0dupHVQouk5MzcO4xX2GIiwl1U4ZXvqZvhKZPmAHPNXtMAGVeoI+Gna30l/EiODfv0IYfIYxp0s+JF8lMZtroMh3a4cKgYHTS12qDi5jnH44KVwYFrm//rip0e4zV1/EZ9DIwsOFxLGinnb1CxQc/eEK2xJjGkN6rkkf2m3nYOiYn1++GCv4kLizBr/MzwQtVB+fp+f9Q0RgldZ+Vv1sfGBfor/Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=GHKX4tS4VMbJaJ0r0BjktaYK2iRuRKu/twhGI8OY7Mk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1211330403; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Nov 2026 10:50:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSXos-000000073ch-2Hhl;
 Sun, 15 Nov 2026 11:50:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261114210504.1551193-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 14 Nov 2026 22:05:04 +0100")
References: <20261114210504.1551193-1-giulio.benetti@benettiengineering.com>
Date: Sun, 15 Nov 2026 11:50:46 +0100
Message-ID: <874idi74hl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 15.1.0
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
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Release notes:
 > https://github.com/harfbuzz/harfbuzz/releases/tag/15.1.0

 > Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
