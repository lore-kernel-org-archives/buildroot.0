Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD2606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ozsWpQfr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D455860890;
	Fri,  6 Nov 2026 17:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEWOKk5dF8Nt; Fri,  6 Nov 2026 17:50:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 076F260771
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793987437;
	b=da2V4HHRRRO4dyhYEfJbDH2GMxxgFs2yzB8XkOumzZtfUbE1EdQ3l+LSH10TOlP3sJc2
	 VFtpNDcdfpc+zkyvtUfibVaLnVdS/Ni+FoSSty6Zy0wBxJG51oo6NKdqsz8ykOxlqKqeQ
	 puzAaSdst1N4RbaRi+HJSULQCEy+qoLFWhNtmEox4Fw3+7mKraA5WM1CIL7QH3Hp76Xzh
	 mIU8iDuiqQCssmFFN0635NpfkjjpXx1GoUhGwP+TWiADEcSHO40Myum49XIm7RFm8o2S5
	 iwHqjs6/+VwNVyW/myLZEKjfVwlR3UQBuUPEnA6M2VeZD5pJbSqjyBvmhJWBUktsfcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793987437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fvq9A/ak/ssYm4eyvkUEUx/G7k7S5Miz0BrwqFc6roI=;
	b=AkVtbBpueHQtJqSo2YdLFGr0dHrbg63hQ+1HpaESlMITB1QSJRTFgRz7QqolGBdpmZa1
	 t0lgea2KvxPqRXmRBR9jouU/7ujQSZGMS8SYTk9CqdDMYy6TPG3ElZOYW0hZZFRhtIfLs
	 7d939JzUyqGg3ShnK2P+j9XkniDi9pobY3EbdGfGFmDC5F7Q/u/+fqNFRLDM+vfftXdFv
	 ummZGX9FXPofrSFUJj9qJW2ETTFHBlIqbal0mY/gKgyA10QLNhe0dUhkJJlndtyOfS+B+
	 fAbFHLR2/PhkHjbjynE3UY+sU5dvfnITGqNeA1qvWrkP0J3d+KJBSFhbn3eyXZoZ0gQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793987437;
	bh=fvq9A/ak/ssYm4eyvkUEUx/G7k7S5Miz0BrwqFc6roI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ozsWpQfr28I3QPh13KJZ4rMuhX5Fr8PfG+9/9YbOViE4eTYKfopogbL7rj6FXhk1A
	 MgKH/cVc+ygOwdcy5DwEKkyRoy/eS5/TeyUEOO9e188zI/7AymKBMOUG541e/NOEeB
	 JgfK2Qk+ODxNLeUfJVFG1wYtqSANo1RME67L0racquxFvKQA4sse9uMz9s2xsvEPXV
	 ifFLNHS6F9V5xDk0EjyBxgQGoWBTuCzDowb+MuslAPbrC1K2AB3qlgK47sDqC1v9yf
	 FTKv5G4sU4Ayt+yhyUMqbBc0s8alx6H4xFquGRhCVkVzMU3BO+7hsMnElgexnarr93
	 9Wt+8tPbRXW6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 076F260771;
	Fri,  6 Nov 2026 17:50:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B67A734D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6DFF60771
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPwXk55vu0Cw for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:50:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CEFA9606EB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEFA9606EB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:50:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 01ECC60137;
 Fri,  6 Nov 2026 18:50:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 18:50:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 18:50:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261103070307.5311-1-bernd@kuhls.net>
References: <20261103070307.5311-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <4e9b31eb53d2673d6d79dbff8d0a8fa3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to
 v7.387.0
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

On 03/11/2026 08:03, Bernd Kuhls wrote:
> https://code.videolan.org/videolan/libplacebo/-/tags/v7.387.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
