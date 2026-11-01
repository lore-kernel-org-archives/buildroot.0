Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB6606A33F
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=knLdO9Zp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF3A40523;
	Sun,  1 Nov 2026 17:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKVBCMkABEdb; Sun,  1 Nov 2026 17:44:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7B1F24043A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555069;
	b=bQG1hwMmHtUkAOwWwSPyBEST2RFqG1/6VTr23WufDV2zeDGhn56tKZrGFzGxt6pTVlAS
	 OuT9nHRKqaCi5Mgd0ooKdpCUV6znr3jaEqLLC5zJjgJkpGnfiYvHo62NKegB293yadQOD
	 XUSuzW68fW9JP5zf9alQdlYhQkOTwqIjNhyMsJ9b7q2KKmm/3z781MzZp3nPt1DTbDEsS
	 vSoi1KkzLED5WdcZv5TnQA8iCX4KkxbGQY0VHRkKFPWD/0+W1fkkffjJ3rVZoRLUZKCK9
	 V6YHyEquEHscQ9YcOo1zv+GzryWhzERE22DNF154OyTxJkXbCOdXlWscpNHdwD0E1Bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jNNGvScNI+0Bhi2oAq5yZKKBpKYSOqlMaNv4uFCpUew=;
	b=L4zZldiGt1LDDjdzEnV/84xzQLz+b6yv5bpm48gT0OpXVKUi8YJTOCy+FcgBUb4Aqg0h
	 o0dhbz68AhekJb4TCYxThHBH6AGhCAVqQzHGEhbVoJW+bKsCPIpg0uZiFUgaFMaKjBkO7
	 RJpnYqLSrgf39jnZEo1jg0tyTVtoxsU33Q//WO7CaxfFY9oxhSyM10e8+Mc7HtKhtGXV0
	 07SU/L7+VaTZZwAg6u6WT2zARgFYAwvyO241hVWJ72uvOOHFnkOxltANIwThFOb4VhRZI
	 an3x/wZLVS6BVbyYi1FtANtUJPXrVtCMFcNZ3sv70GbvzMmSdACTACQkRAZv6obgs7A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555069;
	bh=jNNGvScNI+0Bhi2oAq5yZKKBpKYSOqlMaNv4uFCpUew=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=knLdO9Zp2c/AqHNbiRB9CdoP3qZoLbQkieub70mdV5YFbWYWTarmu9G9Os4LcqbTu
	 q/m7smIzDURzV/Gr4p4MhuOf5aH8W6a3HqlkCR0/wvQoPp2bhUtFLqvrEZDAuBTZGo
	 Zl40lYlKflK+bE8DMcB+d4rhaWTpGDkk6ibTldgMv82bS6dOy1fCOHzIUnBVMQDxr5
	 zxe5TLk057Ge45MK6YJJd5QHy2qTQrCPNOPisD7ZM2uXpfORyfziwAw0usktu64nrH
	 4UGNFUW2naPwuT0nHBlS4csmc90P/ytTZL8FTGaZG1AOHwIG/NlN7aHFW+Mt45mUCv
	 qI7bwqEW5BC4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B1F24043A;
	Sun,  1 Nov 2026 17:44:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5687D3A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C11240076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiwDrpHuBQV4 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:44:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C39824004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555066;
 b=sS9llL5cEpeFBkCV9W0VH/V9AYLrwRm5fHWa/6flPx3CiGa8p3HRCE7wAUXL0kt65/wl
 EBzYuRWf2j5Nrv2V3/IwUkO8mgY7C4gT7d+OKMALtY42/2Z5xvLP2f8wK+9pX7Z2LWl5i
 LvJsiLQHvS2q50tE0aOjVr4i0D8tGYOKtJ4D2lsEaWKI1ujqW0fZm6qV+6hQ8HIzZ0h/5
 A825WS6OoSQ8pQl+IB91/E36Aermb4yLJAKToLt8Y3vB9B5ZjdVc9AD8qAcl/70ABCCZm
 v6KDAigd6aLrjmkW3/RWIYuhST85CTTwdK9hNRGE+OkJQaJ23Wrg66qha9i9WtsAIfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555066;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Lopil+C490EcgMm7iJmFX2UKLLgg6SvREF66uKVuNok=;
 b=UzKIpnOsA22Vht+rpnw5rwJrWRX2fJo1MfAoql07RHndx/D8y1sOcrQ8va4UkIfLBmhb
 7MQkUpisvu2BjUr4sjwDb5lHuswlEuZwihzmv169Hc3xfYZfyuuihOLgJy5DATuCxXIBW
 gVNyz/OSomKtZ36GEQUKVGF+6DyEKolPuwcqomHvBTYjN/flrWejkYllw0SWtsPgrnwR+
 c7LdHHsc7ZZE7/PfKFXoO/rTNkdBGL3aKwSwt5ZXdYqCfxMzcEYEIOM8OplVFAL7hecsc
 q2bemANLOSaxESi7ZG9xBnljWk91eqjr35YOICxbFWxqoQ7T+RRMwYCf7UJYpaPZ35A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DvL+s3SQ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C39824004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:44:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0A66FC49F77;
 Sun,  1 Nov 2026 17:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3ED1060750;
 Sun,  1 Nov 2026 17:44:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CBAA01032855F; Sun,  1 Nov 2026 18:44:21 +0100 (CET)
Date: Sun, 1 Nov 2026 18:44:21 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Lubomir Rintel <lkundrak@v3.sk>, 
 Romain Naour <romain.naour@gmail.com>
Message-ID: <aud6bUPnXW_1HdLq@windsurf>
References: <20261027220841.1349170-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027220841.1349170-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_x86: explicitly select
 i386 architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 11:08:40PM +0100, Julien Olivain via buildroot wrote:
> Buildroot commit [1] changed the default CPU architecture from i386
> to Arm AArch64. Since Buildroot defconfigs are kept in their minimal
> form as generated by "make savedefconfig", the defconfigs using the
> i386 architecture now needs to explicitly select it.
> 
> This commit adds BR2_i386=y to qemu_x86_defconfig.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Series applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
