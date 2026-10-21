Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A6606A32E
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MB7j02sd;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=aEs2JIK/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2959A80DF7;
	Wed, 21 Oct 2026 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMKhmgyQq-Aq; Wed, 21 Oct 2026 13:34:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC87680D66
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792589654;
	b=BkykqWuWXILz+Y1R+MvA1KbjWtTl9DH/ZVRa3EaEME0nj1obRu584GzCMGxIoB5CFIxZ
	 H8ha/YJqhXkj/KqWwGR/BlVuLND58hXWXCmdBaZRqXSTnaZMdAM8FPQDu0Izt9r73BPFA
	 ldE+i1MZUWB2HQVntosb4WZkplJfkZa09xtTFYhtZBdnnCQ+tl8Msz99mSY1WNCDfWr5O
	 YA1hEn4LsOi8goU/D3ic7PGTzW8icdrVRUQ+NfaboAJCiaQ6BKf/tSwtySV02Af4FyuMd
	 wv9/dqVKHsT35XiZZDeyN1JX+3JWydHwNCGdNOJ7j8Lq9hHeSjALi0bf1xJQZNgTGRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792589654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RBKOAqz/Hmo8y2a7CBjbnDNBW/Cf9TLCXZ9DWGzGNeg=;
	b=IjCUd2y8Iksbzu4sOelJPertjFoEiNMx5q0wIBBlGxfEqr5YkYE6CUSQN2IUXN76vkD8
	 ldpZsTwpygIiOHJOwnybdS5T/l8xPAWKMx8747SD2ezxqvZ3IYvsHbY3qSlGpYLjYNq7Z
	 nosTTK+x4m3SBNuXF4BFP/xdLTkVwmrZsBKZX5DcqUpDCdpBDLTGvGsGkWQyBnUf4d2x3
	 wVXuhaeKri5oVgOtpexAi2v/H04muDmIoowtoBR9X5oJhi0RVB/+IGyhmf/MMQw9Be3/M
	 iIZvUbnjJ/S3IGtfGfVVSndSv2QZSI4rWbFwDEFlgk4vvWqlBQiCA+eKyLQQ0iLmVuQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792589654;
	bh=RBKOAqz/Hmo8y2a7CBjbnDNBW/Cf9TLCXZ9DWGzGNeg=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MB7j02sdKfAOyOZ8JvRLVZfXAguZIa9QhuXPM2qEXAw870F2iiqMERfJwxCKvYyw+
	 Z1hKTBKf3dS9cdJ7lMQKbovCqRItzB00fuSuQ3iq+2A8t2yEBzOLo14hAAzIT8urVR
	 joo8T9LToDK3Er5eOA1VK79PL93y0tAW8pYUjDjjX04qjc4v3rQxO85yFZ2qRivvZf
	 +vb6l5Z3i/yO8ydnpHaic4sob7+qn3C4q6H0zJZgANYJl6I4GOOJmsHM7FRDWB8Q+4
	 B62/KEby5bYPCUSP1mIDF0zX/8sDgHRhsvcqAfY+4aUe+khBbbqFcqHZ1f923AmTc1
	 6vI1M7tvwbn6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC87680D66;
	Wed, 21 Oct 2026 13:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 133CD765
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94F08403AD
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umA2kD-kSYXj for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 13:34:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 68C1C4039F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792589649;
 b=blMK1M2wIQvo4lcQRU2aTgPH9OglpzB0AukgZnOK6WEe+/8apOjBeWm/r5R2ljUghajk
 gC0JR7t5R0nDoeyGmYgp3vv3GdsknTJanGztWqguOmsZP/NBv7DnsZXlskg/5bglr9MGn
 V9PHA+2Y+bWU3WuR8llCZvIWONgNtcaGulQsMIpuuOW70ebZOJyN26pZT+uaqQsW+JDVk
 xdzlftNV6CEsu9pOhhUtT01dhLMC1bG4J554hzJWdi3pbhZF9NfR/OKixIIWHAQOBIX71
 2C+Mh29ywstXX+e1qwAzJdXdq0dvKUvRF/QBRRgPPCuF87rzkglAqDwOJI37BsUpamQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792589649;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=wRTHS6Iq2om/3NO6AzGhDItQe4jJKap6OvvN75UvxBQ=;
 b=Vt4snHV3UOE1nHBCbtiRY4E27rPgzwl4JygXiYBeH23DijqZG6BcRtGBc5+0JfrZLqr/
 +RxvwK1vad3qqTtNw7njEbQDe4YOlGU9Q7yAXbRLH9zuwgJcj5+8WigY4LOYdp5zef+yF
 qA3btUyXUg5ssnqonee8dFdibW9/vXikmJ7OerpgyPDSukhkjZo7U4XjvH+SOgqVl+bVI
 Pa7RJpnu0Xn4JZxzUof+nDpRrFWCv7qb8eZTbHFCxZCTivsyUaw3xBJiICTqHSmNIknGQ
 w5sLD/QdI4ewbDFi3hqd9NxObe4BPMSe7RPR4aDEy+JDKWXEv6t0d6wfYudamF01UHg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b="aEs2JIK/"; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=aEs2JIK/
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68C1C4039F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:08 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 377A0E009D6; Wed, 21 Oct 2026 15:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792589645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRTHS6Iq2om/3NO6AzGhDItQe4jJKap6OvvN75UvxBQ=;
 b=aEs2JIK/4NW3G1AhGdz8Z9q1yJyzJWWpZCebIb3bG+fd1TLeES3IUlL2e3RZdM+CckcCIp
 CA2zuqO2Efg1xyEvtpGCklU1BFDqVBr3aZH/cDw7wVLN/AqwZoSn3AgvhlT+nU5fmLeAlb
 I9TT4zeInbarFayN0V5bdKJ9yBsG2Cw=
Date: Wed, 21 Oct 2026 15:34:05 +0200
From: Florian Larysch <fl@n621.de>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
Message-ID: <20261021133405.njzdmebr5dbaqqn2@n621.de>
References: <20261020144902.10111-2-fl@n621.de> <athMFB-DQ98pvKhX@yd-6wlzhs3>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <athMFB-DQ98pvKhX@yd-6wlzhs3>
Subject: Re: [Buildroot] [PATCH 1/1] ca-certificates: remove roots chaining
 to eMudhra intermediates
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

On Wed, Oct 21, 2026 at 07:22:28AM +0200, yann.morin@orange.com wrote:
> There is also 20260816+nmu1 in sid, which supposedly has the leaked
> certs removed, so maybe we could also bump to that shortly?

AFAICT, it does the exact same thing as my patch[1], so this should be
equivalent.

> Well, I better get errors about legitimate certificates, rather than
> silently connect to compromised hosts.

That's fair, I made the same call for our internal stuff.
 
> And those who have legitimate certs will have to ergenerate new ones
> with a trusted CA anyway, since theirs are no longer trusted by major
> browsers already anyway.

Since the certs that were *actually* compromised are intermediates,
removing the roots (which haven't actually been compromised) is a very
coarse way to resolve this issue that causes collateral damage for CAs
which are actually fine. I think the way browsers are resolving this by
actually only blocking certs which have the broken intermediates in
their chains.

However, there's no generic way to do something similar for an entire
Linux system, hence the root store hack.

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
