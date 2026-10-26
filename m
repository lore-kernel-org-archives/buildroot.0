Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A5460A2611
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QQjTR2jg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=isQqI9ue
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E7F980D58;
	Mon, 26 Oct 2026 10:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28KhemdxvIWw; Mon, 26 Oct 2026 10:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9ACFB80E25
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793010789;
	b=JTXOOLKdN+ulTo4bj/dcF+dVdxnsCPqzwC929kbtI5WBHFMBS6CrWPhDhm7up4relSwb
	 /+1y1UGw/7oEakKOBPKZWhyUkgODjInm9vEWwbULNTiNhRd4TKqAwHkmu1qLGnLZLi3Vo
	 9Dx4E6e5UPZsglBQHpgruGOKyMSE81DOu0SXRBPmEGR1DT3RPhyHxYYCGNimYnVX0AKNM
	 cX6F26HcAj8KBJpEZVtGdIVcbkolWypuxK6YJVVb01eFOegUqnl2sg95/tb6VjJcZHYfG
	 Y7fMxwIDRADKXdTghHeRNCbctZCXbQJ4nB2WtKXKk8zsJWKIY39U11j3Or5eFN8Xh2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793010789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wYJQfA/+WTj5CTxt+idbue0Z6vLSteTis72/LhXc+s0=;
	b=pi72iz8QmASbBWXKoP0fT9f96lUJOVHPLrlEhyfxUFnqSD0NaDbxXxjjU4yk4tzO4V5Z
	 5OfN9IwZHKcN4yY/p6ZrHetp4YT+X4dQl0BpQvWP7JJksotggCrW8fweV0faKn2mnvvIp
	 PQtejPlJAW5b2SlKToZNxMdmTpu/e5cg58NAbQxYVMdBk0KDxvps3LspkDfZil3k4imHP
	 vqc4zqk7KsKiFvs97bESeEKnHHaCO4bta0Uz1pE8/RZg8DBtfq59JKAj8o7nW0SWhJYFO
	 xntnDCqzS4ldaPtNE0oQlz25giHH1r3792G0Yz/T95nZ7OIquW5vj+SjzE2RProbIrw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=isQqI9ue;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793010789;
	bh=wYJQfA/+WTj5CTxt+idbue0Z6vLSteTis72/LhXc+s0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQjTR2jghtlL3aZ8xXkim5Zex0Ml6KHnP7ulHNIj9rdSl+V9XOqzqRU1IS+pz95jD
	 HRQsn4ob5zB7meiBp6CVNnXgrvrXyMe5TDgt9zLuL6N/UYYab8tp0k+FNc6zd6iI9x
	 zOMTtEtFev99t6rLa7/0Rs0D0+m4I/e2aNH3K4/klXYaV9SlVLbm0axlIBMcuye58U
	 ha48kU9fIXOsTy9dFj14C3rti6v7FPk5WVIH1efyzA8gyJxlKt2pi3tO0Uwj1YaTOf
	 OzHQJGv9XuqS8a+SU8jVK5uddbFVQ0Q+oP/2drJl0jN7MTKYxBryKWx3MyX+BYtuUf
	 mVjBHM/AArwUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ACFB80E25;
	Mon, 26 Oct 2026 10:33:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BFDA43
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B5F80E25
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zhSwCE7I2pB for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:33:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 357AB80D58
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793010787;
 b=GKhWcpLePr6Dp4YXJiJbCvib8zr4FJu94JT/pIPn0glhBTthd3hZbcurH5h/tcpsL9LG
 p6ShnQM73g9T2g0i0LhNP5dmmgxEwMfP9D1nSyYrOvpcQsR8TknxGjNGsQtQqDZn3Fzue
 NW8ofh4b6vZOu8f9muOIGIcuFl9FDma/QUH95CBIo0WPTO5VF+8vhhgLoUKhnWrP5WagR
 covLBnUI/CabnAWS1pZFBLNG+pcbz9pgHr82zvntlB1g4HaxAkXYykUGDOjdTBDesNxBV
 n42LtlqZSpy3SzhN3yRzE1aGn9UDF/VZeGyJZjc7uAZV2JnQRh/rsaH5lBvJnToZuUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793010787;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=oFQHJKZ89mgZAkvLfzQYTyIGaPO3VLHLjKN+F2ony1E=;
 b=dHgOis0gNugTsvK/dHpZUXpyMdJPG6Jt5IEeL8sEl+LXN3pG0syMntHIZX+m+RCq6KtV
 ObHIu/zNGmCQn7ATR72apPOFjDjP+KtPkxeY4jNTkdqrGQE6Is61fUWLhCtB0L43Epw8t
 xUnou+Tv1vMbiwJs61VMsfU7bZb5KGXAsLLSKHxMUvfTFox1+oKYuhR8C25vum9s+xc/n
 QEPx5CCZ7jTL6QDji0q4qYwwiyhbzoBFisxtRle68CLLRr8SsnQqrwSiBTcQVzkyC/0M9
 X+tJkd7YeuPflnH4pA0evlUKmy+waEOcUafWVXg20K3rxwIPmLdS/yDATbb3dacl75A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=isQqI9ue; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=isQqI9ue
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 357AB80D58
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 10:33:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=isQqI9uebvW2C0eY5cq6ekDDe2u1haa9Ty3DbxMdkUxlmUcJF8vL6ijwh46mB0RJK2TNxg0GhICt+/KaJGAzJ5H0+8Ga2eT7qb47FaoWHiXbXuxSvlGb66GHJoVqAKVaDG8/awd55BNOaMRncYSKYlfJFAWTWNmDfeWVvgvYBqu4kTYIx3qg+A9q+JyDqDXTK9QdYdWXxZywxkUH3VWZw2It03eMF4AWMVl5YcFRiKpcYqjtGkXLVD/px94J6SHT4Hiv9AJAfB836weEnwPsYSepjJkx41E6woheRs1UqS4Jpe3ptRRurh+/JTX4Mmv/3GC6rFvm57IeicdAUp0N8Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=XWf/QRBHK8Vs+YRDg4wGdzgFROa6MDdqpV5nw5Jg9MI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@busybox.net
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -193068895; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 10:33:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xLI0i-000000088wd-35yV;
 Mon, 26 Oct 2026 11:33:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20261026091518.278320-1-francois.perrad.86@gmail.com> (Francois
 Perrad's message of "Mon, 26 Oct 2026 10:15:17 +0100")
References: <20261026091518.278320-1-francois.perrad.86@gmail.com>
Date: Mon, 26 Oct 2026 11:33:00 +0100
Message-ID: <87bj8g92g3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/luv: bump to version 1.53.0
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

>>>>> "Francois" == Francois Perrad <francois.perrad.86@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
