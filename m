Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABF2606A31E
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IsXEp7iA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=mZ4H6wdM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E52181066;
	Sun, 15 Nov 2026 10:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PPebwxhvLl2; Sun, 15 Nov 2026 10:07:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F34081028
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794737255;
	b=E0Ul2uTypMJc2UK8hI+WBmr/2mgqyayQwNY8q2ZmUzFEyuQicuVzN10HA+cNqV/SE3nj
	 FkUA3iU6GMbo3ygwQ8tUdvyMQZ9HRymN++XDWmERvEoYpLqGbg+PTIL2ALxYV4N3RjpKz
	 r7HPeseQB5St1HxpDsJQomL2J05CSVbIM3Dmjkg/Bxh6qrbnW/uNFFYUQ5VOYluUJMNaV
	 E3CO9LLg24zpF1Ctoyk/iJEdau0+aDNKChKeT76Q+op31pge+qhy5vI7hUH/mNhRpNCGH
	 LYUcv9aEOClxMiN2oAmLj4fUkeb+lep43msnHJEajwxi3eebnl3eWCyXPS9g2kDQ9JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794737255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YGp1VVkzsQoLWtb8Q+gpf+lb3VdHvCSchEX9Zq5IgFg=;
	b=rMPyIKPosoN8tohIeS7A8ixTSInQsdRuP0knQOGkQ9xj6BfAy1wZhNlT4kcx1uUnQ6Nt
	 Yodu/jZ20eidm4TUihKA5YLscvNKgLuTu4HIT+0iPhBMkaG3h4SG5RGL8EMf4LCR6mcPF
	 BaHYAidpoq2ls15EmYJEaWYklqLoo8aepySw/Q73kuLRlvGndJqyYaiqRAkNuxi3EHuGE
	 dbgImkNKgZ0kHGMBLC5hh3d5j9yqN/wcecnM9qhu3EfReVilBV8n3XcvB6YtmwirxX2ks
	 pr/LKJlPEpp8o3ngtHoGL1ha8FJCGSN68j+hzbVA1ZZBHGQ14KpSe8x5XoeWn+0SYAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794737255;
	bh=YGp1VVkzsQoLWtb8Q+gpf+lb3VdHvCSchEX9Zq5IgFg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsXEp7iAPYJfz1G/jzmee3/qaPKFSgneGekYoF5aKKpexiyKReqo9Qf/xgoJ7UIfY
	 Zsfaeo0aebM727uYxp6F6h6MuwztleLLG7X8RXUUueQlezFAcXIjfIYhJ/cEgzBjnc
	 dZiilOKBgJ6ozj2wax6soMnA+DsS2KrsnfzW5ktrXO1Ramvue5SEIV+Qw4PpEKwBec
	 7OSNwdaOTzLITbfvjFxU8qPrn4WHpo4jhR9NsrOtczE65mNiBd2Rcxu8fZ4zr1fjFl
	 WhfLAczJZZrCrkuZBgsyXLWXs+PEt4jwJ2WB4FfZC2XMHNidEEb0YlaiEnpMux/yAU
	 0HNOVXo131KCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F34081028;
	Sun, 15 Nov 2026 10:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B502FB
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FEF3406DA
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYitWajXYY7w for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 10:07:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 969DE406C7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mZ4H6wdM
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 969DE406C7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:07:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=mZ4H6wdMaMmfi2Gt2tkGNYdJW05882XyNzW3d72ykDy/bP0pf9W/Hk7CmdstVVdswqTz/snXhcDaAmrLVouC2AQLJa1RrTxz7SFWm41vonFvHxvhDcjlbCfMNXskhTlRYawwWKeLdIJfy6qG1hQgl/QBOjugmZj96gNb5msuF98Rr2Ne3XZpPZRWtnhdYnqXylXRtZ8AOqAaj3drJ7CXv5hHjJlX7rwvWeMsKnT7TbYkp2THvJRKQuQjiD6/0EwRPR7Q4LIm35IILC3G9X4WIPSuH7/GTHhM0FDSSg0XmoDNoqYi+Zy04SlxoLTrxa5rxOP8mig9BLo84TsJLFkmDg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=fUlCbyMWa2RvfK4DP8pdlIyR5XCZK0cyOKWvc9qAk9w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -680157623; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Nov 2026 10:07:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSX8w-000000070Pi-13aW;
 Sun, 15 Nov 2026 11:07:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Yegor Yefremov via buildroot <buildroot@buildroot.org>,  Bernd Kuhls
 <bernd@kuhls.net>,  Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <CAGm1_ktugsJe2cNGk_=3k0T_LCu8fV-=fvVPDLcTqZZksXi7Rg@mail.gmail.com>
 (Yegor Yefremov's message of "Sun, 15 Nov 2026 00:42:23 +0100")
References: <20261112100822.3298943-1-yegorslists@googlemail.com>
 <87bj7rg394.fsf@dell.be.48ers.dk>
 <CAGm1_ktugsJe2cNGk_=3k0T_LCu8fV-=fvVPDLcTqZZksXi7Rg@mail.gmail.com>
Date: Sun, 15 Nov 2026 11:07:26 +0100
Message-ID: <87bj7q76ht.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/prboom: fix build with GCC 14
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >> Maybe the time has come to drop prboom? It is ancient and is also one of
 >> the few packages using the old SDL (1.2.x) version.

 > Yes, let's drop it. I'll prepare a patch.

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
