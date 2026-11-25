Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A1606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 04:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gJsky7t8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=x+qtYKYJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FE380CEE;
	Wed, 25 Nov 2026 04:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7UZJJr3hkMz; Wed, 25 Nov 2026 04:51:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C09FB80D15
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795582309;
	b=mtaCVxzaiFva/dgc4x46DsGjy+ujLP7R8SgKrHxfO/iFR5JY7fc9fXAr6NX2NxBeSFwN
	 gihifhUx8Zv9N2F0yvwhSQyCeSaKVcm3SK4iekucgivICX9Hcvs4VQXPuJAa2qrbUibmw
	 Zgi034P0jVyQtIc+GcGWGqJGoDUALrRkmtmIAUSqnUg+j6qUQ6DXHB26SvlmxzyLVVHyr
	 BM5Ef7R0wvAlM8KbbILn+UjCddDkvsRMhe9/OHIlWt2akGoXqFpmkxoDIy01gH7w4dekj
	 cokC/suhblsBcx/NhuE4vnFz63rGP9IueWAMcaULdqLepQFwCm1bFZgjgEcBxnSKXcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795582309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=oUYOH7Y1Qn9vRDT2MzMC2qaU6ZLyoO6O4SENKt+qblg=;
	b=Ghsvk6C3H7vzCO4DJLhdSxBZRZOwkfr7hv/MAm3E9EXrZfaUrDd/lyTADw21e1M++V7S
	 KemWkHQoYbDSy907s8K6naGEmnnfxOFMb7kgMo2iaMZE8nx60GyfCDdkrstxcAI2eoJmX
	 m8NSLQ+slY3/vPwKK6ldqEQabN8k/64gWENxfA4rEtxSKlpifUy8zOK+WmKjU3XjOFkh8
	 XFTDistzh+uwTI0ud5y8pFmzBU4mRj/RqaE0PJTCwGCWiISACORrWfPJZRoqteN/Q+mXw
	 UUYmPRIVVu4qBtnfiICYcuTQKRNuXejBfytH9aADtbIyst59AK2Kko9iE6yvi4kmuaA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795582309;
	bh=oUYOH7Y1Qn9vRDT2MzMC2qaU6ZLyoO6O4SENKt+qblg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJsky7t8xBa6eKEZs8tJxGXVVvTepOhGkNJqSMUhX4Cre8VtbvMwxbElvYHokCuR/
	 lxAsD4qHcb27lVSYc+vvfMW11dLemX4uu0kdrNAS2NLwKQjqgsqbnjP8LwxssK0QuP
	 wiFLM/P3catch4qa4r4WzCCD73N8IwSCmEr8Wa5rnxlZDU2wlmj05aOkei4OVotJ8G
	 GYiG/0bY++0ericEt0oR/lgq52Vbe7HYRk2haXD+b4zAH5dt055blAx4CM06ZilKD5
	 zPHpS8HjZSPJklock01v+Mo9lMLtySpN+1n8cA9G4dD8Fig/C5D0AzNlRWBUfZHwKh
	 AMdDVmdVmDujg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09FB80D15;
	Wed, 25 Nov 2026 04:51:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E1361AB
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7450560865
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-Rk5GckmTCE for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 04:51:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A56A4606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=x+qtYKYJ
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A56A4606A3
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1795582305; bh=1iuT4dh+aYsHhcKa0g2mIKJZI+qqvxlfjGiuGstZbvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=x+qtYKYJG/dymn+YuXu5wMMR+dLVWDCEazRulZyoU1e6yi4b9P5Lzyi7R4vWLbJi4
 5rP4h5fSM60rGHI8vuTIJf81uA+RzoENS0UzPNNCL+zuQrX4/E7a/clsTT4oMvPyJ2
 KwU456M0zSl3llBxmXjIrbvrHGernQmTOvPsumec=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 27F0CBDE146D;
 Wed, 25 Nov 2026 05:51:45 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 04:51:45 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261122004653.3725606-2-alexander.sverdlin@gmail.com>
References: <20261122004653.3725606-1-alexander.sverdlin@gmail.com>
 <20261122004653.3725606-2-alexander.sverdlin@gmail.com>
Message-ID: <b5b2070359ca015495294076e65ccd08@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v3 2/2] DEVELOPERS: Alexander Sverdlin and
 Andreas Ziegler take care of syslinux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexander,

On 2026-11-22 00:46, Alexander Sverdlin wrote:

<...>

> @@ -133,8 +133,10 @@ N:	Aleksandr Makarov 
> <aleksandr.o.makarov@gmail.com>
>  F:	package/libest/
> 
>  N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +F:	boot/syslinux/
>  F:	package/mini-snmpd/
>  F:	package/network-manager-pptp/

Your version of DEVELOPERS has one additional line which is not (yet) in 
master or next. The patch does not apply without modification.

> +F:	support/testing/tests/boot/test_syslinux.py
> 
>  N:	Alexander Varnin <fenixk19@mail.ru>
>  F:	package/liblog4c-localtime/

<...>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
