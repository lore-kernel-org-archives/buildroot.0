Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E99606EEB6
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kO7HVqoY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3124087C;
	Thu,  5 Nov 2026 17:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cFv_YZYI1bV; Thu,  5 Nov 2026 17:03:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5C7DC4083E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793898205;
	b=HmkiodJpHPzjpQZKga0Y2nqG0DHhpTV75SlsTBIZbMjwhf9LUOa9H5k4FjzTgLJQeOtm
	 Qu9NNzJlcZeRwR5MsSwGiOmGa3NZp4m43HDO7qVph01LhWSCXpe+OF1NTuBI7hJ4AhmNC
	 qYEf7e3bMMPu/e1Usqkk2aUihfvUIbiHrEqxLfJO2+pH3aMF0rsSh9EpT2zaFTnhnJdOb
	 oE9KITmnlOofQfu4RfPvLHtJWvjhaRD7Zltm03cdeodSWCsTvMQtAjGUW3WKD/hpsA7le
	 ouYJ/d3yh6lajaR1ubQj73bx8BGWNMoAPxeLmfKhNkDYEgcotBFKBOEeyovS6yxHw5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793898205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=rBXxB+CiDq+ZsAijhfxAhXnY5E4+OPR2qjYKQ3c5FjI=;
	b=rBREi/rxAbIIMaYoxW8iBI9EO6U1jFNoqaa74l2yq1pZo58FnRHQIc/MpglQ0UQQDij7
	 lSQ7UltIJ4OM8imfI68ECHh7m/n1yXyw3Qr86XuH+bRVscBfMoTlkQFybjRtECtoLLmmr
	 89qomlZQgM/17TcZ8TXiIvYcZF/hkJ2XOlSN8ZFlFyHAI+onktmRVQUXK1zfvTluJmmy6
	 aOTKDTBZxX3H6gHH3Qtd2GmII4nhfw6nqfB7BMqk0JBWkSQAAzVf4pF0v1IZ5Z1wyGLWT
	 oZuQHfSUZGa3vmxwqUbJaf9iujTYWaRbcHweN9GaOyj0g1X54ekDgEJ6Qf5gnBgpXKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793898205;
	bh=rBXxB+CiDq+ZsAijhfxAhXnY5E4+OPR2qjYKQ3c5FjI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kO7HVqoYtT0GF7XsLK6PyUou2vtL58xEC3bZmKPN0tHTthyY+OvCE754eET+oA4jh
	 Yn7Ic8B0Hs3Dcaq0jtlfIUQ9LMpZ9x191o6R0yVs85f90c9EnBhHS+tnHIYe4TZu8B
	 z9HKNyod6w79c04IHreeaLymlCztYw00cL4zdRQs8hXBp4wE+pBupw5u4rUt8YqtnP
	 hxiqzGx+c92b71HQIM922Cn0oL2P08Ydj1FAOsQGRsMIzwGobwrbRrkAkl00sOz70m
	 oMqPyTzMBtNN7Jgx5QzS0dMeITR7c7T+cHCcPdyKqjZqcahaa/2boymUh7tt+/hUOh
	 3VnpdMopQvB7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C7DC4083E;
	Thu,  5 Nov 2026 17:03:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA3A31F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20230400E6
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5g-S5ogUiyP for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 17:03:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A79F240072
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A79F240072
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:03:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E24562003ED;
 Thu,  5 Nov 2026 18:03:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 05 Nov 2026 18:03:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 18:03:17 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261105095044.3677933-1-fiona.klute@gmx.de>
References: <20261105095044.3677933-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.20
Message-ID: <93f50bf5217a06c5d866d70738f4fed8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump version
 to 10.6p2
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

On 05/11/2026 10:50, Fiona Klute via buildroot wrote:
> Security fix listed in release notes:
> 
>> sshd(8): avoid password authentication bypass that is exploitable
>> through sshd(8) that affects some Linux systems when built and run
>> with PAM support disabled. We consider the root cause of this bug
>> to be outside sshd, but it is exploitable via sshd and can be
>> avoided there.
> 
> Plus a few bugfixes, full release notes:
> https://www.openssh.org/txt/release-10.6p2
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
