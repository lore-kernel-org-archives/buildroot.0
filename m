Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1197CD484E
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491A640854;
	Mon, 11 May 2026 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFA9dVzMU9MV; Mon, 11 May 2026 19:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D920640850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778528286;
	bh=jaSzuV60H3clFVYy/R6hwXiFAckzcVeYQRrTRb0UvwY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=amE78I9U8gTPwYXbmn04oCk5lpShsX4YhW+qgVU9qMqkhPD31QtoB/HA6btHKX40y
	 2oVhmuGur4VizTC585Rpu3VNSGrDQ4cvZ1K6BMFct9+Vv8YsvZ4d9zjZ80JBCDtruO
	 CEtjZ6pwkOXlBFSS7VuHyx9iwm3sIufE1dFXYdQhEDztHR7gOw9XcCIEWNQyW7VOwu
	 dwhlDNaIJMx1MylS0yKAynd5/cOizMuxUd60Y+PsOAGb3TCHybXpDzxd5N4/b9EP7d
	 Qi24+Ezz+FnY3mrP/QwC+tGVBwv+wGurG6IzYV3LWRj0rXl7g7iWzxK7CpwdiWFanE
	 HKrpoQ9JMpIcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D920640850;
	Mon, 11 May 2026 19:38:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB42B2C0
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD5A1606CC
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKeea5qzHN8S for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A12E4606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A12E4606CB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A12E4606CB
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:38:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D936519F58A;
 Mon, 11 May 2026 21:38:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 May 2026 21:38:00 +0200
MIME-Version: 1.0
Date: Mon, 11 May 2026 21:38:00 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260503190251.852569-1-chakrabortyshubham66@gmail.com>
References: <20260503190251.852569-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <cc2108f5cccbce369a572f489df86545@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778528282;
 bh=QZVD8lD5mrJNtfpYA8FY2Wh7DGjIfZivrij6msmQQP0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kxNmlxtiQQe//v1bOCfE/uVx7nPeiiltaU9LmgfsmS3Mx15uskzz1PwyGQ+4ScFLt
 WK2b1gHP7Vk01b5iisX7hqlMyV55zwEzOHSqPEkEL6RCeaDCZfCmVLAEMTj5zs58T3
 0GO92ZaHFq+S/+Ltyt8SSBHl7BwmkSlsQ4yPdb7UG3mtWA4f8E8KbfyjJeJPS78pdx
 ri8EBcuCQ8b5jN41w8+YeJnJG7E9947Lg5Jgz4kDlKbDiPxLO7Ow37He0ApdGg0Hd6
 kYwqs7XMr5qnZNV1QmE5+OK3TgSGJ7z5Eam7hrHLuTTbl/dWgVkyjxwjRb56u9dOsc
 /8ZVZRiVJzx4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kxNmlxti
Subject: Re: [Buildroot] [PATCH] package/dos2unix: update upstream URLs
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

On 03/05/2026 21:02, Shubham Chakraborty wrote:
> The old upstream page is being deprecated. Update the homepage,
> download site and hash file URL to the new upstream location.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
