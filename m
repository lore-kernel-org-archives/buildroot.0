Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF8606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pGen6sQO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=CxC5mvh3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0175C40776;
	Tue, 20 Oct 2026 18:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32g97Zw39Uqp; Tue, 20 Oct 2026 18:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1FD3640688
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792521273;
	b=svyNBLK+6wIQEYlNI1DRNYEB2Bu0pymxsESMN0DaEegQgckTyrZwGXt8cMOtyvMckANq
	 0NXd4ffZuILpMe8/6VvRWKOy5W8+wOV1msmerzboataL6w7oYI0nZ2y6mcMIAFDzvC+lh
	 5Un8CcWxuJP+68yjaxJlwfbOtTb2jvWyhx8xT3rltzVBbaGLmVxYTfV6qBeZ8y3XzrFAy
	 /eUB8Z5kLWXO/8agVBaSk390wG55PN58n9VD0e8BIevlZNFKglaNdExBoejrxvdh2ypEx
	 VyQK6c9NqjdQad/PHS24gE3lgvZ9rP4+pv6TwrAJXpo97wvxD0jtzutXFqvDvgjqKpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792521273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DUWYrGZegdcvLsGA9PTySr2eDP0WUfU+YMf8S6G039I=;
	b=ZfuI3wrbwTMipdfSuvJK4V/LkGJhU9k3mRlq4J0IbO98wR+JgfMliRAgERSk3yeyOYad
	 yj0Svdh3eToFcV5FKiKVfXCIaSU9mHiRszjgva42n/Jnb2mzL+IHKWOhZUm5Xu7nmBzec
	 ESarOkKTvhAKvtEQc1k94cj5XlhXCEP6weBhRgTAJhsPYI2/Nkjr5NaTihpJy55wryLcO
	 IjQX0uhWGJctwA6ltme99XOu0dCdlCHx1xoj6Unvvqf7yCVNSTsY+FfoCf1zPp+wjJlfP
	 NqRCH+gaLguRdouvogIE2kuS3LpEf2DRuAAU10t0ExqyfJdZ4ViLpwMH3HC/dMb+2lQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792521273;
	bh=DUWYrGZegdcvLsGA9PTySr2eDP0WUfU+YMf8S6G039I=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGen6sQOufeL2CnZGOthPfduKEG0pxkKLmBMwlVVtY0xOoLk72tDLzh24sEla200A
	 wZ5/2XOa5CLKQfuh3ouSO8T4lOk7BoHst7fNDLWSC3btybgi24nB17kFMpk9VZo14S
	 CAeLpOv9m3HHSFESkrZvbogrCD2FEnS/pg95ndc2GTJ+Joxh3Cf2ouIq2c4rgcylDu
	 t0ljdzK9w0kKC2Jui2QnVTqc3fOz7HqtwUu4E9EciaP0vGZA2Qz24GQONTn6x5j7d6
	 WnAl5ohpDPn6O1L6138m2thKQ4NbseDtpOuQ85qc3Fmlk/+nkRxWU1CjOJ2sU2GF45
	 rzwUQu4gKr3ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD3640688;
	Tue, 20 Oct 2026 18:34:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEA99255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4F1E80E12
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3c8yDBvDFcWo for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 18:34:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 824E5806BA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792521270;
 b=cVTpOFjldDfEc5fqxI00IkfcsPt3x0waxClCvelznRMM89vLRflLyYhsFozJHfXGGyyW
 hYZ9lIIlNUoGQkKabKEsN29NLCsPD7jtRqmpXAhGbwrj4Vex0dyqInWx+g6Zec9qvssgS
 SReQHKP9ZgSr6yiwCDJoPwgVi5KfY6xxKs1KJVTcYfW7lTLkTChJj8pAwmcGcgEhZZS8k
 whw0oorbWT3ZdeDYzM0HA1PTuedzQAZHTs0vC0DVtSJYRNjV0zcVuVwSNvIbVn5FCGU0b
 GI9YFOZuqEyvKC7CvYt1p2okokC0ywsvl7bmM9vPwfeZgNuGmQwWDofhY+42ujMCBEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792521270;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=6LRc39mztazhXy4IggnUtPd1XJ9YDQkJdGFwwwCuzF0=;
 b=ihYmTc3Jy7mgmf2wkUH1bCHGzoIuReelvn6vN+rycIujUzJFIef1Ks9Fojk99mERfZ0v
 bFKDBtSGa70KT0ptGbmQ9sFoBfcZdeSyvqkJAbNuUOuAysqY8JqhytSmHxWYegF77Y8nF
 /QTNsTfxFZIooFzO/sWsNwxSpxEXZkKUWDioCRHvPWYA+1NptJpweJx1IWVwPtiDfcR7C
 4wLgLnBeNWOl3IHhIH2oWvu7mDtgkKUVVEFDMFH2VbItT22F4y1Zh3JbgN1coxLH7LwDp
 h+cbhC8QqgKPuBhfoDfieK1F4d2Ep1QrRhULjw4xo52WoH36I6vzSknQRwcsu47rLmw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=CxC5mvh3; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=CxC5mvh3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 824E5806BA
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:34:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=CxC5mvh3MIeqDY534lq59pQaYpqfjAZOGOekpXzFPbjE9nsKVlx3ER7igq+6z8X+pcWdcCBBZo7JPOWq68tCPh78hLF4x4PY0fvga+V+nXw1gUZ3uiqQqrNWdX1VYp43Ig5q2XKLzxU1NU3lKhah2tHSPX6D0Tf/9z3iSRhV+WNeFbSInKCJaFFWHf6Qi69HYqVSjpb1fRa9YMK8XG54MSXQ0444MqfRCfBpPugh3bwfqQWrSKQZLE+HZBPAybvyXX1yhD2OO6b4rhYL5tpVHimyjEBHmk0baCXNdJyjs5TVT/yN8V36ByFX+8wAd8xXuIQlUJXfJuWVERci66JtZQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=RdNZR7zJ15f+pquJVBFcWvVnqoGLlI5F3yMP2cY1BxQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 478325642; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 18:34:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJEfB-00000008J9L-2smV;
 Tue, 20 Oct 2026 20:34:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Francois Perrad
 <francois.perrad.86@gmail.com>
In-Reply-To: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 20 Oct 2026 14:06:44
 +0200")
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 20:34:17 +0200
Message-ID: <871p9kw79y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-hare: refactor build command
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > In order to avoid duplicating the build command, use an intermediate
 > "target" shell variable to store the make target to be invoked for the
 > build. This is in preparation to extending the build command.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
