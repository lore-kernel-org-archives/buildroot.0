Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB3606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DvjQUjWy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62C16134D;
	Wed, 21 Oct 2026 18:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJzRUK8AvPA3; Wed, 21 Oct 2026 18:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4387B60B15
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792609016;
	b=oAeeSNXbPfk8z/uauGnLvL4fBCZBd8fO5S6o5bZQcqQHKru2RQbPfe06BFh3y8nVS9Ll
	 oJdBeBv1Ox9HYLunbrO3EQQuww+wFQJFtPt7bEpkePEuBbpaTaCZRiEY67BxoXQloki1s
	 zzdxzK/0wSX1krUs2GQQltxkxBIRQerykFAaloZ1x2b6a+NJpeiXrzd7TlMSazVIQb5bE
	 Ta/30/JOZyJ08HX5T1sNrd9/VDBkaAfB/qQU9OZUdo7Lzt/lDQaa/1aAkJJcKLOF3vSNW
	 hm5YxW/rpFqxfJAm3Aw6MdWcUK7ZlevZNcOVWSVGph8V9Z7tLdNpuDvkP6W/J3fQiFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792609016;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u6Fb36WI3C+9Xcn8aESX+P5nDuK+6kvgW8DA0LibU08=;
	b=lloF5K5IJcCAB8aKAoc60Elard658OH/hcwOShuY6lqyIzKeYPXd7T+gWwUKhOyW+2Da
	 7V8NR2UzKuSBZDay5nvpEQD4UClEcM2bgOAdoNyEd+cQ6EMmeRzzyvcY9LJ6hYSe4tXRe
	 bTK3LzNMy0L2uFVKhix844ZAe5E2G6NWfhIkwLfgt4w7Bt4UYWvWJgOtFoUmlYD6MMeYM
	 wo9cHxavKzKqy1XvDglCNeVGzyDU6UfHn8sRV3yjZgqEUowLp2SllMu3D9FUihedT0t1E
	 MWcdkpA1ZiDyFnsQcUyDlMo+FAJp2gpTGURkaA1Ck5Srd2+bwXy6r3qpnp0+K4p0n9w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792609016;
	bh=u6Fb36WI3C+9Xcn8aESX+P5nDuK+6kvgW8DA0LibU08=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DvjQUjWyn4IzyKyC/lY3k7aqQFPq1aMJX7NzeDdBV5bZHPWTTTtJtprBiqKa/SPGh
	 yRlueCzXtmc2IAkRtpUwR7e+E+nqJT7KZXix7H5jvWn5naCxrSCGv3N295K6Ws8iW7
	 +pzW7KbUyLiwMC+KnWxxrMTrX5EUD4peDFPvP3uD3OAJ40AJazpz4cJrFjglpSwB6E
	 4UcYjWueE9Ui+Z0ZYqsOBGepknC9WBbB8e/F+z6sx5TqlOWULvA6L0RTKKXqz3YGrH
	 WasksMMVjxbAjyLMkewYBgo7Un4DgWAed/8e2CmhUwfSQChUcnz4JUmK+C+s6rBfnR
	 Wn4hLL2sJir4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4387B60B15;
	Wed, 21 Oct 2026 18:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C5F3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BDE0841E3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9RFYFo_GZsb for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 392AC863C7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608941;
 b=puOUx8nZd4cyeMSLJQqifKcVwPpcLxGd6I8wqWDnX+gJttrU/c2uqo5Ybkxq6N06Xygd
 8IX2Om0/FvqX1wiXSQ73sERdM47Kxs1oe/NVn+PX1yrkrz7AtsI2cQDMC+ZIK+VXGQpzj
 3lFM/2uLN1OP9H21On3TRiH3Ts4k/5tR8FXwLc6wMRQGXoSDMeezouywYNgFydPLu9O1I
 7EGojXgYGKbJD3kOCi1ufbLXmc5xg39kntRUHF+7TyWTbFUYkPNGq+3N5vWgnZdwVb0TI
 OpdE7vh8J81tHM4eTpY65Qi3uSKOLTxxmcweO1ont1cB6D99Eho7fMzDavdx+F7tldA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608941;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=zyqa/+MY5HJaupjHss0jlUoxaR+SI5nBTeJnsvKdjXQ=;
 b=YV/RkC2MIX6VUED21kjM/X5jVPDTowweJ6Inh05JVK8xJEh9+lzQSXsmRI3hvdqjdIJl
 9kZ3vBEI7IkOThfUr4vJbvMicqjcOZ7b5Adxw9BE8lT1d624qcoO+uTgOK5YFKSs1p4F1
 1y4PDRclnU7xlDbgGgSKO+AylsXWqYfCR1bg5qV1slrwLwkm/MXAB4FgDiw5dXvwhZjVp
 0eCMtb+QYFhjCbDMsvbjvOrSepScxz03qgp2Xl8YJbmtCpxoPA4emK3F37VCdHZU7d7Co
 o2dBA2l1OlaGQbfZ0dOUiZBoxtiBIS4VSOfEWyInvBaGLysH2TIDIoZPP+x8KasD0dQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ob5VPI3B; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 392AC863C7
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:55:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 827704E41266
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:55:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 51433606E3;
 Wed, 21 Oct 2026 18:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A0FA310328E5A; 
 Wed, 21 Oct 2026 20:55:33 +0200 (CEST)
Date: Wed, 21 Oct 2026 20:55:33 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <atkKodWLRXWa1jy1@windsurf>
References: <20261021171000.3332724-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021171000.3332724-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x, 6.12.x, 6.6.x series
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

On Wed, Oct 21, 2026 at 07:10:00PM +0200, Fiona Klute via buildroot wrote:
> Update the latest kernel releases to:
>  - 7.2.11 -> 7.2.12
>  - 6.18.57 -> 6.18.58
>  - 6.12.113 -> 6.12.114
>  - 6.6.159 -> 6.6.160
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

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
