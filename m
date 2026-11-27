Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4F606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hofQgFoI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AE81608C4;
	Fri, 27 Nov 2026 15:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3W9tOr8qVrjw; Fri, 27 Nov 2026 15:13:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F153607B0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792437;
	b=GXxZj6bunu3mddasT9KskBBiIjLRlcyByx2F24Yja0TKd0FR4kTBIywWWXTw6KF29i6S
	 5aRagSfYE43axs2ITQNKv5ifS6sgVwMJW4EFOhVvg3HuzLWxi+Cd6BICj8VtGpM/UIOqS
	 aIbRmGXvevyU6AvfRHOxuNDR4UsT2yH8XsPQuI1nk3RyBOO734drehQE9oTb2qX5o5ISZ
	 nEnOzTnwL4klZZ0LiysUm7rofT98A//r9m0Z/hN1mBiRl6DfsgsEneYtLMniCM7GU3pBd
	 eb5QqWeriKOnMz3BOf6StDCQIKGGWv4LQSNuGqsvGluMqg2VGckXkV63FHoh0UE0WTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=MRj8xJFCe21rpJEBAGlw6NzbhdLm0cwvN/qnSjpoucc=;
	b=eQX6BXbhL2uFpT0r8tSJfHr33p53UrC4YIqgLrQw2EwYPio3GNj5EQyiy7OAbVeU/num
	 6I3zV0U96UPVszuMXHlGHbDtwd3a1jtnRkRzoT/nvwHJFWActbakTiMPVOp6WnsJETGPf
	 bvlkmuehSInKkERr7XwANMbT3FGre+Dzd2nsfaLoN0f1eoMdNB1XKC7WLL/FAeXwDyFXR
	 HhMWsLEic6cuAxf1kjJ8jbVczsutiytGR02RTjxwOgN8JQdEMn/KoYVLWbdTz+6hBIiAC
	 sJjSG0Wl/O1M3Y5M9hrbiwTQnuzs6GO/c4+UVZhniMzgThXVnN2pJNHACXd6CYDqJ7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792437;
	bh=MRj8xJFCe21rpJEBAGlw6NzbhdLm0cwvN/qnSjpoucc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hofQgFoIBwYSH4CpTETPrqvECOWA7CKKpvilqDdTn+G8NtjXjo9dKOzmloxLYxdAL
	 IP3nlooUCayCuhuJuy1f1c3rtRDOfB5iHLXsmoQdMFY7YhamCNII0YoPNZB03nuT6s
	 Ue/KVY5GeZjNsNQnTlWj8457KtpzXBgGgwdZu5BAZmm4qR3yf3Vaz6sgGLjoGz8yac
	 1/yiq1tSd2ChM0PmkQIWxqTOAXHWyY0+e6hu94mHJ44/+RhdhTcJ9080f6eAxRN0yE
	 BJFVXOlNPXEZbyDaj4VKS+WcbXj+O/eKHCCH/O1sNFBIr2oYDJncsHfW+srU4ZqNvS
	 g6xa0S8q7tsSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F153607B0;
	Fri, 27 Nov 2026 15:13:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E652BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 064A0409A0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnukMPWccd0H for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:13:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA0B440925
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA0B440925
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:13:54 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6FFF22C822B1;
 Fri, 27 Nov 2026 16:13:52 +0100 (CET)
Message-ID: <232f987e-252f-4460-a56d-a5571cd97c68@bubu1.eu>
Date: Fri, 27 Nov 2026 16:13:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261120102523.543165-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261120102523.543165-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix
 <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS for host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 11:25, Fiona Klute via buildroot wrote:
> Host packages already default to using <pkg>_OVERRIDE_SRCDIR from the
> matching target package. However, this did not apply to
> <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS. This meant the host package
> might rsync files that should be excluded (typically build artifacts)
> to the build directory, and users need to define both
> <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS and
> HOST_<pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS to avoid that.
> 
> Fix that, so both <pkg>_OVERRIDE_SRCDIR and
> <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS are the same for target and
> host package, unless different values are explicitly set for the host
> package.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
