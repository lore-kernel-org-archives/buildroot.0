Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5E8606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X2s6K3MY
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898C681162;
	Fri, 23 Oct 2026 20:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4dtlCBH1B6l; Fri, 23 Oct 2026 20:25:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D5FA810C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787132;
	b=Kqg41o1CMYlkK3w705XA5sDlQJnh8PbZyaGWzDOq1Oe8B65AyhENFj5RDjfd8d7EiR7M
	 7CzodjIrCJTGwYdeMgl8MYjOPQMutcN/otCqMdatrAAJ0IbVwhj9H6Cwey5Qr1zlzpoKZ
	 6fd2BJmu1EgdZk2nDzggDBL/Eip4uLzLVKJTI+oUZjF0MOfaBxDFisKNy7Cvj5AVDXdB4
	 sQBSsMuOD3OYJ+ldM0J+b7D7uU32cY25Al2exIuLS7LeRrCHWJsjiK87r1TWdFB85c7EZ
	 dLAzHkCyzRYY8b0PezasMeHosSYENCa4p9/GJdUWWdZfdDGKxeQ1jSgYDCWBadckcNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787132;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=H1EFeHcT/DKfZqO5HEwVGpNCAAlEiUMnognl3LYczfOVmDf2CLIbcld3pNlw7zLnPzXL
	 jyHx+QP+kLdKtvOcYfoED0rjuEethJDz8GUjc9JOKR6PBN67NOhPwcRPYHUoyXjbrzcme
	 7AqcLHYvxGjI2/cZllhTgliF5oEQgPmd11E8XZEDS3zEf3dvwJWi4Ecm/TZdpIiKlO1J0
	 W4SFrhqLZ+6NVEzZ6xxc600m7JpL9N9B3I1Skn6uEUAYV6LpdroNXpPo8NfrKMg6ieezH
	 Qct/tsZMWKXMHt1urPiCEzvilZWWO4K5hH6oKZsQ2a3ui3i9i6+yfDTQYpiD5Vavovg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787132;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X2s6K3MY6UDcl9a+y+3s4Kq8YWzkZZWuxHhYGmpzwZxEx1Ef2NJv6ggS3iaporctT
	 NKXy+jjb+D1P8Jl86X/EioYoofoElQI9ORjGFIuQVrRFTElihNGBT5PzcWvYmBOirG
	 VsSanOq0d4Tww5vscI1ZPzca1ObH8nNKauH2SELkuqj1+SQGTBLpT8Ut9MXSbA4AKu
	 dD+kG2lvbmix0mzhom9jPuDFKGs6zsquJuRqSW6UV7RswuhdMNdeYnglfgwSqML38D
	 hjCd6fFNHhmgka72ZFw+qpc3ZTRV0xV2MJhXvjUjrQc9suyxsd+PxAGWIa04zq/lk4
	 lyZgbP4+H/sPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5FA810C5;
	Fri, 23 Oct 2026 20:25:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A7C73C4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 607B860A59
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phU7nGqag-7r for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:25:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0527560652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787129;
 b=tGCp4W2cLqFrRWW87yjYrVupBB5vzsormcZAnOJ4chJWalawaFpn3fPS6R7UgbcodpOV
 6d7tvKH6xPZSHV/jF1jI0KcA9dUsY6BsK0kTXN2zMU20wvB+0sLkTXrAbNnfDJTwnKy3j
 ssrAMVQEgRtww6rBUNSDb5lvzKQXZ+TKtpvZH1FjNgUo6chXjZLH7pzXfjKxC0UBA/hvp
 vkb2GglunnhUS6CBMmfej8V4oN+iJZYeVOf28Jc56Y9V0UraaNNPd3NBZRfiBnPfR6BhY
 7cNNv1k1wXcIReD18stskSs70ebexibO5LDSulgfMxlgJNiWF9M2lpcwDA39XAQ1wbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787129;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=NNIH4h9SdrVkVAipuuT2qGkHt/YUbAxyo6iqOi1z8xfQt55KULOmr8i3aKjtmN2tlbG8
 DHEv+NR2AbGKQKRqS8/vbxTKX5YfYKr7ClY02KBuMq1cZPuoIN8UO37xa8ZMHtwru5aE1
 VCe8rss6EGsQyQs0S3iBqRR7b18jxttU13vnN1op4qVwM9nOKD7eouE2EZu9Vhux+CbY5
 x5kl/zWkYHxneJlDC8+ZXRDHT6PiLdMphne38JA1v3AF7TXxQRdflQR8zXcsJxhO43t/w
 3zuOeqQeQLDwDVZdRVP3GFgCSZGDy+kF5RZMLJwJGNrrYHhyCq8OKcRxYIHjKrkMz8g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rlCq2S47; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0527560652
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:25:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E714619F593;
 Fri, 23 Oct 2026 22:25:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 22:25:24 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 22:25:24 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-1-james.hilliard1@gmail.com>
References: <20261023181818.920329-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <6db3f52d00864bbe1f72f9ea0a319af7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-alembic: bump to version
 1.20.1
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
