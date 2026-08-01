Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A36C55173
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 11:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FC64079A;
	Sat,  1 Aug 2026 11:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9Zk6srZgQ8G; Sat,  1 Aug 2026 11:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5CAB407A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785582748;
	bh=F4SUdZ73yQSteVBAoJ2XMC2yDU8ty2edHfH6/fTA5RI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gCpIcGZXs5yRpJufQkeEnpR9aInCHviwm2jTMR0xyKwdm03nOyclejD0A3fIy2sNk
	 nM48rd+cfPAq7a8yigkuaEFoc2+9WTwQRCcmv4c+IdK9SIW537Sgd4lkysLsxGB5Dn
	 zh5kvd3Js79JdaHHqZhRL/aKf7k7FRO81ZEbW8lea3ZGLPZr/zphj3lPkqRoLlbgkU
	 Ol8Ayrd9BV1Fibuur8mQC/MK8x0POIp2DweFmCMeNAq2ILprf3dxnSaQ0rqLovI6Vm
	 CEMF84uLkX8ZVvttfqDwbAD8Un8hV1n+TTd/wRodAEbrvLn4JrE7D4+ZQB+Mnja4YB
	 pATXVC5xUVbaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CAB407A3;
	Sat,  1 Aug 2026 11:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F2531344
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 919826079D
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79z2HxkObWeB for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 11:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D61786079B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D61786079B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D61786079B
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:12:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 85E80780383;
 Sat,  1 Aug 2026 13:12:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 13:12:22 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 13:12:22 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260730200118.3547779-2-dario.binacchi@amarulasolutions.com>
References: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
 <20260730200118.3547779-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <f59ac2be387a332f240b3f81f05dde5f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785582744;
 bh=Gck9FpxfxTlBlDy/Q6lUCievuL1dqeJjMhT93jBRHSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oZkl3jBN3d8wKfDVSKDMy8QXKI1yV+Q2W2NK5Dan0UjNDRvb/xiGqPRt1c0/v8PH/
 8LE8P7UoASCzrta4nCZz90zFvZDrbDd20MNSQh3L8hpeaAG8VNw6MF4BOrnYn6lqTJ
 iS6J5llAeIzrs2EftCBkxkeuj+mzFQZA7twbyXJT4rOb5O0NRSjSdiE7tXjocdMRgV
 SbfxI64vAPN/6Y70s5eXNvUnfUqLfT2J6k9F54xHA4dNICy98vwqT54r9tqh0Khy73
 48HeUdvULxJLRbCxzvb1wMvQRFsfHdl9GnsdYf1jpZKDmqK/bnNLaFfADieZZAtcL7
 q0HEQ7qytc6Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oZkl3jBN
Subject: Re: [Buildroot] [PATCH 1/3] package/openblas: fix build on mips64
 n32
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/07/2026 22:01, Dario Binacchi wrote:
> BR2_ARCH_IS_64 is set for mips64/mips64el even when the n32 ABI is
> used, so openblas was built with BINARY=64. Its build system then
> passes -mabi=64, which conflicts with the n32 sysroot:
> 
>   gnu/stubs.h:35:11: fatal error: gnu/stubs-n64_hard.h: No such file
>   or directory
> 
> For openblas, BINARY refers to the pointer size rather than to the
> architecture, and n32 uses 32-bit pointers, so BINARY=32 is correct
> there.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
