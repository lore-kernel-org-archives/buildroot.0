Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220AD606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QlIr/xY5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E699460609;
	Fri,  6 Nov 2026 17:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4nUmh_fZDnV; Fri,  6 Nov 2026 17:23:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E7A04606EB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793985801;
	b=DtskWJMi5hpNjlZmVWsCUAh4RYMH/MILaQ66y2a617kb08WcRO20LP5uguKMddF/IBsV
	 /kieb/rSW90wnfQvW97Hy+GsQjFUj1071lL1dw7xrWItB8sAQXiVuC10LqpdkIbwYqf4u
	 4l23YBX+P+O9Re6pcQuUshRW78mpSmZFSSsxSEsCgZq9OvdHbNWJAmqlhpEeggKD/IsDX
	 nGWdC6/JRZYeNgm94KkAUB5SMVjmqYFILPB5sk+DEdx34WJ7eT593A1IcpWClOZkCSZv/
	 2lsCH5bltrfV7QZDTy0V0f76IUAh1HitPbLQePe3ceA/UCTgbc2/gcp+12uSx7yb7ig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793985801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=VtSdoRMKOe7QKFPFhA0KrRkEbTRTw/ExV3sXk1RzgIc=;
	b=knKigHBpZ5QTBrhR/EJzh/fq+q7sMorV4cFqQmfklPaYKO6ZhogDQ/L5U5c6boRyD0wq
	 /811YWQTk268MzbcvP1x7jdFaBIADVQmBqv4kec4BTGsNpGP9iS/vKNeO0IILN4WZdR3Y
	 PU2dHtjaqIYH/HyATPONeBiV6xLwYBGZkGQh8u6kH/0rRxYm+5GdnXBJKK6p2ZqQ96VRY
	 KcCSX6wJWVH/zL3QQp56x9Dzl4KeXERmn2QmzM8nCtcg06BG4i4fgZQF5vYfShip9cStZ
	 xFu1qvxWBbs89KHx4HKYaPuRCBIAAo5o3ojy9LRWqbRsG9gGt7uZ4b99F/rCaXtLeug==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793985801;
	bh=VtSdoRMKOe7QKFPFhA0KrRkEbTRTw/ExV3sXk1RzgIc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QlIr/xY5varyFxlRxBe5a0rtgzSsXSCcRL+LZ4RzMZ8D+cbrxYi+nN8pAgaWcRJ7y
	 ow/rPqnOoDJXyjc6+JhC5CKQfutGcFkyh0LCF3yioO+93SMPj6pvvRXyqlwv7fM3PA
	 IOXkPzEqN2064a+gPKkiAuMrhKxaQI+KTIP3Q7fdTV3oR8YAZ0YqCpfZVWwouXFXTp
	 Occ1qmD6mn62mgRXFDepWMA1b3CN4Snat8t2lgYFv/SBIlzaOWGUYLdui36LpnRYfH
	 g7QETkH8lX9nq1PdmAKAYZXW0xc6zb8cni+OwSfZEDXZ4SKpuUM3/teWvCZMGVqIXj
	 eJcRogNIB6xBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A04606EB;
	Fri,  6 Nov 2026 17:23:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD59632A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3043606EB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZrszyeoeO8a for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:23:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B2A960609
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B2A960609
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:23:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 837092003E3;
 Fri,  6 Nov 2026 18:23:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 18:23:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 18:23:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Fabio Urquiza
 <fabiorush@gmail.com>
In-Reply-To: <20261105210403.2105760-1-bernd@kuhls.net>
References: <20261105210403.2105760-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <15ec6fb95c8be591c84b3a1ad2afd1c6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: bump version to 32.1
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

On 05/11/2026 22:04, Bernd Kuhls wrote:
> https://bitcoincore.org/en/releases/32.1/
> https://bitcoincore.org/en/releases/31.2/
> https://bitcoincore.org/en/releases/31.1/
> 
> Removed patch 0001 due to the upstream removal of the libevent
> dependency in version 32.1.
> Also removed the dependency on the libevent package.
> 
> Renumbered and rebased remaining patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
