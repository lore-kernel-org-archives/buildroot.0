Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30328606A333
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YxQGI3hz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A03360791;
	Mon, 23 Nov 2026 20:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IV_a8Ws1wvoS; Mon, 23 Nov 2026 20:55:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BFEA6068B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467333;
	b=aeZY6heMK4kvM+kgwmJ5bdA9nz6fq0mOsEjd4JxxV//J0Oqdp80W8n1E2ww4+ytPurgj
	 YzR36RVbuitZPBKZb1rfhH5/QWn2d+GhT7+MHXapPbcQMjK8sL0A9UKHthvZiS1/S6C+j
	 qXO9LCpC8eU5HcIL62CzVp3K7BRrCh2gu5ExtRuYDuRhz3cGf2FSrCnX0LYfjwel8gcQA
	 V4XmXmJaaNoxWxpI1v9mAL1DV4jd3uI0SCe/QMY+eKhwCjWxzk+G9rH5bT0ZufNQP2o02
	 d4LD2CW5fVixZBaNghOpvGGQcj7QgxAE4yUMVXn+9qauCGpzUJNNjcrpjixszaN2Ebw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=jZuTbA6EpoXIhQ0Z7Zu4/f31xwt/7b2gYNkntNYJkQs=;
	b=p7bo6MklqfsQ47vej8nQkkQsgjIifc2mDW2SZMSv9kgFK3r9IRJYWQ0EkDD9B7BSvpTt
	 fOKawFiWOjTVpfIUj5oNBcEY5gbrP/BwUQADz+okIIBhyfGruT7sjE/FHphKLKCAO+3uX
	 Cqh8xm5RLte9W9GI82S6tfVdSrgCZNsPVW6k5qOVx6gtQLgZe9pCBSPDUa94Vnhtea9rp
	 qAbaru1kS0twgPfQD+yPfUoFJ7RmSuYv9a+/oaYM60RbJZvtB4xnAwNsnfDFecf4voyig
	 Ynd5g6FJmASdcx1xXQwS7l8HlYtIVPNVYVdKj1Hwz81P+xajxCK960BHHVPmkKWkfFg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467333;
	bh=jZuTbA6EpoXIhQ0Z7Zu4/f31xwt/7b2gYNkntNYJkQs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YxQGI3hzzUm7V0l43Ng60kE6xXjbeCPP/p7E2VtpFARrnOGa/6zkuOR0YuQWdSrsd
	 qRK4ZjZ4s/o+PHhpS9G+xizDfxeAiTZCqyRuA4EAvNogEzJZmRJeU0DLAIZgJtEXMR
	 fyH23FndJ4bbliJsdbcsK60X4/TEvaCP1p8w7dr+Li0J2fBxQ4XIzcCxmFCRVh4KS7
	 0jA7aAcULB1uviMP2Yz2QPsW8e0OqJSaXtngnTwqbbQUuBkjL5AoRfuKGhrc5ewNWn
	 /xEe+vc5smVw4dJaTiSkN2d9POP9HQvvSUs4kmcMptO+o6mhI8SSeZrYha0QZNlroV
	 qWvgHugACpSmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BFEA6068B;
	Mon, 23 Nov 2026 20:55:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7B80260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A9D80DC5
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvbwQsQK4a9E for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:55:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D3EED80D8A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3EED80D8A
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AF13213F861;
 Mon, 23 Nov 2026 21:55:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Mon, 23 Nov 2026 21:55:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 21:55:22 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20261123171247.1062347-1-dario.binacchi@amarulasolutions.com>
References: <20261123171247.1062347-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <e05c785f867c00cb01b49909a8e70878@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/inih: bump to version 63
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

On 23/11/2026 18:12, Dario Binacchi wrote:
> Release notes:
> https://github.com/benhoyt/inih/releases/tag/r63
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
