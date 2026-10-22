Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF15606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kXWwVD9l;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=IGFP01EQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B3440401;
	Thu, 22 Oct 2026 11:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TbwH59ULebT; Thu, 22 Oct 2026 11:18:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F422D4098A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792667922;
	b=StBrTmFtb96EdvNVNOWqd2ju1IIcB/1Y46EDlcpL9d01N4O52j4D5jylU6YDCiYRDHTm
	 VocWrYevTk1Xs8TFG8hCPqBBhv82ZOnN+NGJMweLbuWih3bzTCoMfeSALotcDv5gOsNkm
	 dXxUmiqcnFyglJN3ZEx60gupq9sHTsK5mDj2Vw+sp6ToLazNGqGcy0lTBjnJhTeUg0wH/
	 vwz4J5p3HJOfGjHUiYUmRro5AngOdi0TdL/gPyzPzSjLrGwZnm4g/bswUfcJihEVQIjsF
	 KzohRukGUDpXjDY53g9YVxMMW486jjuYASI2ikyvdXM6fvT+whRlPHlqgNq72kA53Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792667922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=XKxzBnrr6sfoCMmrFdtTyujt07ROCnqZ0hRnMWcSiag=;
	b=UlB4Ezo5Awm0gsdLieL4yySh4CtQGp3vhTBjY72lB/2hkDZ4nWMAZGQTanhoWD29/+Wg
	 TGHzvwKzgrKTRcl0lv73ktRb65PWU0rBLmeLueweNBM/ThdeVzbzcWZWPX6X69hZTI2cd
	 mnDLJFk0yxBaS0AU2+OR5JeKtAfi8W8nF7LV9mHiK0LXvmNyGAwgo+leE93PrNY+8Iqr9
	 MgUg0xThY+mL0tkESqFsnaq5etqx/7mKCTnKZpn/TPnLMMAmPi2MDT7VIGqlL0mZqItMI
	 vKBKH65mXwePuaazgiSCXoJQEot3o9pWmCE2gTVK1VPnRwryfK11kk86LUcQp9CiGAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792667922;
	bh=XKxzBnrr6sfoCMmrFdtTyujt07ROCnqZ0hRnMWcSiag=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kXWwVD9lvC1KVJAfQg3QYS6WLl8UWzh08K1dT0e+h7NYIGjYb1M4fPyZ1OxRj9laJ
	 Rddwj0BG0Lk0JzzZ97UUYc+xOn4mq+8kW59KACERpNOPAvsYTnebxuzC69oXehGpH1
	 dKigyFU69NxCq0wiRwO2WUaMPUZ4SHmM4BMtYPLjTJ/yW6lGZsNPLv6nHuZ6dBTjX4
	 AowQ5uIbRWOdmtGkCUOOZJcEqSzjWpIGTdjccktJqKswHyzTPqOuZNOLXwYL9W1iTD
	 ZnBTCWHycF4PD2fUQ42CrYTQ6tqIF8p680jgZiYJkuU23FrQ+oVLoy1XFW+xadqd5o
	 jJjdHR4lLVUBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F422D4098A;
	Thu, 22 Oct 2026 11:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0B08356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87EE38065B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X60G7JUrP0PC for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 11:18:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 58DE3812B1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792667919;
 b=hhvdwt3InQWgmREJIbhdnCuot8uQPYqI0H8xeziogK+eWD7d2OG1VMlB7pDQPu+y5Y3a
 tUuY8Zqm0iICg88qIIT2rYrOvXGNp0PkRTUXXKDvwWai8PdGMw1SCn4qWp+ffEgGouXe8
 ugTECMF2ZUsHb3hD/crWNhPZWmt82wHIfiVptdTJoKhusySBCpQHOiF7QmCDhZXFfkBIe
 0ogFMg0/tT6pDnq5/pYXNY4zN0fkx28ADXrqvqb3qtT9DM4MiaTPeJkXjtITaSBVPb3pF
 PN/ml82Bu6VND0yLv1dkFzCmN4XuWwVhoz7iRUm55pVMcNKW/gGda5weRqZPgJSJKTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792667919;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=SWHyfMtqTJJkEbFpR5zOYZwgllVNFsYsqaqXOXUAphw=;
 b=GDMAAyW5JuPe1GdsQGk2qJqiua8onmwRI1ZKOaNa2jP4Q0H3KSYZNSqVkdejWYE4lIsf
 tfEfpV4YN2N7F1TShRMKkE8rcKKKEhLYZG/PbAtIHi508ail5oYotUtYdCYPX/LitDWAD
 kINSu7GvV+u90SSK71Hs9NU7qEz+mzhtREmUWVVIWTS84iMFMzAX+8XicJzqAQ0Txlbzg
 Ef0nYWxIQNhuUXJh5+plU9lOQ2acxrekPcvs7hc6piDOUxXuFAJPBHnGTJpdlaq++9LKM
 f9dKgVSI+B5/FjQMWlf0WH7KshxVhndjPdO4nHQZXHUInjgzwU/mi/4OOW8q/j89+6g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=IGFP01EQ; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=IGFP01EQ
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58DE3812B1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:18:38 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 3D31EE00778; Thu, 22 Oct 2026 13:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792667916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SWHyfMtqTJJkEbFpR5zOYZwgllVNFsYsqaqXOXUAphw=;
 b=IGFP01EQnFVCFht5ST0z/RdGtob973KXxn9+HVNgcULZkSEAwj8kmdchUs+3HN8neaU9IY
 ML7EaqguFwSTHBEMCHkviUsRZxiYFoIPtbIBOAwxyWy8GoLHvr+M6oPCj+uJkjGK2l4pO+
 tmr9EsEbc2yzKRD8gzgl73N/XGTYtR4=
Date: Thu, 22 Oct 2026 13:18:36 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
Message-ID: <20261022111836.yobaf523xg3zsrpp@n621.de>
References: <20261021223000.26513-1-fl@n621.de>
 <atnudFwiU5Typ174@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atnudFwiU5Typ174@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: security bump
 to 20260816+nmu1
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey Thomas,

On Thu, Oct 22, 2026 at 01:08:58PM +0200, Thomas Petazzoni wrote:
> I ended up applying this version of the fix, even though your patch
> was actually not very good, to the point where it was working at all:

Ugh sorry. Between everything blowing up on the internet these past few
days and stuff blowing up in my private life simultaneously I have been
thinking less straight than I would have liked so unlike my original
patch I didn't build test this one.

Sorry again,
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
