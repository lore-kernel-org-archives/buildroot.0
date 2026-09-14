Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F8AC88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 17:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61FBA80D59;
	Mon, 14 Sep 2026 17:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R09Cxiyyf08y; Mon, 14 Sep 2026 17:52:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81CFB80D1F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789408334;
	b=U/XQk+qKooiO1Tmn5IHuhEiucu3sT0UhuBdtK1Pjzay3fSZHFF/ph5a0GNCUPJo756i3
	 ZBzYAA1ZSRRGIo/ZPqN91weXVbJxpPbAFm7rbo3551TmFdclsce2bIICDmuZibs6zsPoi
	 t7s5rIdATwNh5Vx0b4obbep0kFHy4eyIPtHbySKPOPCaWYKJHOj5XjDHM0rUQc/FIrSZN
	 Xv5x0u2tnLkrsKwo6kMnvlvjwYKAqlnfSpKdjeV7yFfRFFOayg9CTACthFWxrEM0tS1BB
	 +7UNzI4T9UqY8BbsoolpFMnfJZDKQfb8H/TB6L3WGBl0LX5wbzuPJoVwBe98Z8Lh9PQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789408334;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=oFJuOaRz+vUWgNCm5M+cdgCs/4Cy7NYlxLchqimPHWw=;
	b=LODxB2eebckT6cnbCBZ3VrptSCV6VF4Mm05G1wVtzlUH3/bgnnyCb5Q+NG3V+LHW0RZI
	 wLpq3GB9gDq2WcchqBZ+yn/SO4LyvyWv2O/GpggIqzGnBVt4JVCiRBvo8iflAc3OnV/Ea
	 qlGUdk1Jv6J9h9wWn3czGm6bNPwIKJnoafJbprFZurE7DCSZ7VnAfiB17TFgRkhzJbixA
	 nM0DgyLQfhQv/y7/faHTRI3MWEPwpYky8Q/LeESWGEgMxN8DtnB5SjWinQ1Zu1MldqU8u
	 9FYr7rJAL6GcEGfPClHcSCofB+0iRaU6ig3BwMRYm8lxpIQcWtkqdqu6wLf87AS02JQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789408334;
	bh=oFJuOaRz+vUWgNCm5M+cdgCs/4Cy7NYlxLchqimPHWw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nw8f1AmeNURGjitUzKd8nUVfi2wNDUzoyMOhiaB09ThasgswkogqeuJntWKcv3CLl
	 AC21hBszSgxB5HmwCSVAHpEwOraZE5Frr3WIPfjmhZjUD6+BS6z2pcXm2LgF/lWTKN
	 PbksJAW4GHf2yFfYMH+7kx2zR29qqr2t7hXhWey1k19pWlYFe6f4GZgSftN2inuS7J
	 ksrKyXXfEIVFzL7Vr89pHHR+ySVYaftoue0j+EDu5GtD6zvDRxMjra0vYymcnDUhHl
	 Ykk6pXKY67udhEki0DbOM7lBJsCr6UYsc0gN+BD35L+9uHj9j6ufxJkZD+4OBEXTo9
	 Pmb5tZNPfWbCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81CFB80D1F;
	Mon, 14 Sep 2026 17:52:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A454F465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 17:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95DA46061E
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 17:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4Zo_R0my7wX for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 17:52:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A1AB96060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789408331;
 b=d61QquUO8J15//z+na2wWMTaqQCXucOzKI5qvxvIN0oLqIbRBeB3aqSRZ2qi5BTgvElz
 B2cWXim7HqtRHT8iMZP0yl/MqXP4bIh0/mobXJKF5lha8+d6N7kT+XT7kFrLt/cs50/N8
 3C5X1hrDzQ4TdgH0gcDCK2iOZLAUzAQVugcet6zrbTiPKr/99atgzBu2XL2xV2C7np6YK
 7Jf55wi70XhFjKdQq6K+KvkB8pN4kN1q++NmV7kuaTr+nvlXeYbBNyWB/5GW8ozta6AMr
 Iej3vFvzHJcB26OJX/YOIAHZwd3UHC+azBseZkYmos0msY6Q8VPsvnbKInc8UU2lG9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789408331;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=BB5mBfHbYD6dLJEny6PF39yA/GGV3rSU0s9K9dVcXp4=;
 b=nNH/+8BRUxvHlgnaXA98s+ri47wI4LpTjsBu8kX/a3PMSJGZWweH3dyUAvgOpXh5+bZC
 OMwKzqVdCrJ7jn5pw736FCGhUjyH2TnDjnd2Ksu7erVFue0JVHXq0EHPNbFJeOzCgjpCm
 l4Hbm4DPNwsgY8Gp2YWivR66WeLdn9KmnKlw5biNSwQQhV/NUlmUvGFm9kTjivAHq5tu9
 J2e14iAbhQMuWwuilKc9e3Hg1yCWxJZd6QD96EG9rxtTKVjEmh8LhpbLlYgIWDC+FfQXY
 YXaXa6Zz0iHetwKIN46EUqa8eyTN2LAZvR+MSDyMIal2fmrCYm3a0n1JucdOujn1+hA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AAHseS7U; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1AB96060D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 17:52:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D0CD819F57B;
 Mon, 14 Sep 2026 19:52:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Sep 2026 19:52:07 +0200
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 19:52:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260914155554.1136170-1-bernd@kuhls.net>
References: <20260914155554.1136170-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <3dfb9eba7f5792cfcd1ae7788ce754c2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

On 14/09/2026 17:55, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 7.2.5 -> 7.2.6
>  - 6.18.51 -> 6.18.52
>  - 6.12.109 -> 6.12.110
>  - 6.6.156 -> 6.6.157
>  - 6.1.187 -> 6.1.188
>  - 5.15.220 -> 5.15.221
>  - 5.10.269 -> 5.10.270
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
