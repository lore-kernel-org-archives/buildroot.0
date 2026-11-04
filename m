Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86639606A326
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jHEIMW1M
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EB7280C66;
	Wed,  4 Nov 2026 17:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7DqMKYi-LjN; Wed,  4 Nov 2026 17:22:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DE09580C3D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812966;
	b=MyvwP9IzzT07Rp9gtXkIw80SKFUGqCSeuq0IZU7TWdPdDMoiSJA6MDfW9TEwbCdb4PKA
	 msG9NrkAGWuxAzX3OQjZdBEW02zZzLYLErWZD5ZbUAHnHEeWu/nPumgl+KhvrNECeaBkn
	 9VrudxrZfrmP1NcjQ7B0+LIGt54CpKeZgUXSc7GWmEUIkh8YypO9g+/VEv4s0RxtOKexe
	 +fy1GtNqwDUIu59e1yaZ8lcf3dlOM4WL6ZQvVIMICrxLGCpIc+3/pzja7/JXxbL5BO3YD
	 3et54Vdk50+k8IiVooQo0mnO6PBrxGnM9cpVUhXhX8/w0gfQXSXR6gkMaAex7WG3FTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hJ/eeMr3f5vh2cEj/ejvW/i0ABltbT74q0fKZ4TBCTU=;
	b=iOilhpXwvrVbs1YYhyDzBcDYm2eYLpeawRPckAmrwhoH/q2dwifY7//PWtwaInVT5pKU
	 SAU8VNMgH4Izw/xeE8Oef7VZZbM+hbLYw29XoCvgRqFstBNaFZbTM9+KYM1EufUA+jzeD
	 xYNKQwMBRdKe4G2/eJ8yW5YoTtSH6kKn7wHXWIlDWEzckEt/HLhBygyoF0TwqCtPYIM+E
	 2HftfaN9bPtGY9txX7WYj/oJcRNlCrz+2Xj6yPhhMyfdiaBPFKBmBdsSr1JWa8MFwEQQO
	 WZz7jwTqjfilxH+C9sJu4vvV4Qe5l7pe2L0itIgmXsoGEThFdSjuYIgJqDIKzem3IaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812966;
	bh=hJ/eeMr3f5vh2cEj/ejvW/i0ABltbT74q0fKZ4TBCTU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jHEIMW1MhrEwmjAebsZ2x7CFKsGLVj1hHo4bh8ujgtidni8v0YCgGKjhhZap/lnla
	 FtZaKVr/H5lByc9CesJU8tbys01UCgACeZ0/+aGB6J5XZ8nzueG7+v364fO9fI6NMP
	 xHZep79+dRj85gSz85DADD+0JBZVOZth6zQ+qkOA5RqsRy077FAv5wEixW9JNECYGy
	 rDGzYkJCXdRBT4lRV01TDCYVCv/+2t3JDOcyHb4Ut6ESm3lQUr62gAHgHORzYK7iC4
	 fIZhm4HBc5HXHrx/tq2+/QxY7xvYvlFu/ZlXqOChLTodUyxuKQtC2NIejsnTYB5loZ
	 TWwsZgablxkBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE09580C3D;
	Wed,  4 Nov 2026 17:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D97AD3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F7BD60642
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1D_GylnrM9Fj for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E6A74605F7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6A74605F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:22:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F29EAB0051B;
 Wed,  4 Nov 2026 18:22:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:22:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:22:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261102201237.11307-1-bernd@kuhls.net>
References: <20261102201237.11307-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <d43328ebc2dee39e161b3df14051f8ea@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump
 version to 1.0.3
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

On 02/11/2026 21:12, Bernd Kuhls wrote:
> https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog
> 
> Fixes CVE-2026-48841.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
