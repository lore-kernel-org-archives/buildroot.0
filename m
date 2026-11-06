Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420A606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JmTfppDp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF8560AAD;
	Fri,  6 Nov 2026 21:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YjkzKu0mJHe; Fri,  6 Nov 2026 21:18:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F0DBA60D58
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999900;
	b=odlWWVM+ajmgyTv0N6UfHO7VF5Rg+S73UNASfMD+Gp0bz0Uyj5qXkWtPDr7DzW7GqE50
	 +FTjjCjFEN7ci4QG45c6JEmv9rESlOJU/7mlMntDJ4MknT7BLwYA2kWz58FwEhGMppWwY
	 rEjlpziD69lkbRKFCnl+VWvVxwoQcWVdvY3XvZD2qzOm7SAKidSEcPpX7unxnmreRut+J
	 GwDj4a2jHzk2h2g5AudHlWQMQ2JJZ2A9ZWWiLVVEdN3xztLJ30mJmDjWyLjYhNd9PzmXG
	 5JO518T/XZcaxBj1tYexV/HvgKoz+i5zTjcZtBlO26WhN54VNi7W7FkdRuT2PjQgbDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=fbQY5gWf4AWzCdfRKXREHbODEkZ0Xa/decZPmTMIL/5QzT/zSvr+QzdVJgtiLAFRorfx
	 BftB61f3ZgdnE6fjy4EEbTCeRFGuv93TMegwEOLclnmIyE86C/9EwgmWueuyH2eGp5q0v
	 5GsGm+8nRuD+hjpo5qdxK3xVtOBz+/vYMkU9c67GuJfn8xw+m19cQO1crNw9kZP/5BFlO
	 9BFJ+bxGLQ+LvBB+ewBHEC5gnWQfLT15uiBWEMmUJ/if0ogJr9PcntAl9JUxtq87wSTe4
	 NQUYWqkP21j85WvFxjcll5dH8L5D+SZwFHLx/2S4S4XMiwH5adIXheXkh7eHeUOtZNA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999900;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JmTfppDpyqjRZ97eJ7KjGvvy3g0gUAA4eYTK/d7C2Qi3yENxj7v9u4U4V5BSJ9qXQ
	 beJoRPFXmfl4amlHeOlh3cpWlv7eCQa7sc5ysvPfoWfjd8r0hWh3C7EzVmOMPOALXz
	 /oJqSCn98P5+rVIOvfIdvbsMy7227wS4GMZb0M+meg+HMVmU7Gd/4cENMLJaHf29ia
	 qaLCbkmb5d3fsvUAibZFAy5dXqj1UkIm8p+dE0adyz//FEM1wMVuiVsG6IMSdSe7rF
	 i1+Y+KubB3C9yCreb0aEAdQZKNrTcjiwDABvWlfGttk29pVpJcVgEgXAS+bsMfCq6b
	 2R4Wwaw5OzdWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0DBA60D58;
	Fri,  6 Nov 2026 21:18:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 098D0235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF1BE40990
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ju2ktg3ldI22 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:18:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4780540907
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4780540907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 54F0E2003B4;
 Fri,  6 Nov 2026 22:18:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:18:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:18:15 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-12-james.hilliard1@gmail.com>
References: <20261106191536.2120153-12-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <63342baa31f28ebd41e2ac667f9dbd8e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-google-auth: bump to version
 2.62.1
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
