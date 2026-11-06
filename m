Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0680606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aF4VBwGA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9DEA81700;
	Fri,  6 Nov 2026 21:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfZccSP9d4Ki; Fri,  6 Nov 2026 21:23:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F368C81701
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000232;
	b=oywccLtiXgvbAvj3tIBRm6OJ/nYCBHN7hmflfA97f0P16oK2enfCKNORp63WczlamtXI
	 1H9dWehceu6av3fFkJ/3oPdoFWiEQApzLdIGyrIy/Uz6or6eu1hNn1U5GaRG6ie/D9GRT
	 7R0slNuaRWfW72Q29JJtvmqCypZb9ZTKBHAPskciIcK8j3qGMxCILf8UXuI8A71jJzXEn
	 JGY50tTaIN4dOKGnbavn1V2hsksgu120DzIrSsJjR43OBELiC7CraDs2+j3cWaEVWoalh
	 xvSI5MeeHjxLzL1RuYYf/X7P43M9/5rmtoEv/sGPrlxpDFBOwveg6G7KMD1vgLY4orw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Z0V4sYJO1VbB3myIAgpH/1/HtG9j2tHBq2x21eEJDsM=;
	b=PsOjCq0tMxt0yMOTRcxWfxZIOZSGMltQoDrUicfFE6lWp6SXKvHdiSovdEoM6ggrdF3u
	 lRcf/yjT6b18NNLT/6DsS7GAENHTj9wxFT9YGHGwhmCahYWbFh6+fm+ssgjeNRVkgx9I/
	 BozIZnSmUWZbVn2ljH0xdcAzXofMWn3RE+NHbAjEJVteFH7g3Pwo4c5F/hgAyh59nNp63
	 A4C6HDemqRibaK67Ez+0j3EZTugVdbnkNlRmkY60zbg0awbIBhb5VEiQ6vg60Q1TUSA9W
	 WT5eAR5K2fK1WzoHb7M+aciHI+OLVjnTJ9A84sYk0x+EyKuKz+h/6oyxScW699W0b2A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000232;
	bh=Z0V4sYJO1VbB3myIAgpH/1/HtG9j2tHBq2x21eEJDsM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aF4VBwGAkM4Mpw6QgXWuZftAs+G+b/bVeE2XSqWwSjL2WJFn7+7yQ1uGsSQMJeGo/
	 R/gK+b8z6h5Le/KrIgMpUPoew1RSRQagf80A2fEGqEfec9eyw/Le2mS+3MAn8A2w/+
	 ZipfrxCs5ILq8lSAqtzOQ679UrPom4qWzNmA+9QRs+00vzkUZv+fdyAjV0qDJ5phdL
	 EF+r3X6MnM8Ej+g3X9LC2lgGImGje/4/e4SbQF++L6zwxB/yhnC2+iXYvWZF47DBzu
	 M8c+G+/MckynBj5gIuD9gpkPnuKWBmvafaW72fUQlPsrxmKRm5UNp4ZdExqA9KJ4sz
	 giaeREVwvX8zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F368C81701;
	Fri,  6 Nov 2026 21:23:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0A7331F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6B3D60B58
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf7F1WUgYa7v for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:23:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 37D9560AAE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37D9560AAE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D20A72003B4;
 Fri,  6 Nov 2026 22:23:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:23:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:23:44 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20261106191536.2120153-35-james.hilliard1@gmail.com>
References: <20261106191536.2120153-35-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <894581df3b327a0ba47c0d650d15ea11@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-wtforms: bump to version
 3.3.2
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

On 06/11/2026 20:15, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
