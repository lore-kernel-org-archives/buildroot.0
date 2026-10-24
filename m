Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2FE606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mynJjlSK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66FBC811A3;
	Sat, 24 Oct 2026 20:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69xmB1JlyeOE; Sat, 24 Oct 2026 20:56:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A536180F39
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875395;
	b=IKm9oogMADqHupmWDuAkndqB5/UlqxYObAg91BIJQqigRa4iUfAgaojulZpvlKfPO3Or
	 RFecjR3wkzwIBr0+lXYtUyDeMQdRg3S4b4X0EHazlHSQqDde9J9YtT2whxHEtmICwI5Ux
	 v7yecFHX10tOKhdTf7veLsDf9tKReFJvmri57D2AzSROtUkdl2Sr8HxZpqhiNRhuJ0r2s
	 kM9odCyqEM4dHVBNLT5SOkKS3r1eC3XXPyGgq4Bhel3PYjDSqOCd92Cxg/R0Lxr2q4Z2T
	 4rukB+dPf5uTJJXAD+nInMKLAduvie9jgGW/Uis39Oo/CJz+le+iRB3sJd6XMy3RAxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875395;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YbVROjCHbv7MhwuB722s0ffVPW0GyJQCcI4mnuFfCIM=;
	b=kIkUz3e1CqS62joL/2vw6FiNry1QDOOexD1X+dpZY+GOckW2FQn1tKZNQKY3boz+Mr17
	 DhTE4RMBWc5aA11/dedhGDUPK+mp9u/yXvWfjA1F0sj9pMuL2t6DnifB/VveJ3Np66XYE
	 IrzFwUDLdC5Ehwe+7o7iFrpqhZ+c5w4HuHtTi7viwZC3Jrv3pYXXmlae9SGm/gexjwz1G
	 5s5zDe04gsgK8qLly1vjqee48gAuj19vJ9p5V/hG+fsLvK8Ycd4fUTx/TLp6hcItoVEfY
	 PKlpgqMOnnbS47TXZRKDF5/3LpRKSR0QPs+bFBnEG4MZQzRpPu+IXqhyDjdVX0HQImg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875395;
	bh=YbVROjCHbv7MhwuB722s0ffVPW0GyJQCcI4mnuFfCIM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mynJjlSKAeCO2kK4TzD1k79s1CxW8nPJ0bqDj++/kLMHAI6urhHYSdu9TQgoWj5E0
	 vLfg8y1Fb+CJNi4tNQLxQTgvzsKNlgFcnLC1AhE/JJEb0CbnPNhIA6jUhhLT6JEgzz
	 OFVWBNpdKJytBLzQbn53+Mw4OQ6OCBm1hNaUGOLz3omhinbXUoXLBFlC/Al8mVHfsE
	 JPn2Qo+KpSYMUQgzl72vThnvdEMeOP/dX2OuhqSGK34gg5X2IlSiQ6Zzr6CDjeDIiH
	 YCHkFlXz6asZL3w/ekDpNGLnPzace1Dn3LJdhBbF/z6ypPf9rZ8pyPt1IGiou3TEdm
	 GsYFEeqzAfQzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A536180F39;
	Sat, 24 Oct 2026 20:56:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F8B356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CEDD80F39
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5M70C0Dqio6 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:56:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DC6FE80EBE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875392;
 b=b7BSQugDUFqO3y2YQpVMicJu3tUxkM6J1vLm/E1EGes0uFeryfHChSmQu6vVafySaeH/
 2UtwHjoH3FEB8v7wQdrumoEBoaze4dyq4DoVoi7/2gMe/kkCTTLfhUFp57I2vUtvBxaEl
 nOuVp5IuAGQs+8923TBhoTvTwfuBw4mUQs4lH2uEEVNS1i6aE983pbiqsCwb24l2ZMKLG
 YF72BFMn7/xCgtAbBDJ9y0WZXCyCnmIvg/uFPHnVIQjz5Zu4VwzLestbjhfZomUWKYKf0
 W/0PymtK7AM8oQavcahlaKjvACyGSX37m5P4EoMu0Qnd0xSqAUUBL0OGR9Ua3nmyQmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875392;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Rv10g226zQHegnTuVWYRyCBD9MmvkkLQZcY2sMo7dfs=;
 b=dwIj8btImbzWEol1Z2YREABeFvxixqP4f88pbNEnQCo1375g9dS8yMGC7DJerQ7UqgDA
 I1qcCGygCrjMHNCiGA7OGwdQ94A7STWcgzYR3dnLl9UKXhB1CbUDRRMa4pDGWTPenZmHZ
 AZNdew7M9ZqNcCmylmGnlIy14kCBpxDZvrNEJk3WjPJoD221rwHES0KXwQHUvREbk4ACu
 oAlCAUPpIWTNxcglGJW8xHDG1OcLxYACBwuPnYjNpaKWcBUfbp3HQIOGcZ2F55gddHypl
 ESpikbxsPFicZtRkd+zkjjFHniWHkTr6sJOlJO34xu/0ofTu6gwgLZBOBAeJabh81FQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kFjO+7FX; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC6FE80EBE
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4353AC6344F;
 Sat, 24 Oct 2026 20:57:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFD8660769;
 Sat, 24 Oct 2026 20:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3218510328DD2; 
 Sat, 24 Oct 2026 22:56:28 +0200 (CEST)
Date: Sat, 24 Oct 2026 22:56:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at0beNjld7FS71P5@windsurf>
References: <20261024193107.3293445-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024193107.3293445-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.25.1
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

On Sat, Oct 24, 2026 at 09:31:07PM +0200, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.25.1.html
> 
> Fixes CVE-2026-109411.
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
