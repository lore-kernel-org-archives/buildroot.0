Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F272606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NFqhUgE3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE88E60A70;
	Thu, 29 Oct 2026 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz5GOlDQt_SL; Thu, 29 Oct 2026 21:36:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3376160A79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309803;
	b=ik2fHSqcd71ijrBRNFGUHN2dzvYy3vzkoYvUEE0lMvGHsN2JzP81wW18ERGOBnnV9MPM
	 YYPmZyk9BE1kYxQ1/SbuYm7+pQhXcVPQ/GxAIBxmFaiN22pfVYdIoEZ1Jux/2/YfJQ63A
	 iswbHGGcS8oNxLsUZMzBY7pZAWkcvAxFXySFqA7Whcjn8DNeaJnYSX55Dk1eDgP1vsZyU
	 zDRs19bcTLITouvf4ihuXbHxBHfVjvkZf4lL8NR3tkbyFuwCMrMOOpSYRZ0Gtnyp+gv9x
	 LFRg4IBEVcnsgDd2QCAGmQAked48piTk3HBypqkXbIfMVe9jpmHGHz+uBLGuGmgOv0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=rlFowkDYZUIVNk200BF8q3Ja+XOjfPl0eAuOQ1ixSLc=;
	b=iLr0g5j1wvPZS8I79xzRn8AbA1UkFERx6V8bDrQ0Rra3bVo11Sz5SRf6tOZOxOYeb+kM
	 l0D2oh89uBvorguaMfIthgSR613mS1hwJLRBX4Syl4fs/dBzmOkCAMuzS4jTqh1EoarUO
	 ZQ4licYNBQe3WWiDH1lYN+v23yHVOKOWp6ngMUiyk8a6HxV3m1dF1aCeP5TF2CA53jJqD
	 jLBlTZ/DcK+VDHnAmKKDNRYUMKYIsg70RHCD3ruUw/IulXvE7mC7WYaHCheEXVQ9O8p/o
	 d12wxpQnIIlONQOGu4PoPLNVWMyeOGumTnLdR9OAWaf25awgNpw2ns/BBg+nqsrR3EA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309803;
	bh=rlFowkDYZUIVNk200BF8q3Ja+XOjfPl0eAuOQ1ixSLc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NFqhUgE3O+onR7lNki/2MG1RB6Z4+GMby/v4CMIy4e5gX5TFcKvxsdv2aFJoIYKVI
	 8uFAZdzP4W8kbQcNJ9FNQXTS3D6hk3kwEtJNqzKuMpwE19RPfn93WADA1QeBjFEmlU
	 5gxCHUZ8Z5pD9LaCX7ElhrM5JOJ0IhxjzjC9VX1RN7QuwUsluZyLDqW2NX6oCO9aMG
	 aDk0G5is4uAoa4alxWDgUqzLK0e2UpRSdfzyB88DrrAyrbvRsrpGyAmD+M8GAesF27
	 64FcnF2sjTVYl6pERE9+lr+wTjY6sDmv8pn4ZjKnOB01xyRZGk5eXEMbqfLwoa1gOs
	 +cS71Y9wVPw8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3376160A79;
	Thu, 29 Oct 2026 21:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 435B4712
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D1380DF9
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wk7k4tMVwnSV for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:36:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8C95080DAB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309800;
 b=W+mT2UOT72kSVnO5GmmZV9SHxKYMaOTZ9aWWUT7E1ew70zDt1Y9jzTputmYiRhoBFFpy
 nUZEcqpmYbfhMLHK55e6fCWLvgslQkUavanzQgBS0D/H4qtxqBUKyI5q7sazSYvMFsDPJ
 ti5zc7seEqjioatMRsiiRvWfAy3eJvExo+S0/GXQT792eCcFve++UfcrzqvFqME52hmEa
 q/+ok5MPJ/tIJyYRa58XgsRFb5NtACC0WPIeM8WQsXb+VCkzebcMsS2ot55MkeOMXzpz1
 THgdtJn+JNZ1+bdbhMqu+3dGCHRggZXOPbvAVikH6aJU8Vud8dGZCVexwS+GhHdZ5dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309800;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=tKJI/B51qlMajp3MF9pPekcZqgP3ZMkUX8YCFGX/e2M=;
 b=C7lA1wAol/RCtJYrb+qQmsZTS2iT0FAFR02i41T1NCwNpv548G3BdcfPb9QBOI8koi+h
 ZKb9WJk+qHSs1RT3Ifa5js1mkt1rw+OpNrTXTxYrc55Av1tHz7VLz6bEmKCT7igNlcpjl
 E8LRv/DdiVtybPWW4L7zGCYSoX05nUirIeJNHJXj1DeRm1S5IMfA4QDyB++3QKz75r3JT
 tZUTvtZeun8H2HrVUsDNc/pcKBKCWMfGadPKgckFwiZwqCV3052N66igIntn3a5GDO3yC
 qui2U2IcaEzRISy5Ar1NDK7TrWxqIzWTWW1SCY6Habqgq1DSLNPYLCZVOuLgs6mZwhQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CpIv7Hpu; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C95080DAB
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 103D113F899;
 Thu, 29 Oct 2026 22:36:36 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 29 Oct 2026 22:36:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 22:36:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261029211102.1455105-1-bernd@kuhls.net>
References: <20261029211102.1455105-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <75bf03436bbd26986d4c674167abaa27@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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

On 29/10/2026 22:11, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
