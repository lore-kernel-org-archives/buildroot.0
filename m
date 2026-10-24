Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FAF606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=It+E8hmA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4517260A82;
	Sat, 24 Oct 2026 13:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKEWp3dIFiaT; Sat, 24 Oct 2026 13:23:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5ED3A60A59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792848197;
	b=kK/l6qHnPbS/zXVhhZ+N007mFhLyP4WlIeHv2OmuXtQygw03z7Ji/YYvdxGecSY48WxK
	 hNfpojQ3YkLVgwu5p+5xkV0JaOWxGGubwYfg2nDLJlIxf8jyH0JtLdlw36Rz1kisaAQ2X
	 AACwpYk/rleE8yljcuigb5/3mMCcH5sfK2zx59eQXuODZ2FOAYNm4MJIvBTvyZyif4EbA
	 VOLmWiGdjOPj2h+8wZNZ9FN86gXvX47G+6EYvGyAqWNywK4nX0LTTI0jbM4yw0rJ9Z94T
	 EpXvdHon11p813PSLV1thjrIq3tpyvsXy3VlgLJ6vkELwEW2A+Uwa4nxssc9AWq4nYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792848197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=iUlJUmIz8eEEYTpUm7aTAXRQ6s8BvAlYWIrsWzLH+L134RtAFBqctVurzBO7P3GF2x+T
	 6PrBTnNsEJgnVyqwJrLFxwt3J0znljw10O/i/JzvONB7tgEsn83XJveQc4P6ic7vNEo2H
	 XJe0ukZjYg55I+TmYzyk7w7DogRzd95MWjKmxClFs/FvWYyk4pWoMHs3aW65cafUuwLeP
	 cFVCdZKwiBJc3NCCJclzA5kW2XKM5rse9JLa80zeYDjB02cuGPUaIPDULSwCo4rrBs2zB
	 w3dvF0+d1+HWEStGl/Ryzx2uI5w4DB9gRW4vW49R3roRggC2aKO4Y4QPHIdnV2JRFpA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792848197;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=It+E8hmA4sKBfna+jZ/yeMheFRHLLiYMS4V/x5n5hVAdKtZHavpKiboHPz/3qCVEa
	 a+JEBxu72pCEFDNhLNyzc0I5X5WJZgPxfwvbCxkLAJAcrX5xuJ1uCWBSlQBzabtsSc
	 bygCyZJzKMHy9YWp78Y4aEx4PPRscHyMkTZiG5GXDPIPuWHedvFW/u3XHtS4LafNJJ
	 WoFKO6gP+JDShqoO9RayvBy82IZP4KwtOAEPM5dTMCROeIBGbnKobqVCaHYsYcn9Rq
	 AN5ynqmaXWp2v3aDFiZmzYfJc6v0OD/W8YXofl3COhwAacdvRRVbuja2QPt5UwZjjH
	 l5Dc9ybnkvUZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED3A60A59;
	Sat, 24 Oct 2026 13:23:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5BE8380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36A8409E9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJye3PzwV9lN for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CF49C409E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792848195;
 b=eKWwoe7VJDtKa8q+KVKkSSmfkPSXDv34NLbfmHmXoiTX2HQXdsBLnAXUMpg1DXt+QZSy
 gMcBfcZHDtVaZjjrMmLATms2l7hyTU75vOH2GxwgTbX+mabW14AZxjfpxhbIbvVxFfxw0
 Sps29WdQC1b1eTwRGW2MFmFoUp++J6WR7NUUpyWG489EBVi7toGicVJs7AfsQCZGFj0U4
 3TOO5wQYfHBtExkK9uJ8xnrZvIg3v4jEccPZOfLTOdmFeBH2WwU4lDr4ZDL51rl7uqHuY
 KrbNb1QkeYiVzJA4A0UASZTevAdxZ58QMBODe6UW8rKWFqGlrGpa0YJDYQXv/h2moGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792848195;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=J1mFzJnZ7F/MNNiAYIFABOkOFDk2212IsQbe4udRqgp0EsxJRIcHGDsDjZNA6ayqZFg9
 7jzf7lqNDWtAvE4NoEle2/jE0lKCN/jRBqh5EK89Cxdzi11uWvhYpK0Zt2YznRhTp9BPE
 GuihMQO9nMXgzv7V7D+6IG41le3hnxLgT8KCM2qTUsGLFg1dhJjMG2F2B2F22IMs4fD7S
 9UkUPZYDePqlH62ImRC5bk5m6JBtCIjdwbiLtjLAften23laCLaScQVPmk6kaZWaw7wKG
 HPRhgHm4AVyRFK5s4JjGIFqVN1brTPyF0GWn3so70359I9fPbUuo5+hunEBBtMHHlXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="LpV9d/Rc"; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF49C409E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 21C86B00548;
 Sat, 24 Oct 2026 15:23:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 15:23:11 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 15:23:11 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-10-james.hilliard1@gmail.com>
References: <20261023181818.920329-10-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <6366ebd8d94a1d6da27b628606134999@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-google-api-core: bump to
 version 2.43.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
