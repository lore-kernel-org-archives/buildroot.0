Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1148606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ja8Cgbcx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C28581209;
	Fri,  6 Nov 2026 17:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chBsnDPxm4P3; Fri,  6 Nov 2026 17:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C4D93811AD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793985541;
	b=Vk5bIKAIJDqU+YGycFIYUF880ax/YIyYjx/jK17m3MTByLGQ0FDxUd252oEDkgvgAv0F
	 kvCZWwm0tWfoR7HLzJMCOOIDl0zzbvNKJgDqRFx8jSwt3t7tjpaqOuf1TuUfJgQ9EzUN6
	 AqPQAAg5O0UlHRU6AkHRD2ewhW+QjjfZDo/TO8uRBKEkmiOuyc9qPm9FFgVyU1KgDM+3P
	 gioSXwDtZ4YRQKmKUij2navXWrLDULSG7XqIg5MmAFNzLaBG7fJG0WPIQE3FmDCz0R+iX
	 g5WCjAcxtH70VZTCVAD8iu2kEmLP7sXbWFOcahXc3EnQThXlDoYPMmqGJrzgj1Qf1hA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793985541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5NlnBqBCTK15BrXDkrGM9nQA1GkilKYTNqVz1y+9nqg=;
	b=tQdll++ZwwLRa6gHQLmpBof4HqId7XJa0e6shOQO3QnxftPm6BgxnLPgNaG438RoZMBN
	 3boEsgj5uB01jyn6u9gOnN+rA/HlKRNCjpVBr4WnLhJ/acqc0FkbnX0N3643pjEZ2sQA8
	 eI4P89GrhRIRM8nZg0n/YdL9/oqwviIz1pXomFeMaoUItiIyMm7LyCW84Ransf/9W3ivq
	 JgtMZArXUUtWXJ/pEm008tILigZY/iWFlAzPVBe7+qElBfhPJJP5a7RUdbt2922TRt/5G
	 S7tl+9/JaepxejmIaqnlzduZY7UuFmt26ktMYLcZrwjI6W+0Hiae3/8NoXBhA3nyPVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793985541;
	bh=5NlnBqBCTK15BrXDkrGM9nQA1GkilKYTNqVz1y+9nqg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ja8Cgbcxh8QyTu0hVD+R9jENBtt0NgJgHHcby0iD+RIcOvS6W1KrY3nVrWZv/kiwy
	 2kfWiCECasNGU/VUhZSyQ+gKJYZz3ZdZqYQizA0ZX0pBWeZHBDLoAxgSFafxL3wQcM
	 fxZYoYNfWcxMuQ+1TLQ9cN7ovoQ2hxCTaOaK7uvyjbGP5dzw4VBuYUdjreR3s3wo6O
	 pdtEKRMqwOEEclP8uSbIxkrGOP+nqDIHe/xPwuLRT3A6CUAknRD5cuU8znnLQ9/6yM
	 nixZ9uVYleTOqJ84xUbynkyqTVgsOjJLvIcX65mASvfWVNB3mHoe0FjfjcbRxiheYj
	 U/9GtQxtm/QQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D93811AD;
	Fri,  6 Nov 2026 17:19:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8155B32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67635408F3
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdm9xlfB5i_f for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E1628408E8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1628408E8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:18:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 36CCA2003CE;
 Fri,  6 Nov 2026 18:18:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 18:18:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 18:18:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261105193810.681969-1-bernd@kuhls.net>
References: <20261105193810.681969-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <4c2c9fb096543cb3a1c2dcb4886f6001@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.7.9
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 20:38, Bernd Kuhls wrote:
> https://github.com/OpenVPN/openvpn/blob/v2.7.9/Changes.md
> 
> All CVE's are win32-related.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
