Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74887CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 15:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6017060748;
	Mon,  5 Oct 2026 15:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id you1XKZpGDr8; Mon,  5 Oct 2026 15:58:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF46D6070C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791215927;
	b=OQa4o5/8Te0S/bXPOEHdG+6775Dg3j5+6QpY1eV+XZDVJv4DgHOD+HExsubrsupoGR/9
	 HQm5L2EIb9jq/EeixTe9bEQo2AtJwDNu+FbTj8WLHXP9+YBO/z/05yqFXSJqQnJll0LE3
	 4m/PlREJSzTaQrZax2QOWlP14f7kBuCZILRGQjjd7wudBtiv12KZjrIOLCIciQ6rc5S0Z
	 8dR2Vxo1fPleBPm+OuxLv/PwqpjmC9oefkRf1Kmcc84UmDGCmu4AMdiX4xXY0kAHl/HJi
	 J6yJAaDPK3C9bCE/V9JjZttz/nQnSx5f242NzGa7Y45qWqyQ1wWkp+Ub2NH0O3SMITw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791215927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mS1FKZE1MAeVAKElKztjoyhGGVpnZKTG7BurnWrpeSo=;
	b=oaQCDKsbmh+0uaZt1U6Oq7K3SD5XHRbqepwepU/3z3N4Edyc2BGf1YODZf5b70hStfa8
	 GMngH1nHqnKaqN1NSoD09sVMAYVmLHmPeb1TAEBTzmkSHvEK00CyBQk8EipSB5sE8NicN
	 ZNV3nTe4GuBhS9u6SqWdtZIpJzvVVe7QLXh0UC167QRxC+M3jADgSxEf/r8mKQRvorBdo
	 P+G2+q2aJgq+gLrDQ6WxhjClHPhfXIAKiJx9FkPVghKFB3UvdEWv3aGSAmOQPA5OSIanH
	 sA5r9vJrux731x7V8DSUWCJQkJlCFpEXr4HuZX+HJftVsIA7Tvgvygq+yEQE83HR8yQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791215927;
	bh=mS1FKZE1MAeVAKElKztjoyhGGVpnZKTG7BurnWrpeSo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iToprnRWCLExGd0zXxykKfd75fvHUnZdWWliy4Pkm0SD3RiSXaSGQBC2Y/0i0tCUw
	 u4BmuXYSMAhjyH1gCUY+GPo3sV3klBoZp/cXXr8bwBfGKgX59wQEcE4aezrJobLjtx
	 ty+YS10/hiW8kIS9cxjwnKRtxCGIiLZAEwg8JC2AWT7o3kqDiwsToMEunZDvwA6hFm
	 1ytNGX9ArBUh4g24DbXQOcY1Ohf1LUuuq4Dn1FLDiafaPmO7xJ74cC96Ntj8m9OvdK
	 iTQv07b+OFHH6KDi/qwAhjjkC+cHr7kwUQOwvh9eaBoBmEd0G1ZluJTEtJa7iEWh9G
	 lfXkeKcf8i72w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF46D6070C;
	Mon,  5 Oct 2026 15:58:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D327338
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D46C605E8
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxFcL3SFmvK9 for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 15:48:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D8703605DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791215327;
 b=N1+K7/Ha8WO9LXONqPWUtetY+cLrSqPZUmkVyxIKM8c9q+SeQhihn6FYnePK2LZR6YpT
 +nw8yRFQbdjdfc6Nr04kx0LyE6B0mq3tnfsRiFp+/WFuR1J4UScbG2Ns066YnnqkBI0A+
 y2b6n95febSUmE/ENEMBLpMkYoNy6Ch4ZdyL40KtDIWvZxJG3e6gWn0TfxZk3GHnxUn7J
 bVreKaPcroDcuYx5DxnWP3+WjEWMDpimZDNQVyqee/NWGhda8z4FqEhV6pc33jLnGTA3f
 Gfpjpu3wOiPlCKlU6Dyw5DngoiUg7Jgu/WvJ5CWubRE52h6I2DWUk3qld135zxYQSXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791215327;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=gKcKcM1vNzw5tiWKD9Ozyvu4Jy8I4mx82OdU6XtlnnA=;
 b=IcrTc6aVNLCwvP0FXy9n7zBlRfTN3VBFE2E9Hs9Ag1Wv8c8ixyiHkmoRQtsMK61I1y4h
 ssryFo3pTJBmJk73Rp3dOyvPYLhDpdqlnhkc9iX6190XoyUnB4Ron9RWqCjHWkhJ1cuX2
 0CxzlYvFGnMHJE1MMQCjtBwHmeXO4Ra1X0PcSYwCaPUd+e7NO6HKsBrG0gUCe44JWPknL
 +bE4xv0xy5eBZnsQx83k4r7aXPjwEePF1gP827T+x4cppsRB0aoWbQWcWFPz8NxKUSl51
 ukYHhvwM0PLEc7J7w67yHPy90/5PVV4OYdBYgdul3neaQrA7uerTLca/Za+UtVXQpWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dgTsHAcW; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8703605DE
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:48:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1A9DB6012F;
 Mon,  5 Oct 2026 17:48:42 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:43870])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Oct 2026 17:48:42 +0200
MIME-Version: 1.0
Date: Mon, 05 Oct 2026 17:48:42 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261005135659.758139-1-yegorslists@gmail.com>
References: <20261005135659.758139-1-yegorslists@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <99bff65022ccc5adc9890ccf571c6d25@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.7
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

On 05/10/2026 15:56, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For more information about the release, see:
> 
> - https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7
> - 
> https://github.com/Mbed-TLS/mbedtls/compare/mbedtls-3.6.6..mbedtls-3.6.7
[...]
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
