Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1A6072C4A
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dLXYvhbb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A5960888;
	Thu,  5 Nov 2026 19:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYW44fm8GOl2; Thu,  5 Nov 2026 19:34:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5D42A60833
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793907284;
	b=jJyD+Sw4HZxlArGZaHYcxidQXaTmgfQRi3NSLXaAhyP48MraxerQIkt3sw+xgCK0muB4
	 P6KKVIKz9/mP1CMQzJNOswZMlSJ6VDj+htcspHW+3zx6pbmuRolUiPITjXvc4zdXK/WFm
	 60zzKSA0gkC4Pb43x4G0Yhl5oCb5ecbSnstFId45wu1t9yCJX2gi6DoexEIQZC2tiMvyd
	 pGFfVRjFRNftgee5IwrNJDgfSbTAeazZZ2DiQ4CFn0+uDmVKJcus592zKend9rypYcSPZ
	 8G7vAGfPH9xkrNeAuiqE+ZERziLdaaJIlb64uqq4yLVzJWkSMnc0W/nZwrSqaEspOHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793907284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=15ilR3KnPfDsYFrmkWThQdNFzgNt6azpBCodoLfM11g=;
	b=D2eXmY0f4+L6FresCxaSkAEzUsubS3zlSWuXJuV5/7OFuqdXb03MhCf2nR0t9oGHCBE5
	 MU3I4MEAwWQCUFB+xuouMkp0B1AB3WJcNnpMguECAhfyC4XAotY280HuWAUe+9tV/gIx7
	 wi8mDgZ1KTw7lJVnLERK9DW3xsQieolUf8V2egrzWEQnkhj5I8x130MqkS4ZHBIuUEQR2
	 33sc6PVhKxcABYKJHE+Ldjrc94GxKRj0oiyqyyZtGS2LoZqNNvniokVCI/iyScsbfEO1h
	 fu0vBdO9jYzy+kjsV4+ajrN+L1u9TDiZ4EpOqUpuIE7bqdjJ5ZaCtTFgF1VlZBR5lgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793907284;
	bh=15ilR3KnPfDsYFrmkWThQdNFzgNt6azpBCodoLfM11g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dLXYvhbbyXRH/t5SYuFiYyLImIcN1F1FhuXSEuS9CVmFru5Io3enb+beCyXJwKc3a
	 I+bnpXfxcZPARNRd8QXfgiWf6njd4t6oxGYB8+b8tnLZ6b+noHnfyO64wmRNZuyCgf
	 u3/6POBdOQoqpZLDxvYngMRtv7kp/KWQEAl8Wg+txRZraWgQeg6jD84Bq+In6iJtvo
	 jgGD64pa4GHPGrZBcD7BnhWPZn8qs+oul+OLDnNZvthMzn2IGasncWoU4ECC4Izoj2
	 DDG+NtcYdIaDK7Raum5D4MBgWgvS4rwZHEcnRAPXikT5rqfp77hHGquGpf4slxc71/
	 r5hIBf4MUhruQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D42A60833;
	Thu,  5 Nov 2026 19:34:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE480B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 949B5404E7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsveIWsYZbpB for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:34:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CA045403F8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA045403F8
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:34:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4C66E780383;
 Thu,  5 Nov 2026 20:34:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 05 Nov 2026 20:34:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 20:34:34 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261105122917.1277295-1-yegorslists@googlemail.com>
References: <20261105122917.1277295-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c4f5e3d482269d97de36f21fbc7583f4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/json-c: bump to version 0.19
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

On 05/11/2026 13:29, Yegor Yefremov via buildroot wrote:
> For the changes, see:
> https://github.com/json-c/json-c/blob/json-c-0.19-20260627/ChangeLog
> 
> This release also addresses CVE-2026-9146 (documentation update only)
> and CVE-2026-11322 (in apps/json_parse, which Buildroot does not build
> as it passes -DBUILD_APPS=OFF).
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
