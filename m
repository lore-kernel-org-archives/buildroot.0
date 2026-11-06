Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C946606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H/wbBOyN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3721360A6A;
	Fri,  6 Nov 2026 21:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXOLPHtlFZcP; Fri,  6 Nov 2026 21:16:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6E0E860A40
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999783;
	b=Bro1hdG+wvkwL3LiLkh1reIcIVbqZCF/jCEmYbtJSajT71whbGhkJAlGR00LUhsPDIEh
	 j2w2N4+KllFYJQhYadmbNjTFT5//2YnNZtcoc0elWhPntiNvZpj4dfBJfL96c8YPCfuiH
	 5ESGgxj0/gjCvXoCAON67K6/3+H+vcHjO8ZDbC3YKKovhi53XEtPaO++PN31OMp8OrTeq
	 EZRscTW9lysi3mZI8z34nLzZcPmq2JehBDMFG11TsBlbgYo75z1+BEqLF+LNhvpK7Z+Oc
	 oRhfaFsdiBYHj4hiKwsT5wAUV/wRJePGEviEofBR+RzbOjs40SKyvIS+87I2fAAgFiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=HHA7jtxDv4Ofq9s7UcePsT0+zCAtSkGxsaUxk0ggOlS4GxYtQ3SE1Sk1fgEnvOXLpy86
	 cnBE2gbpAach4ZuZSBnhX/9Lq2DX23r2ovQTY36euhCUKu00AEHwxtysCjYYyPksyAEW3
	 l82+WqUFvfE6bNRY0U8cbHanlL39QHWdFTypi/iJu/ffpB+qjENmXkOc8AUG+0jI034Nk
	 yRJqcELiCNEgMH0gu6ICYUTjf2MuBcQgvoHjRXHtZyNjPVvO2izcL4tjkbOsEXq2Mk9AF
	 LiYrQNP4jdYE/5xXEE4dOfN4bKBl3mN9sGCZt/siN+iUxkWjP3xzBq3tmkw58GaKfDg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999783;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H/wbBOyNwom5Q69wxJ2in73hRzwJwpp2xVtcklebRm6qMg2L6T+EVY9MTXln79Aqf
	 h46M7qYaTHZsYc02oZPpXwmziOAioD5QiFS+IisVRzapsZ1COZ4LfY3WHrRqKPUWjr
	 CiQxCipSNGOrzYP3b9ZttKE3sdjgC5tF8AJYnEya1I6LkTPGgESmefZQf55B5xWRGn
	 RlOihvCcIwtkl6m5+k6gL1NxCCfSESzDY8fwL/7qOkUuCaW4B6zXA0e1h3hX6ZOyKs
	 TRCL7x4lwdiXM/C7T+yu5w2UrYxMWA62hVPUVEMoJwucRMzb5QVtLmn+vG2iLJxgN9
	 er8dVuvWAPQ0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E0E860A40;
	Fri,  6 Nov 2026 21:16:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08EF1235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE77A40670
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmHDGr6d6tZ3 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:16:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3284D40663
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3284D40663
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 56098B0051B;
 Fri,  6 Nov 2026 22:16:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:16:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:16:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-6-james.hilliard1@gmail.com>
References: <20261106191536.2120153-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <7aa36edcaf423eb215ac5049842c9928@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-cachetools: bump to version
 7.3.0
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
