Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01EC606A31A
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FN4Q2AO9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87AB405B5;
	Sun, 15 Nov 2026 09:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQU8QjJVOnkC; Sun, 15 Nov 2026 09:54:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A699840631
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794736488;
	b=DZIbzqm1wz2oZKLFvgsLaPOjgpbIVTyB9+JAHwhTVUKgABF1XHKQTq7DscDFHMYWbbnp
	 r+2jaYpMYCzNeuc10AR49OKJk6y56jAVlAw479IfGhspgAcziFHsg9Fh7/L7nsjtOevkN
	 /x2dDdHdniI6Xq3gyuey63KjoqHOFdwUwQFTueTbdJTa/OPyCDkU1L18NjQeXaezFYnqt
	 zgH1rVZqxBlVN+QTjya0o2aLF0V2H+yCmlxyyHXLOTDNRCPaHYRag4VSU1dJuuYaSoG50
	 NMJPTnrPY4/rVGryg1+3ay8ROSmJpEy/TmCB8YE/+Q1vgAO43Ffvz7y8cT6+Tp6Nksw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794736488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mllhxC5GbvSzRKo+8JPI/GvqejslhlFzWa2R0AdPogQ=;
	b=iUDOrxJwerzaWvCDFEXeMK/HUAN2VBlfk2Pjskg+IdUc2VEcmdoKqvii6cnZrVxXzONz
	 NsT4mQuCiB4TOJI7X1/0nrbjkbQtitAev6Ou3mJblB8vlO+HJRea1GErPSggAIOaROvue
	 ihGEpJo5r3lIb0hB0QgKWVKckEEBQpTXyKvIbzc9XTRuNP37t5ersiIklMNDn7fNAZ2qb
	 zXh1/fzTWXpJY2u3AmGOqEyvpP4FMPepYXU7x7vhDOrYS5v44HlZJ/heT+WUp1SazaUvD
	 b24HQy3A2oJ+UgaBJdBqtK5wiN+B3lQa9dYOUOJHZIfFaWPlsb89thE71gh96H+NI1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794736488;
	bh=mllhxC5GbvSzRKo+8JPI/GvqejslhlFzWa2R0AdPogQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FN4Q2AO9Le4rPUXLSKW+G6jplbxadViYgxV8lk2cpE3cTY2GPMXYdP+CJm0BIWLtD
	 vC+GjIcKoyEE5o8KJlCW+ESXO9jIYx393inVT9paTQ03Fv8zt+FDAvVwGLnlD9Ejjf
	 NWb587Vu4si1nUdnfJbTPrXDRfbkO98CAjSX12YSM+FARTvI8rxMSD1isqW/8xdvz1
	 3KUi2szq6gf59oRkPXb0XYGWpvqLHJXnrhbIOl24SINtCMCQlFRia9IgSCHdN3AMhp
	 t6Ku6GJirjybLGgNOgucvUs2iz6Uk0qaX3f86sqr6GZ8l4jwGS+LThGd461OpvDU+B
	 L1+L/I6VtUQZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A699840631;
	Sun, 15 Nov 2026 09:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC13E2FB
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 09:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3B160634
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 09:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhX2aGvpMSvo for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 09:54:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3AD176062B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AD176062B
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 09:54:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8A1D4C79A87;
 Sun, 15 Nov 2026 09:54:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F00A260238;
 Sun, 15 Nov 2026 09:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 984C111BC0029; Sun, 15 Nov 2026 10:54:41 +0100 (CET)
Date: Sun, 15 Nov 2026 10:54:40 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <avmBV0EzSoXYHBab@windsurf>
References: <20261114222155.1450949-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261114222155.1450949-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] support/testing/infra/emulator.py:
 globally disable colors
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

On Sat, Nov 14, 2026 at 11:21:53PM +0100, Julien Olivain via buildroot wrote:
> Buildroot commit [1] disabled colors of the Python interpreter (which
> introduced automatic coloring in version 3.14). Those colors were
> introducing Python test failures.
> 
> It appears that more an more programs, not only Python, are following
> this trend to enable colors when programs are running interactively
> on a terminal.
> 
> Disabling those colors by setting the NO_COLOR environment variable
> is becoming common. See [2].
> 
> This commit sets the NO_COLOR=1 environment variable to globally
> request to disable color in all runtime tests.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/3a6e2b4a0395f6e049cd847cf16406a4d0d998ad
> [2] https://no-color.org/
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
