Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC47606A332
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rHdFg+M1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAED160AC7;
	Fri, 30 Oct 2026 18:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U29zIr80UwuW; Fri, 30 Oct 2026 18:51:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 20F9660A90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793386286;
	b=Wp0H2YB4wD8brx4m2rWujQrmL8LOcEOPRnxs1TamUnzq4NYQO4YXcKTXL/AqdpAd72RP
	 4upNB2Va3raDsfbjNflDDcavvyhAgNXuu1hQ5Ate5myyOlPOquleqhcFAtrA/vh9Ax3E3
	 JQdGHoqTHanhudEX/8Sl/NEfVDfOsP3/XWCbwZIibivyxp/pl5ejd8qRA8FcsZcgT2Vb/
	 F/34pvZycSjcLAhfQhpXgvMCxbTB73p0z4zCYJtuS/q0VlJfUaR3iJuG8WF/5fotDRxQj
	 zzR7pW1w4bD40pa7G3ThGGErpvRXQHrJhTXrMoz3rdGMcnPkq13Xi3r5nPUhuF2coeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793386286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SEs/lTBb4iDjtWWsX4dy9p6AuZTsAmJ3amKOUejtaEM=;
	b=eOPr9p8xyxdwVjLyan4E6skDNs1bvfZEO67qEDRe/yDr4c9tt9Tv3nyNyJv9bvWbFFWP
	 JFM05GTaAfdkNrSsWsuQ0EhW2Qf1ypKuK2kwzBygvcXna+qBX51A4bwPh64jq1DReWYfH
	 kAuWn+49Kv92puykM37THDMPygZF9VSpqjBbFofQzDXdnyxF9RTi03lN6NLv9rnaPTmdf
	 tO5xApi83t0uAAho7/eBcmej8zSBCGFpnhdCHGtdq+0ovWeImIysfO9e5AqdMnE0EeiFZ
	 sulYUD+OBOti1DRWIAL0kYWFq9xJNUlkL3YslK7RtwSOF6FP6f60VjmTwY/065A5e+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793386286;
	bh=SEs/lTBb4iDjtWWsX4dy9p6AuZTsAmJ3amKOUejtaEM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rHdFg+M1xzkXN38zS1J4HeemPLXuCiFD1NBqy3wNsuv2bRKtYglqts89ieIx5ReE2
	 kj3oMwqU9OReWajNR/peBEheI5uqFQeZ1ckRYzmaBpw51hmpG7bx+XHb3YUJiGEAzz
	 DP/Y8U4UqD9wkBsYMcSpnANXTb+0v1cAK6JxzsA7YmZWCG3qDBLgFFz6nzdgYll5Fs
	 OcikWITP3lLFy7ffQlS+uVTmpB3pTl8u5UuTNiLHAio6PGJYeFziMskkpaN4IPLw/Q
	 FH0JADPIdY28XJWh7KuXxGlZzBY3kkgKEOxFbKraSUUTTjQ+oT74s8rt4+fd8apiTj
	 NAHNGww62Ym/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F9660A90;
	Fri, 30 Oct 2026 18:51:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA772712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A026340B34
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9hpPyVgMhGS for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 18:51:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5998440AD4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793386283;
 b=gCBFkWfUalUq1nKqUsit2nKIDvtr3NRPpJ6StOv9V51FMQ1bFQ9hFMoHvH5dGMmDUgyR
 jiXVK76K7DQUzizRub0I04xrCmYPEKxwlgrCWB42lcek5qJpVKocAyVi0PQx+qBqqosv/
 smsDtHmTyA/lATsrwkf1kQVoe61SB313ORGOYvyZEiS5nopPCp6OZzWT2wjrosICXkOWH
 SvyVH3Yh/hxswp5mtin6EB1cmZw4f+5QpbZfQN+6x6HLNiUhJ5DuIOiPHvxbT1PKGsr6F
 ogbwA8IRGSBVFGkSShTCOWFF6MbPW3qmswsdQLv4M8BWZgWnOHxurZKxKmb+RkyttmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793386283;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wNY0fS4RpCnwYjO2kGwnCzyIO0isuIQkBk5KeZGDpcw=;
 b=IZ3ldSpfWI2YF8ccu83eFfjas4myyK/RZ20BOR3G/+dElKcFw8JH6crozmZdEoaGqb6E
 riXOt5gNBSa50Mh0RkZS68451oW5Pf1ceY48yJ+g7bBvojhL/zSRQecPMcWtR0LpQQmDw
 /lISMyBop5byza+zMyQhFv1j+KHPPwwj80vXtmcWx8A0klP1uslu6Kse59HW3kuoP0V9G
 XpTh1obExxnRsjTX6yLz56nMcv1iRi0s40De8IzpIHTmeDLUO1G8Ik+em+z1esKQAYNlL
 G/wUFr85jgNmSA9O5AbEkEhQfwYIi8PhCMjWZD4w7BDnISZ5FljqyHqBrqOVPHHK2XA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MI9bpnlM; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5998440AD4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:51:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B785C19F59C;
 Fri, 30 Oct 2026 19:51:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 30 Oct 2026 19:51:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 19:51:16 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20261027015836.3555198-1-james.hilliard1@gmail.com>
References: <20261027015836.3555198-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <fd3c01c52a412241c98095c3cf6bf6f9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/netbird: new package
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

On 27/10/2026 02:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
