Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABFB606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qx7qwhkZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F9760F0C;
	Sun, 25 Oct 2026 11:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GYezdyGYP1h; Sun, 25 Oct 2026 11:58:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0555E60ED8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929523;
	b=s+9wo3epVh5xuzaZSpsyo6/UpWxhnm4Tvv7zpaVbgrL+whrQM5NHQ1AxqK1M5aiRhPfT
	 lMI+9g+dCMVMKvIH2CFEpUPZFPGR277v70qgcZdERDVk5wCBhyG0ntX4+SwvzHwMx/aXQ
	 mrYpXIaaUoJXGselnMkEF4WRk5Hc5VGhwEXjFXQeMFbOeqHxKyA03HXH++mKG1rdPS0hm
	 arxzCNb7a8W8kvM5ADmcRITjPGgpdD426M0WuhJc+qTuOdueml4Hwso4w8n+mFGUjyiBO
	 nOOY41lCJt2v/E1IBWOTJlm6+gkqXvR4QqyKFonANa6TSvcRi3AbkX/LkhLsYO2SXQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	b=NTwWFdz1o1lyY5rwb2Ta9RfiAhz+I+5FvqCnSQ7yigK8gNF6LWd/u/Ko11zlcx28Pfd/
	 W1kAVmayQtQyM7eex/IxkGVYm4Vo6fqwLRyn5pv4HctpvyUQb3G8LBtjRylam28gO7TG+
	 Vdq+Xj3MXn+drVSi4K0EzCXnkD1JstmB/A3dEkSytxBAIILUeNvXgar4tUH+DPIaPMOxB
	 1jrc3nhnUvJYKOyoJMGkugF+Iax4xwJz9cnXkljolEzUuyULIPIMhu2uihZuosUAAy9uH
	 vcYMll9pWmqzMMw3yD31BhZI56bGwxwzt3KbMIw/DIN9Y4C3cZgx+KDiu8O1m1r7i+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929523;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qx7qwhkZRcH4AeaI2hE6NGz9hZyGEONn6RnUpi9sNcOyHDUQRFOLaoDM2L6aeBAhR
	 7OOQjhJpEULxPR0QvcZeo3XI71ElAsXWajo7vaAMIJOYPb6HaOpC20OZuDxukmr/Nd
	 GDVDdOkQL38tPRw24VD7I/SZVvQ54JtQ1HcraI4gU0cm9PigJuozzLnFi7sAODjtS+
	 qLjov1RNgittOaumSaPfZ+gGZBVTJL+qaUszUDHsTW/3CYTzW+IAxOniW6VgNOAS3P
	 hpl5enSjHVsCghBKGUnf5hQ5FmZ452RDJpmHflEK4S1iEB2HqGDDvAl4ejYmmXTYPI
	 FHyb90RILHkmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0555E60ED8;
	Sun, 25 Oct 2026 11:58:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BD3B43
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7950380982
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCA90WprPVE5 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:58:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D2D628168A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929521;
 b=HxhkCic8Agyy2wcvY77r3M9hXmJh/Jjp2e5jQHh+0LfBMQrtQcA2+Zpf+N3FFYXfYJ0W
 1TeDIKoLAerDgcPLOyp3yEYA1El78kCG9EbzA+OHhHEMx7/4zK87HcsgJz0CumpuYUIjw
 6fOZLsJLYbSasxQFKHrP2LnzlUEb3ak6hcjzMjNTI76tOILcOFatX+EruoLIbwqjUE84Z
 VwnIlAEH1+mWzd3m6liLDb3Lhj4IXkFLwvZ96brvcWHEONAHPw9sD1HBAOTjJMW4D1PKZ
 yPqAInMa+ewSUZvF8uGXWK1N4a+TNQXs/NsxgeTF41mC6pgEOUBYmAWsrt8V8XLYaxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929521;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QmYn6d+L8cgMQVhMS55vMMzMU1676dDAG/CD+dL20Pg=;
 b=I0uKvbGX7pe05RAP3/r17Dp1zIzt8CqI8RiwXCUfUd6FINhUH6mjxMVftDDHPlzL2zHx
 i1hnlDMyaiCcge1a1KPhd/Di8xA9wjzk8IijmlSogpQcpiq3u/B2KTfbnwcmNgFgpvGqe
 EPNtS7cKWw2Bp5EkAwAsJl2iYubec8HuqaMANK21XRQO8SgLz7DbesG/Pa/DaCyouRrvp
 EzI7/6hjp1do2u9ZGY1IMvoLGLM87UG95lm9rXQaVuCKJcHpDdjYKDkW6xSbQWSh0SzUq
 2ngJq2QAZP1QhUbXtft53XWIGJCEkSiOptelXjhst6/NSzRZXNkC8OzoYSbteB2cYSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iJbgJlxS; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2D628168A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:58:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7D9D82003DD;
 Sun, 25 Oct 2026 12:58:36 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:58:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:58:36 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-6-james.hilliard1@gmail.com>
References: <20261024182913.1957467-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <269c0f9e40e3f3fba9d46fb05535e5ce@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-types-python-dateutil: bump
 to version 2.9.0.20261021
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

On 24/10/2026 20:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
