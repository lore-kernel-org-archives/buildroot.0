Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BCA606A337
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OoeAFWmj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=YCwWsmI0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 723216069D;
	Mon, 16 Nov 2026 10:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEMj2xpESfFs; Mon, 16 Nov 2026 10:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A8C2660666
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794823557;
	b=W9xoMY793vtt6VW1d9yggliD2n2Xz0lyQ0ZEKMSbGdxt4QALW8fcvFPJK/EQtUX0aHiK
	 GZyuWaKziE+vA73NGSXbb4OElvxRfVGz4RVAbpaIFiv4jPK96zZzucyPHusRPehBQK6nD
	 6k3kzqxrAvJv3Mrnp++o3GnnoCMJBGmL3klakAA4iYTfYcS8xiJVV7uOBWvdgBwHvqZ8M
	 QE61O842Q9zBlrFAU569agZOmOsHCzB59AOgoKNNIXuZJUSyqLompZyHQjCUaj0oakdeH
	 SGLOmNXpeHwD3tjs9oFnurP1zoERjWin/QLHGsq+4kZgXTJHkswUisfZCN0KsC0gusA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794823557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3W8zFPA322PV/jy7IUTb5cxQW3XeGr5BibvNZUSJbKM=;
	b=Wxk4ySuqItolKNa9ho9vAR7WHSytSrRPzqHz5PwkEutfJjWCLGYHRIxcQAciDYVmCeXd
	 8ZgKKGOFttxCXylucTwc5jmNKG5VPGDPWSHytjO2mIM28ss/z7yirQX1emwuz18wLmbZC
	 nBB6bZNsHBBcww9qnsEYW9u+r82jErr/+e7qYt7eX8rQJLIw1+d3vKEMJjQUwRZH7I8mI
	 5zc5BabLxGdI3NBQnfm1ELKFERsp5izx/IHEDyQAQzJKqjsLYiR7tlW/agzwQnT9Mf/NP
	 r2EF0zs4pYJGszAGjaWiv/68evIBh9snO0xVp1q+LZXkcU4Gr1O8SHa4Pr2Md/zIV7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794823557;
	bh=3W8zFPA322PV/jy7IUTb5cxQW3XeGr5BibvNZUSJbKM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OoeAFWmjO64P6RmRT9vtEA5YXGJouOkaivC34hXdP7Z28wW/oaD2+jDPjlvX2MOO6
	 N7y9mGxPNDGX/hWLlBhHdscLojsMZ+jS8J7xoUebJp+qmDdrzkA7HUnghJDN4I0nQG
	 P8jOU6WXOAVuIB6wjEF1jksHirVkiEXXPzRSMkIdOHPxAQ/4UXjabK5NRqruvldA8d
	 stOem4p2PMQcRAB/HKjlv3sWnnZI7Jjvn1LJAFxYpXqV6LlntK5CCmLjJozTXqyEL1
	 06W4lsnR5ZpdejjKr43WZNo2SyqGQ6Jb95weWyitdyU30JhTqwZdJLmlUKTA1DExw+
	 addmrL3h8ngmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C2660666;
	Mon, 16 Nov 2026 10:05:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6918C28C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7ED4009D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtKqqqFvi2uL for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 10:05:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 870F340012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YCwWsmI0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 870F340012
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:05:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=YCwWsmI0heymxbfj3aCBzR3mhvePCiITIOvJRY9vvHUvcmqv1h/Qz/8SQF6Q+GsxHI9b3KYgEK1kNFpeXNDDT0TSPmVQUfYYuG2IOIJKuc6GmDptMlHYgjCNXQTwV/ehTTJwh+KLa4EzpUixFot/CU0GEleg2IFnVcr8AXn1NzZEEqH4lQFnsLQWKpORg0gz51i+tR3qKBoQCL7qBNsEyP+xH51K7jmO2DUNFyMkfjRTja57g+t0iBzjJmxX5+fcBm699l2ya/iZME8CM+3CvcLZ6EvjQbdnPrfvkpgPtbJpkqqorE7raDW3NhjKaVtJxxnETC3rSxefolvPnlftoA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=PtFmJ9tF0nFZGavPs0OxrHAdVn2fYwkBhYPVXoRLd6Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1008659469; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 10:05:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xStaw-00000000G7Z-0FQk;
 Mon, 16 Nov 2026 11:05:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20261116092519.279386-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Mon, 16 Nov 2026 10:25:19
 +0100")
References: <20261116092519.279386-1-titouan.christophe@mind.be>
Date: Mon, 16 Nov 2026 11:05:50 +0100
Message-ID: <87se111475.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.10.3
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > From the release notes:
 >     Update urgency: `SECURITY`: There are security fixes in the release.
 >     - Heap buffer overflow when propagating a `PUBLISH`/`SPUBLISH` message
 >       larger than 4GB over the cluster bus in cluster mode

 > See https://github.com/redis/redis/blob/8.10.3/00-RELEASENOTES

 > Also, remove patch 0004 which is now included upstream

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
