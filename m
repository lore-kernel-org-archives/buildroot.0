Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A1606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hI8pVlcw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 341F6405D1;
	Sun,  1 Nov 2026 17:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVgyL6MP3By2; Sun,  1 Nov 2026 17:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 49B69405B7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553296;
	b=InnitofFq3h8MrGuyOzNngRN3KnbQHjlHBo9hDaQv/ISk+TVed/YJDIojxLyiCQtROHH
	 8hgamSSJCcYAEFgympd9XHT+MGaDx3VpHjNgDBOPiqUeh74u8qDDoiT3Q67e/MWGUm37M
	 DYI7B+IkifFV5tZeqTj5Ohm/6JMkhY6Hd6ZtvOZu9sad4OozA0nV4jZnBw8U5FQfLxajw
	 nzWdE2bA2skyE+gcynkGzrKIXgRWLKvmUeYejf4qPGM8+yu6qfVHWETjOx8AtdlMPvaFo
	 CC4tWK8hFsZxwH9EWas7SewSpEjlsv4SpMER+GMBu0R3s7RVxwOUCRX7fetqoH0evBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5RtR/ClctDvP4H/YkXJqgA4oJ9+8/Zz6aNcFmnIIltw=;
	b=kx7rCUvl5pHT2hKx23AVBA6CmB2Wn9MmV5vmpuAI6NxITxi1fO1cGhzKwuKCqX63fguD
	 b1GKXURgFjoByD9dCZfozc6NEnZQPGz8GzwRXqhkPaPI2L51/WFu7VwcKjEjsQch2bDCI
	 i1A+LroZqLoSM1J+7q21oZSPDzIkGuLc9MA4UL17rQ/fJZZE4cV2E4xqg3LC5Gc+vmYZ5
	 wkQktOdXgRHjGOJbdXbX9w8iWDf1PHerizx685KanAuvN8FxyVji8LNhRrlCE6+1YAlf1
	 zq4QXU5xwua4TXviGRP7jMMHfUTT7X1fG6XFjw3JJfDuPGz8umoX6vGMya3wNY8QRQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553296;
	bh=5RtR/ClctDvP4H/YkXJqgA4oJ9+8/Zz6aNcFmnIIltw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hI8pVlcwmk0/bt4wzioSJS00bPb/B33Um4fFS8nXtgcG53Z94ywuOIWse7Qhv8d73
	 ewg+vA8pbSsaL5CROQkb/kIzyLxPPZgI1xO8ElZglnBVX+qGBwz4cJVSCThokmoiW0
	 hfyWZ5oV3g303tKyJtuXK7xTumeiHobYeUTaLEqz3b1ZxfL6YeOJMb924k873hX5sx
	 xi/huAHH0kr3/togsrB0i1wOuoONxjaibTqk8Ni5IZR0DtKqpeAJDew7812oR2D2ao
	 Q/ObjqAOx5MWKfcslJHAmMODtMr4y4oTP6nHFAfwL9QY6cEJ3d1YW0vaigqp5Mw1zt
	 3nsWPfukoReDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B69405B7;
	Sun,  1 Nov 2026 17:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C599EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32A8980BCF
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnDDhPwJmFaS for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:14:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8CB7180BB8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553294;
 b=J/5LaYkRh0Lgtc61a02kB+iMap33jWWScu4pYvHJyq4zlUrUDRGDvAUO4mHbpLmgKM0b
 fDKKZpdEF20cUKpohz8SZrtA33kYwtgJp5ZPu5VDvvHZTb2F5Pep+lXezTeM7D5GUZ0tb
 O0ITh29k5FVMb8/oaxvac/nN9TVIajt9x7aL6Ppz5zFdfQJf/maTiQG6kkNrMn8gVjsNX
 ODRLSX17il2UUfuKru36H3Au2EuFSYgiZ1/DfO4wxl4MR1QaljifiHCM4PHbWqutxAkau
 EuUD8m/Y+7lGdHHsUC0cyF6ZUZsLICCbhnH2jgYO5ITQRuaReqICe+Di2w8rm1GMdng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553294;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4x+hf3i/rxYHnwFN7gyGUO3y1+bnHhnRBH4hr4nHdKw=;
 b=F3+gj7zJ2Gs/MwoYKlKn68Ml9XzcDnL7bwlXYHGa9rAXk+KwHmij4uoGZKoEk5Lq2N+X
 WOxz8a3+SWycZkTgFm9EP+XMOEGWtdliC6jTvLR3rk9ojIZvTc2MgrkU2hccHyt2q3AlI
 iB3kMQQDbIVwpkNW/G8Yo8t5kDUBe1I61kVtKupBg1rdZAJ1vjjWIaPo5ZFBN+K6RpiH2
 yZZLe1CLiP47HoJ8fBodiHEV2LZ8sEKZnXXvAinX1n3NMeRXppU1kzrHIjZ67auQkktxc
 ZcyKQT5T+p4VmIh/waq+tCgfXOriGZSpalXmMk9RBcK7RoRCLiyc7e4XMh/YnJyNhHA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K0UhuEIy; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CB7180BB8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EF1AA5FF88;
 Sun,  1 Nov 2026 18:14:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:14:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:14:50 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031174249.2698980-3-james.hilliard1@gmail.com>
References: <20261031174249.2698980-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <960f09ccf9d182e539efe6e31c14b573@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-zeroconf: bump to version
 0.152.0
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

On 31/10/2026 18:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
