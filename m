Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B8606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aNf0uNAl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF3258121A;
	Sat, 24 Oct 2026 17:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nS9ycJh5FOPI; Sat, 24 Oct 2026 17:54:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E40E18124D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792864486;
	b=jCsTRnB+nCmvx20E6cyQylm8gw70K57S99JHD6rUhFKX1uEFzJPqsqKyMxlPCkTR/yqj
	 lBRrdpm7uDfQf3gUz3Tvk70c7BMVicI8/AYYONLmqWb5fSJ0DRUOxwhzFNmTpm/JjXmhj
	 boYvix0IcuNIdwLYlXyLIvvqKn4Kb8mWzSm5bf1jRhandAYx51bWOVhnxuWYIlJmwVP/A
	 4nnLjaorHl5Ct3IbgS+D45a9k7O3QdapxZHSkufyEHU2ehfDdYTdq8egVgWeEspJWrgMr
	 7O0B/O4TnJvKh0iWNB+2mCLxTcfqqhW43Hw7EWYWh3wy3IxPhsaHu9RRExG5UopuqEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792864486;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=n75Zo08/7g2a6kMFz2lxkFcykNWDJFdEl6vedYuBIyA=;
	b=Iaqgle9WHNZYHnHppH3lcSvBmbQhtdJW9TBD7SM7kirEKZrdyacMzRm0kV0dH/58MNO6
	 ks4pvyLb8GEokcevKrZQlVNTYXp+mf7n2iFlwTeJbSfYV/OYh2eSNTHiegcxD/Ua+J+z2
	 WvRD09XnHMTUkqrIScWxQSPoSzOWClK2fUmbgPlM6maiBDf1XXCMOxJt43+XBRO2EfB7D
	 97oYB0hD/KWKrKEj0bHiO6ktp67MPRZvLen77oLYEc93f2YPhr1Pmm6Ob0Jcpp0FBAl9m
	 9nFnzcjqn/SLShUSxEjTBcZSheKbqBzn5i1M4DcmKAsfdK+iXAduieaAr7YnmAO1SLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792864486;
	bh=n75Zo08/7g2a6kMFz2lxkFcykNWDJFdEl6vedYuBIyA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aNf0uNAluwsJ1duBYRBlv6LcadfpZDPBDsoAfGxEmr6W0FHF9lAOPTbWzOjYu5qIV
	 sSKwOTPYgH9umUBTxGzQmRCI5nIyn9uH1VAr/b0V8go5u1W1G4tViztHO0lAuLgMbY
	 A5d7JYy8wf5ulmsUEEdPNUZlOxcKSmAbM5e7NZtVyqNUlPjTzNMuTmI051YumYYNhg
	 9hhq0xmwEvaa9Hfz32jnYfVe8ZAo17T/icNOd2rG0zMF3Y52K2z+WN5aoVl4QFE8pt
	 n4wvZnyQxIENmPVLNfVq6BEbh/2sCo6sae/9U7HuAHB2awjcXdgRx9VbyX01ovk/y/
	 OduqrXrRGsVBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E40E18124D;
	Sat, 24 Oct 2026 17:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05B84380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E00358124D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DVBIavsvAjM for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B420A8121A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792864483;
 b=pc0ijoWn+TRIENJbTxyBPSjg+XU59aubqBFyrJccBzclcTm3zk25HQB+JCeO+FYYlmZr
 n/Gccz0kAJCL+hbYurxRxmbYJ1ZkvXPwMoR8B1+RC1KUWCclqCWBxhlg8yW33FgFL9XZy
 Prp2OWMf3/1HrkvEMdiSBQcc/Z8E67uAYFvM1UrPlul0bXVxHzvTCaltraaN4WfebBltw
 I8Kfbfi8MEPYC4I4/tlw9BvFkffGv6xqM0pxbG60IpSOREJcri0Rf7T9K4lSw+nqpe14X
 EVluLEcrxwrt2dFTS5ka2npOp++eNcVXOOy7MtjFmf3JSMTDYe4mnqYnsBwyamw7MWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792864483;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=bPO2PqA3uUt2ck8JaeEW6oapong7a/SAzXyIJ+EsUA0=;
 b=Ge4xRjaZtqFWiykDSHg9LbmwvwlR6bq/3zvFpK49GuHTK/sP4bgIySrdRwj2NQ70j3WH
 FoCSiBO91Ja7Un4/VE8C1X996ttDXBkvP93uMxAFexJsVcqwnXfaxgu4PvkalN2FAt6yE
 oiDV8gxDXKpq/N8Fz50kOwBrB9kSoSUvwJoW50DYdDcg7xkpFX94q28vGIHUY70OHMY/4
 LC9B928I4E6y4Yttbk/kVeS1hefsqrc3zdzRP34DW3qh9DK57uXEb68jXq5fjFeQeaKwq
 WSucDUdGri1BBl+QOW4xZJBFxJ67BmN36ElU9TwNmoeqhIL7hacvKWfZXGUVb60CENA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BdqkNm4h; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B420A8121A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D077960129;
 Sat, 24 Oct 2026 19:54:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 19:54:35 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 19:54:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20261023211622.2096562-1-bernd@kuhls.net>
References: <20261023211622.2096562-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <1d76f93c58d5361509701cbdd4881ea0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v3 1/5] package/mesa3d: rework OpenCL
 handling
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 23:16, Bernd Kuhls wrote:
> Mesa3D removed the old Clover OpenCL implementation in version 25.2.0
> and kept only RustiCL:
> 
> https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html
> "[...] the Clover OpenCL implementation has been deleted. RustiCL is 
> now
>  the only OpenCL implementation available [...]"
> 
> Since then the option BR2_PACKAGE_MESA3D_OPENCL served no other purpose
> than allowing access to the RustiCL sub-option. This commit merges both
> options and their dependencies.
> 
> Fixes 
> https://gitlab.com/buildroot.org/buildroot/-/work_items/180#note_3501740032
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
