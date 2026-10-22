Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E8606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cBufHljp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB484095B;
	Thu, 22 Oct 2026 21:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_3cLLkoBwRX; Thu, 22 Oct 2026 21:19:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EB176406D9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703981;
	b=gM9/+TxuQNF2VTnR6x4MzAXE1mgE4SjINRpU7LZy+GzeokMBfnmC4+EdfkzgUh81MIFd
	 dGxfFItw4vD1VhiqEsBQF3ksb8LR60sGv0Ou48XUaTZjg2ghG/rJXL+vCFAXJViLSM7iH
	 xCgQs6e1UWtPZlb9+ALq4yjRfylfnYKTXLEmz4a2rU69WgCASggK3Ts5qmqxSFUXtFgnj
	 PwE/SZdhuwEhGcSsOOfm8DiQ8t6d11kzv9mRY7B3TAjk98cQYiceeOHoVPatHVqbJ3ooK
	 UzwO53Nkd3By2Pp9aNQLrSanBX1Cecfxb7zOmTOkEFWPT7upgy+Rc7mnkQEmPHuMp6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EEjCC6XXOORondp8wVQXmcKAd2bQH444s3Qd4wpwnO0=;
	b=GucmMjPjgVnupUw3eQfkR5IxLunGjyQY+UGBTOUESdZYCce9oae0lZI4WVC/GObwlw0F
	 bKH1IDvtRp/Uhm0lYLlKXSo11edRDAyyXoLIFyr8wwq3iqQ6NgxDr+OpxdOn1H0E2FTQM
	 BicKppjvU9alFaKcG4U56ug2hk5X9rMpTPGCGg19upsFklr1jOuWbAfm7EJcb/kDNefs/
	 2RHsdG195incmkoTmQn15bEILaH2EcwiOHVEPrdGmBxgMc4OQaO/0Gucb9SLnyiH6ntVs
	 /khDJyZ0qHtGF8RBzxBcJzR8Wgg2qaNp2FOlJd1W5IFx376fz3CFBkbMC8KldmVIkiA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703981;
	bh=EEjCC6XXOORondp8wVQXmcKAd2bQH444s3Qd4wpwnO0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cBufHljpLxku8Ubcgm4LzeySRA6f3lBtWN4BdWYsOq9sTskEWOjrP0Txk6t/wrIYT
	 1BB3sFLYQtyB/TnxyaPBHLtpUJvXV52rKz/J5CI30d32yNs6lVP2vtP/zlPSGvvbB5
	 nJkvDt0oQzuLgABIlSi7mGERB+NNSsk151DFVWZPs7ahLEHM7tAD4j79HauQvdSJbs
	 scugV3wo3r99t6tj1/UdvLrpcYSTEyFv6Hpj8dQ0PDADoykdSSmOItiqSUSUV/7qkW
	 bTi4ZYQpFpbhUMDhTLiW6I78vp1ZEbQ/MuOPFl999/ESVpwGCHWmbahmRVCOJNeomE
	 C8sLC61A08pOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB176406D9;
	Thu, 22 Oct 2026 21:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0E9B356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B715A6080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZTr20UBEAyG for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:19:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D9B60607E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703979;
 b=qnQ4FuVC8kPBvvz2Li2vIh7Js0SfvpK800sDHiY2cGF7AEAaPGaTZP/qzgYLaiol5+bY
 0KjAGFWz/V+Ugc9XwoAWuxGucVrJQKQ1i8fyZeTZk6LpIqKOJKUqtpG/5Wf8g8L/PGnCn
 G5e/l3CLy0BiQPQkIif/xvkFHIePd+shNRqoD94eJCayafAf4h0CThLxiuCXHDJ37J36P
 9zG9EqLF09ETzK/YKiRaC+gpAn15OuH5OracAkGqtnTM+/nWjgy5bjAgm26w4UGm4JunG
 7jUwll+IMZxny1i6bL7jE9Y9OKO+l53GfkBG4/9mGJm6nnFvzLfgjYjBP5EdMEdDlGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703979;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Hebh/XO5eWUeJXuS30LKmz5yxEEIdU73r4I4oBsgGy8=;
 b=OIBkzJ+nM949R053kHx3XzCQzahzSEx90m1AAfjKfrZ4nryGcl+zl7XE2X+ebNgOZ0UF
 FItxOZK2X1wzGbzT2aPJTe+8veTOkdXVAUrVLrRBKRpvN+U9Fn3Ego2eFaeunzHGEKgws
 CwaoqfIn9VsY+PuXSp3SKyEHosFsmEt6ENvIMOsfkBdhLJsuI4xSFtm/ZCJ2u7fL8YKca
 aQU9ihrJnEfWpXkyAYsmRzGGqsytVI8myrgVHbLvRGCHIbT31ZZgR9G3jlt48e63ILOLc
 incZKTBy9jfH34rCnddRSD+N+iJtxgUXIp+wXyWpvo0T8BCiLiw6KWsJNDJcUAPZDeA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KWbQSvCS; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9B60607E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:19:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BE6EF4E412BD;
 Thu, 22 Oct 2026 21:19:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CE8460763;
 Thu, 22 Oct 2026 21:19:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA985103281B0; 
 Thu, 22 Oct 2026 23:19:30 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:19:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <atp93w-opCbFpICQ@windsurf>
References: <20261022195040.3750619-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022195040.3750619-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/wget2: bump version to 2.3.0
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 09:50:40PM +0200, Bernd Kuhls wrote:
> https://lists.gnu.org/archive/html/wget-dev/2026-09/msg00031.html
> 
> Added upstream patch to fix a build error detected by the Gitlab
> pipelines with defconfigs br-arm-full-static, br-arm-full-nothread &
> bootlin-aarch64-glibc-old that would be introduced by this bump:
> 
> net.c: In function 'wget_tcp_write':
> net.c:996:24: error: 'sockfd' undeclared (first use in this function);
>  did you mean 'socket'?
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

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
