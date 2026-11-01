Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D1606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=egGsEUDY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CBBE405B7;
	Sun,  1 Nov 2026 17:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqCQfM4726pQ; Sun,  1 Nov 2026 17:11:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6BF5B405CE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553063;
	b=ZdOR2zeGbHbscnG8gjE60QfobY1EaQKdgbSnTkJMULds5JcygtYeTPSFvzje3LscGOiw
	 bVSKzYJ1Rxa0kaompafV4UaaneHJQoCjpKQmW54kYFSer4Y/1RRUny42KrO0Qin33TUHc
	 8ufVxMLkbCXBSDootYGMuvObhmV7hsCHKPM31wmyOfwfOIolk9fnoQc98lxvCnTBIN8vT
	 cXvBUXz4XLoAci3BDOSC0tf9kEc5DKec+eaLkp4ZGP24pwd3/0wJnPvJFVM7oE4Xpat2v
	 OIGO+uQf91LoLGKmYhKOZiX4BniKvN0mTvTAGOymA/NRxYuAUVurGvE82kxR0kMn+hQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=eT+5vdEfKckvMXAn9eBkDhvTj61oNVdvLpkwAr/l9M43ACM7ra6BNvmxHyAGBgiay1SX
	 0uV9ZIRN7L5sUxnMXu/+jxE8QjyVlwFxSC/CUL5PRjLOu9QbWVEK8urUNbQJamEo7gpRi
	 BHrHrohrAoHJW1eP+CMIA5GtEham49TS7NJ+EWbO3YjIeAYVITPNUdCo3nmCXqBQe3ygj
	 KSMks04ccAt/uwmTcQ935emPimdLt8aBwVz148QHll9QJEYlx+R9bmj0luqzVRJeqfRWR
	 hiPCq+K8ckxzJjOrBBCUlL8Cu/tzCQ4AMi65wSHrsSuAnG17Ng5qSwvBmYsR0kmI65A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553063;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=egGsEUDYyUGpjwAwh32JDBA0MiiPOL+gq+Ldyp4xYm8CLQryYXrJGSPeTAnYRrGd9
	 g1As1a2ywMS1j86neSJHEgskfXvkbPxP3kSEIuzj09ZZKpkal84HemVpehoSyFfpsq
	 pJrDlaF1B+NzAYnrL9YDsVvtJqGS5mfiK/A2qJMEBAnJYmvoEzWytq2Pkp+kfKFqld
	 vfs7KFfSXy1+9GevPZ6J1XLkanl/+drPjjijV9hINM92Kf11YxLV2C4jpYndMqSpSJ
	 jzOYv/cpC7/GEaDuMu3FGisIxR/6oFSfo9lXp2Cip3KMFmkygAMHAZmLo25z9WooJX
	 gy1SJq6OVTeHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF5B405CE;
	Sun,  1 Nov 2026 17:11:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A96632AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B3C2605E0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pK7o-P9T1_at for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:11:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A825D6061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553060;
 b=Kiphh3vr6/OnbRj+vHquf82c2Rc1nC5mmAsSzvv9KCS7h/0D7ErefTX5gq5QYkO/YDOF
 u9rgpiqdUvi+0SBa8SwsW/ehwYVfEdN38VE/FAr55csrJ7p+5Oe7/NWIf/u8aIbPZppbY
 30EdkavJATs4EInjtLfzTNtQK7rVfoZUESI+OxX5akIrhFV6NoQU6G5fl7LGCA/M6Cd1B
 I6gt33lAahxjTvEAMxhetTQyOVi8JRaOYAQzdf3RvHhpjInc2iGTxGk7e9Ma9MWXjg9vn
 mWkh+dReMceDSKDrw3LaHu7Fmqbf4gyVTfE4nx+57nGuRUlX4G93cYtiErMl3tKRPjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553060;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=c4fiMB0Znd3bD/yLAfCn/PP+hjCETzRz4l551zQUBWEhXIVyzt8g7Q/kI7Uymep0sEr+
 KEGHNlLmBXirxuEPpdV1SIf1j8UXDAc7FBNN5FtGKQTdQez86XocZDhUiuZqNGbBOFmQL
 8LT2jNgWA81XYAI6TwxO3MvmOndL4GGX6AFHeam5vcb3NDqc2cfBsFXrcS6GID/tsnuLP
 n+F6wKyRrES5TsosxRJEcKJzAdYzSisRTVpF2b5EyPpbqfnSWiHS/k0vQkfdK6sWlHpsF
 WcwX+fan0CQtUA9ZYXywwXbn9OUZ44wNZgdDHxSeEb3McvuNqNN1EC+WCpXGfhXofwA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tXtItduC; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A825D6061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BBDBB2003D3;
 Sun,  1 Nov 2026 18:10:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:10:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:10:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-14-james.hilliard1@gmail.com>
References: <20261031172019.2683287-14-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <6277cea2e865ab2ae89e3b432198d3fa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-opentelemetry-api: bump to
 version 1.45.2
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
