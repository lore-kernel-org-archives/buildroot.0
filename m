Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C2606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pjKjWVtZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C7840ACE;
	Wed, 28 Oct 2026 19:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoyI52yfgMAf; Wed, 28 Oct 2026 19:21:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA87F40A26
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793215312;
	b=MExgh9ApnSTB6aePEAvbqHs0UuaAClosQRMtrk4SdmoIs9PHzaaSDJkO4MK+YZ06NA0E
	 olBaIBACBh0PJTI9XhkT4WXYFJcJujhkJbYXoeSwoQ2mae4Xp57eP6xbdPzHF4g4bzABs
	 Yz7Jp/b41MQDxKaj8a5s3k+6FNvq6aKcq+/apdt7nKyoVt1WfDEaTtfQ4bmWOmANC8GSZ
	 2SIAWxiBJi3Fu1rBvl5SfsoApE/bOoSub2XdGQ2p6PZeUFzkAGpbKxTwiYOPhDqdQ1+n4
	 eLSECkrBFMZr8mtot0AR/Vt3dFBtSi2binQvD3Qmr5m/1ZaSbSAO0ZNb9JT5GDTmbnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793215312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=VHyn+IW/zWlao+Hr2V1rEdvoWqxJdPDXBiukZQtbB5s=;
	b=WCSxeedVf29cGHsPD+v1lpnH0EWu+l3Rhe1fpw+b0SRuWqHf7taTKGih8QdhIkTMZVIU
	 nnd3v9knXx+ii6uB6+12dM6hjpRGAY398Lj5MiGrh2lKE+uJfJNtAS0lhDBAQrs9fR5wm
	 IXX+KSQdFydMPI6yy8yzTk0CNFjegXfV+2v4xzTHqh2LwZ47jKvUGxqJRoz87p9hAHFby
	 rUS6qmJuBU7oCJp9+zN9O8HqePAFdOuAtSUxCYc3VRge1Waw8tRdzxOtKCcU9BB0YyGTm
	 Hcu/aMiHiw5x6JcBOWk+nH7M2Qm7jADVtly3Hj+AU0U0Mctq+F68MKM4E84MUVejjqQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793215312;
	bh=VHyn+IW/zWlao+Hr2V1rEdvoWqxJdPDXBiukZQtbB5s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pjKjWVtZ/MpZPEDN5mRIhGGsQKLR44kO6FOIUJIRwwmVP3B7gA5w8iWmbZoE39WPu
	 ebvmtKD5//+JTT6knmCbdQEC23rOKGPWeNJ7aJK+PhBF4YHt2HDSZBsNGQVXTMpiQM
	 PoXRv6kq5LvR8d+qVClg3N+jgPP1Mi7CwuJUD2DZiAc5nTj5+6Xj8w2M+6n/ASoNrv
	 W1+ec2cD//evmmWylA9Io//6D2hQRoqsD2pvrcBuUzA663ARPYCjdV19HigGS5vS/7
	 KrzuF6FhNrZer3i4H6y1Iuh0eYpoBNkS45FAPrINAQwpR8pJkP3vaTHmSgXMuA9kGY
	 3Ahwp+AE1L8eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA87F40A26;
	Wed, 28 Oct 2026 19:21:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0028120
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85C0860780
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sB3uhZlBgh-a for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 19:21:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0D5066074A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793215310;
 b=LtWtIo+2pUtjI8Lh32G+jotudJ4tDF7KVN21rbUF2q45Nqc5CfKhWpD3MLsaYNpEBQvy
 adabQo+qAW+0dWFXlaMZQrUxbT5dKB0CJzpQjPaF19mH58qDH1adiHH46Pyc1o9nmsdQS
 8RdfSp3dO2zNXvbMmW96kOv9hKmVIVMLM8vL7lpeuJk6aN4LDdGRXaOLjJRzPhnVPbRJP
 l/9B/fukP3iGJwNMTXhEK7bQVyjRBqONY60BoQYI0dRrcONRjcUcxaSQoRRCtlVzOyS2b
 QvEJfIcinUbUDZMUwlQSN3lE6OdSHML0OJo573pdqDG/80e8oRf8iHp8jue6RNP079Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793215310;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=t+bXSioKDN7jbeG8RTaCp3Aw/ZGP+//gz4AVhLeDowg=;
 b=So135U/XJWXibJDFFITg0CIst42Z7Zm11qSz6VcfuOAOYnvo5mh/a1gfxtbE0YSjAoGF
 E9AYARIWp7XeVBvieHUUYCZqFRAe79rpaMNMJ0Qvmq8WZrZNne8y6P67Uztpx2/B57i/d
 L3tqzaawpLocM7p3XJYouJ8hUzT4Rl8Ntcj3YkAsql4wIIfoGR8p4TpaPXWNq/dx91afj
 nMk9c5vNe/w60Hf6+KEY4reGhQWeV4xW54gMWkSlp8NXE4egc31vRdY7yvgJfykRaTJFI
 KF9yZ5nOfkhXB+frftb92KsupOAeydf09X53biVDeNQ4HQY1G1138026TZyuWg03MEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZZSeWfcV; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D5066074A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:21:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2049219F5A5;
 Wed, 28 Oct 2026 20:21:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 28 Oct 2026 20:21:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 20:21:46 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261027194638.2165377-1-ps.report@gmx.net>
References: <20261027194638.2165377-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <f701452e751c19574c6a9ec8eeea814a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: security bump version to
 1.2.6
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

On 27/10/2026 20:46, Peter Seiderer via buildroot wrote:
> - bump version to 1.2.6 (for details see [1])
> - fixes CVE-2026-102486, CVE-2026-102483, CVE-2026-102484, 
> CVE-2026-102485
> 
> [1] https://lists.ntpsec.org/pipermail/devel/2026-October/011062.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
