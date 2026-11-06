Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566DC606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FhF+gRNz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30863816A4;
	Fri,  6 Nov 2026 21:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISM1uL1FJq0Q; Fri,  6 Nov 2026 21:21:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E59F8169A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000079;
	b=Y9KNAOLDd4age4XTe/kDMqVj/E0zKtDHbqiXAQSEmY0aQhWAjdRQ5DQjq0JySI6R+azL
	 ULGPEeazTrp0Nvgdr67f0/ONlKobN6mCN7ylFv8mz15PlvFF1Wspsz8P0/SXvwtc17GhF
	 2k3AwZzpMOYw9lDRgiiHy/p4apNei/pHXsW2oz9xjr6OYLw85qJr1dSkP1tnknYq4hn5B
	 RlvCql5k/XGI/FBWrrBMYYVIOf8r7H7cN2TwiO9r/N4r8DCCWXIX3PDWwhSysiM4TB+3A
	 fHcjCWgNkORIh9gbtc33ljWeq+GXazbeLoHRxFQEiUUAZsDkd9KIek99N8S65UZBBBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=f4A5Igmz3tOfe8Qb9w6Y5ogEZDHYFtfr3ij84Q6BhhSLYDNJA5AE2zeOuT4eW/+GBJxk
	 i/a8F1OEpm9CELf86CbmsDITuKepTcL2JIcKKgRdYCbHMe6LY/qT9VcYMLsDHZTXyvCSV
	 A4EAUmsf+KEaDmbpQHEq7+9yx0+n2PonBOQXn9CMiaI8lbhN8xUYVFQBEklCjla/ICuLS
	 t8NzSAEp25E72tSjinmkMrhnWYAli+/Kttv2e/zmOOKPGKbRaZ4RHZhhizOnp/aGTG9En
	 zmKCSiD6IavjTwqUb5ev8VRSFhmtjqJfJ9uZVOjqDBpJLA4LCV3fWC/XiWNsJ1db//Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000079;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FhF+gRNzCA+pPfl/iIpcQ6jXjoagGjT3CzPkypbi4u7exarv8gwDivHrEDWyNndaR
	 GANLRv9yr61aelrhjtQlrZt5jigVeRfOBoB7OyNOJPwYCAgfZLnYMxu2QRUBFTm7mc
	 Nx7jcEcgQ+ATw0PM/o5pemxEJ0JjkcqxFrQjCfhyupFVtZH50sxeRhP1CfCM1/n5vf
	 OOCqbncS3pjR1jzu78+VV3r8QG6gVLL98Dtcf2L1TOOdWFr6xJwQWN/KbEN6ZY24HW
	 JQjQoy5LoGM083NnXm/40LFyb4eQNuggrPMCJdo9JKPBOvxEwyyBJvEY6etoe8aezV
	 +N7Uk9ojJtgXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E59F8169A;
	Fri,  6 Nov 2026 21:21:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE512235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0545404EB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNvrYKUoibsD for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:21:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 554974040E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 554974040E
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E9BA113F88E;
 Fri,  6 Nov 2026 22:21:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:21:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:21:12 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261106191536.2120153-25-james.hilliard1@gmail.com>
References: <20261106191536.2120153-25-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <7d552d765f9449469190b7e29afb5c54@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-sentry-sdk: bump to version
 2.74.0
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
